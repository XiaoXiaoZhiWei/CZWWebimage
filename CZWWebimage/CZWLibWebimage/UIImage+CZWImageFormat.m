//
//  UIImage+CZWImageFormat.m
//  CZWWebimage
//
//  Created by dingdang on 2019/4/22.
//  Copyright © 2019 dingdang. All rights reserved.
//

#import "UIImage+CZWImageFormat.h"

static NSString *imagesGetterKey = @"imagesGetterKey";   //定义一个key值
static NSString *imageFormatGetterKey = @"imageFormatGetterKey";   //定义一个key值

@implementation UIImage (CZWImageFormat)

- (void)setImages:(NSArray *)images
{
    objc_setAssociatedObject(self, &imagesGetterKey, images, OBJC_ASSOCIATION_COPY);
}

- (NSArray *)images
{
    NSArray *images = objc_getAssociatedObject(self, &imagesGetterKey);
    if ([images isKindOfClass:[NSArray class]]) {
        return images;
    }
    return nil;
}

- (void)setImageFormat:(JImageFormat)imageFormat {
    objc_setAssociatedObject(self, &imageFormatGetterKey, @(imageFormat), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (JImageFormat)imageFormat {
    JImageFormat imageFormat = JImageFormatUndefined;
    NSNumber *value = objc_getAssociatedObject(self, &imageFormatGetterKey);
    if ([value isKindOfClass:[NSNumber class]]) {
        imageFormat = value.integerValue;
        return imageFormat;
    }
    return imageFormat;
}

@end
