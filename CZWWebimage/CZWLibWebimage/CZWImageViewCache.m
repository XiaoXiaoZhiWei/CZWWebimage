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

-(void)setImage:(UIImage *)image forkey:(NSString *)urlStr
{
    [_imageCache setObject:image forKey:urlStr];
}

-(UIImage *)getCacheImageWithUrlStr:(NSString *)UrlStr
{
    id image = [_imageCache objectForKey:UrlStr];
    if ([image isKindOfClass:[UIImage class]]) {
        return image;
    } else {
        return nil;
    }
    
}

@end
