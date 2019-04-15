//
//  CZWImageViewFileManager.m
//  CZWWebimage
//
//  Created by dingdang on 2019/4/15.
//  Copyright © 2019 dingdang. All rights reserved.
//  文件管理器

#import "CZWImageViewFileManager.h"
#import "NSString+MD5.h"

@implementation CZWImageViewFileManager
//获取Documents目录路径
+ (NSString *)documentPath
{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject];
    NSLog(@"docDir=%@",docDir);
    return docDir;
}

+ (NSString *)imageDiskFilePathByUrlStr:(NSString *)urlStr
{
    //url  -> 文件名 -> 存储路径
    NSString *MD5FileName = [urlStr diskFileNameForKey:urlStr];
    NSString *fileName = [NSString stringWithFormat:@"%@.png",MD5FileName];
    NSString *docDir = [CZWImageViewFileManager documentPath];
    NSString *filePath = [docDir stringByAppendingPathComponent:fileName];
    NSLog(@"filePath=%@",filePath);
    return filePath;
}

+ (BOOL)saveImage:(UIImage *)image forUrlStr:(NSString *)urlStr
{
    NSData *imageData = UIImagePNGRepresentation(image);
    NSString *filePath = [CZWImageViewFileManager imageDiskFilePathByUrlStr:urlStr];
    BOOL isSave = [imageData writeToFile:filePath atomically:YES];
    return isSave;
}

+ (UIImage *)getDiskImageWithUrlStr:(NSString *)urlStr
{
    NSString *filePath = [CZWImageViewFileManager imageDiskFilePathByUrlStr:urlStr];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

@end
