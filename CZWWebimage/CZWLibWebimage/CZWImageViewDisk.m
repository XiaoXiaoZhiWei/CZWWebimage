//
//  CZWImageViewDisk.m
//  CZWWebimage
//
//  Created by dingdang on 2019/4/15.
//  Copyright © 2019 dingdang. All rights reserved.
//  硬盘存储：存到沙盒

#import "CZWImageViewDisk.h"

@implementation CZWImageViewDisk

+(CZWImageViewDisk *)shareInstance
{
    static CZWImageViewDisk *_disk;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _disk = [[CZWImageViewDisk alloc] init];
    });
    return _disk;
}

-(void)setImage:(NSData *)imageData forkey:(NSString *)urlStr
{
    [CZWImageViewFileManager saveImage:imageData forUrlStr:urlStr];
}

-(void)getDiskImageWithUrlStr:(NSString *)UrlStr completeHandle:(void (^) (NSData *))completionBlock
{
    [CZWImageViewFileManager getDiskImageWithUrlStr:UrlStr completeHandle:^(NSData *data) {
        completionBlock(data);
    }];
    
}

@end
