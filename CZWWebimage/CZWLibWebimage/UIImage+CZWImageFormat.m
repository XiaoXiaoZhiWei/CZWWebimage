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
static NSString *imageAnimationDurationGetterKey = @"imageAnimationDurationGetterKey";   //定义一个key值
static NSString *imageRepeatCountGetterKey = @"imageRepeatCountGetterKey";   //定义一个key值

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

- (void)setAnimationDuration:(NSTimeInterval)animationDuration
{
    objc_setAssociatedObject(self, @selector(animationDuration), @(animationDuration), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSTimeInterval)animationDuration
{
    NSNumber *value = objc_getAssociatedObject(self, @selector(animationDuration));
    if ([value isKindOfClass:[NSNumber class]]) {
        return value.floatValue;
    }
    return 0;
}

- (void)setAnimationRepeatCount:(NSInteger)animationRepeatCount
{
    objc_setAssociatedObject(self, @selector(animationDuration), @(animationRepeatCount), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSInteger)animationRepeatCount
{
    NSNumber *value = objc_getAssociatedObject(self, @selector(animationDuration));
    if ([value isKindOfClass:[NSNumber class]]) {
        return value.integerValue;
    }
    return 0;
}

@end
