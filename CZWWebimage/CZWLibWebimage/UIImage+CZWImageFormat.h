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

@end

NS_ASSUME_NONNULL_END
