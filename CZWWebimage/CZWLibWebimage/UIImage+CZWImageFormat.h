//
//  UIImage+CZWImageFormat.h
//  CZWWebimage
//
//  Created by dingdang on 2019/4/22.
//  Copyright © 2019 dingdang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JImageFormat) {
    JImageFormatUndefined = -1,
    JImageFormatJPEG = 0,
    JImageFormatPNG = 1,
    JImageFormatGIF = 2
};

@interface UIImage (CZWImageFormat)

@property (nonatomic, assign) JImageFormat imageFormat;
@property (nonatomic, copy) NSArray *images;
@property (nonatomic) NSTimeInterval animationDuration;         // for one cycle of images. default is number of images * 1/30th of a second (i.e. 30 fps)
@property (nonatomic) NSInteger      animationRepeatCount;

@end

NS_ASSUME_NONNULL_END
