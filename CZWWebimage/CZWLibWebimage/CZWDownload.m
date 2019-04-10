//
//  CZWDownload.m
//  CZWWebimage
//
//  Created by dingdang on 2019/4/10.
//  Copyright © 2019 dingdang. All rights reserved.
//

#import "CZWDownload.h"



@implementation CZWDownload

+ (void)downloadImageWithUrlStr:(NSString *)urlStr completionHandler:(DownloadBlock)downloadBlock
{
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
        dispatch_async(dispatch_get_main_queue(), ^{
            image = [UIImage imageWithData:data];
            downloadBlock(image);
        });
        
    }];
    [dataTask resume];
}

@end
