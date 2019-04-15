//
//  UIImageView+download.h
//  CZWWebimage
//
//  Created by dingdang on 2019/4/10.
//  Copyright © 2019 dingdang. All rights reserved.
//  下载类

#import <UIKit/UIKit.h>
#import "CZWImageViewDisk.h"
#import "CZWImageViewCache.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^DownloadBlock) (UIImage *);

@interface UIImageView (Download)

/**
 下载图片
 
 @param urlStr 下载地址
 @param downloadBlock 完成下载回调，返回下载图片
 */
- (void)downloadImageWithUrlStr:(NSString *)urlStr completionHandler:(DownloadBlock)downloadBlock;
@end

NS_ASSUME_NONNULL_END
