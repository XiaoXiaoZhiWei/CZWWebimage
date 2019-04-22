//
//  CZWImageViewCache.h
//  CZWWebimage
//
//  Created by dingdang on 2019/4/10.
//  Copyright © 2019 dingdang. All rights reserved.
//  缓存类

#import <UIKit/UIKit.h>
#import "CZWImageCoder.h"

NS_ASSUME_NONNULL_BEGIN

@interface CZWImageViewCache : NSObject

@property (nonatomic,strong) NSCache *imageCache;

+(CZWImageViewCache *)shareInstance;
-(void)setImage:(NSData *)imageData forkey:(NSString *)urlStr;
-(UIImage *)getCacheImageWithUrlStr:(NSString *)UrlStr;

@end

NS_ASSUME_NONNULL_END
