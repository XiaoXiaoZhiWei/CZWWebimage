//
//  UIImageView+download.m
//  CZWWebimage
//
//  Created by dingdang on 2019/4/10.
//  Copyright © 2019 dingdang. All rights reserved.
//

#import "UIImageView+Download.h"

@implementation UIImageView (Download)

- (void)downloadImageWithUrlStr:(NSString *)urlStr completionHandler:(DownloadBlock)downloadBlock
{
    //1.内存先取。
    UIImage *cacheImage = [[CZWImageViewCache shareInstance] getCacheImageWithUrlStr:urlStr];
    if (cacheImage != nil) {
        downloadBlock(cacheImage);
        NSLog(@"1.内存先取。");
        return;
    }
    //2.内存没有，硬盘再取。
    [[CZWImageViewDisk shareInstance] getDiskImageWithUrlStr:urlStr completeHandle:^(UIImage * diskImage) {
      if (diskImage != nil) {
          //1.内存缓存
          [[CZWImageViewCache shareInstance] setImage:diskImage forkey:urlStr];
          downloadBlock(diskImage);
          NSLog(@"2.内存没有，硬盘再取。");
          return;
      }
        
        //3.硬盘没有，网络获取。
        NSLog(@"3.内存没有,硬盘没有，网络获取。");
        __block UIImage *image = nil;
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        NSURL *url = [NSURL URLWithString:urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                NSLog(@"%@", [NSString stringWithFormat:@"下载错误:error=%@",error]);
                return ;
            }
            image = [UIImage imageWithData:data];
            //1.内存缓存
            [[CZWImageViewCache shareInstance] setImage:image forkey:urlStr];
            //2.硬盘缓存
            [[CZWImageViewDisk shareInstance] setImage:image forkey:urlStr];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                downloadBlock(image);
            });
            
        }];
        [dataTask resume];
    }];
    
    
}

@end
