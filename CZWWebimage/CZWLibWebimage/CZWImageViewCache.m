//
//  CZWImageViewCache.m
//  CZWWebimage
//
//  Created by dingdang on 2019/4/10.
//  Copyright © 2019 dingdang. All rights reserved.
//  

#import "CZWImageViewCache.h"

@implementation CZWImageViewCache


+(CZWImageViewCache *)shareInstance
{
    static CZWImageViewCache *cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[CZWImageViewCache alloc] init];
    });
    return cache;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageCache = [[NSCache alloc] init];
    }
    return self;
}

-(void)setImage:(NSData *)imageData forkey:(NSString *)urlStr
{
    [_imageCache setObject:imageData forKey:urlStr];
}

-(UIImage *)getCacheImageWithUrlStr:(NSString *)UrlStr
{
    UIImage *image = nil;
    id imageData = [_imageCache objectForKey:UrlStr];
    if ([imageData isKindOfClass:[NSData class]]) {
//        return image;
        image = [[CZWImageCoder shareCoder] decodeImageWithData:imageData];
        return image;
    } else {
        return nil;
    }
    
}

@end
