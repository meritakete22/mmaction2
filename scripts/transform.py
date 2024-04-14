import mmcv
import decord
import numpy as np
from mmcv.transforms import TRANSFORMS, BaseTransform, to_tensor
from mmaction.structures import ActionDataSample


@TRANSFORMS.register_module()
class VideoInit(BaseTransform):
    def transform(self, results):
        container = decord.VideoReader(results['filename'])
        results['total_frames'] = len(container)
        results['video_reader'] = container
        return results


@TRANSFORMS.register_module()
class VideoSample(BaseTransform):
    def __init__(self, clip_len, num_clips, test_mode=False):
        self.clip_len = clip_len
        self.num_clips = num_clips
        self.test_mode = test_mode

    def transform(self, results):
        total_frames = results['total_frames']
        interval = total_frames // self.clip_len

        if self.test_mode:
            # Make the sampling during testing deterministic
            np.random.seed(42)

        inds_of_all_clips = []
        for i in range(self.num_clips):
            bids = np.arange(self.clip_len) * interval
            offset = np.random.randint(interval, size=bids.shape)
            inds = bids + offset
            inds_of_all_clips.append(inds)

        results['frame_inds'] = np.concatenate(inds_of_all_clips)
        results['clip_len'] = self.clip_len
        results['num_clips'] = self.num_clips
        return results


@TRANSFORMS.register_module()
class VideoDecode(BaseTransform):
    def transform(self, results):
        frame_inds = results['frame_inds']
        container = results['video_reader']

        imgs = container.get_batch(frame_inds).asnumpy()
        imgs = list(imgs)

        results['video_reader'] = None
        del container

        results['imgs'] = imgs
        results['img_shape'] = imgs[0].shape[:2]
        return results


@TRANSFORMS.register_module()
class VideoResize(BaseTransform):
    def __init__(self, r_size):
        self.r_size = (np.inf, r_size)

    def transform(self, results):
        img_h, img_w = results['img_shape']
        new_w, new_h = mmcv.rescale_size((img_w, img_h), self.r_size)

        imgs = [mmcv.imresize(img, (new_w, new_h))
                for img in results['imgs']]
        results['imgs'] = imgs
        results['img_shape'] = imgs[0].shape[:2]
        return results


@TRANSFORMS.register_module()
class VideoCrop(BaseTransform):
    def __init__(self, c_size):
        self.c_size = c_size

    def transform(self, results):
        img_h, img_w = results['img_shape']
        center_x, center_y = img_w // 2, img_h // 2
        x1, x2 = center_x - self.c_size // 2, center_x + self.c_size // 2
        y1, y2 = center_y - self.c_size // 2, center_y + self.c_size // 2
        imgs = [img[y1:y2, x1:x2] for img in results['imgs']]
        results['imgs'] = imgs
        results['img_shape'] = imgs[0].shape[:2]
        return results


@TRANSFORMS.register_module()
class VideoFormat(BaseTransform):
    def transform(self, results):
        num_clips = results['num_clips']
        clip_len = results['clip_len']
        imgs = results['imgs']

        # [num_clips*clip_len, H, W, C]
        imgs = np.array(imgs)
        # [num_clips, clip_len, H, W, C]
        imgs = imgs.reshape((num_clips, clip_len) + imgs.shape[1:])
        # [num_clips, C, clip_len, H, W]
        imgs = imgs.transpose(0, 4, 1, 2, 3)

        results['imgs'] = imgs
        return results


@TRANSFORMS.register_module()
class VideoPack(BaseTransform):
    def __init__(self, meta_keys=('img_shape', 'num_clips', 'clip_len')):
        self.meta_keys = meta_keys

    def transform(self, results):
        packed_results = dict()
        inputs = to_tensor(results['imgs'])
        data_sample = ActionDataSample()
        data_sample.set_gt_label(results['label'])
        metainfo = {k: results[k] for k in self.meta_keys if k in results}
        data_sample.set_metainfo(metainfo)
        packed_results['inputs'] = inputs
        packed_results['data_samples'] = data_sample
        return packed_results