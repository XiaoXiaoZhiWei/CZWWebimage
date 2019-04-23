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

//png格式是带alpha通道的，而jpeg没有。因此，我们可以根据是否含有alpha通道来判断.
+ (BOOL)containsAlphaWithCGImage:(CGImageRef)imageRef {
    if (!imageRef) {
        return NO;
    }
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef);
    BOOL hasAlpha = !(alphaInfo == kCGImageAlphaNone || alphaInfo == kCGImageAlphaNoneSkipFirst || alphaInfo == kCGImageAlphaNoneSkipLast);
    return hasAlpha;
}

+ (void)saveImage:(NSData *)imageData forUrlStr:(NSString *)urlStr
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        /**
        NSData *imageData = nil;
        if ([CZWImageViewFileManager containsAlphaWithCGImage:image.CGImage]) {
            imageData = UIImagePNGRepresentation(image);
        } else {
            imageData = UIImageJPEGRepresentation(image, 1.0);
        }
         */

        NSString *filePath = [CZWImageViewFileManager imageDiskFilePathByUrlStr:urlStr];
        [imageData writeToFile:filePath atomically:YES];
    });
}

+ (void)getDiskImageWithUrlStr:(NSString *)urlStr completeHandle:(void (^) (NSData *))completionBlock
{
    NSString *filePath = [CZWImageViewFileManager imageDiskFilePathByUrlStr:urlStr];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = [NSData dataWithContentsOfFile:filePath];
//        [UIImage imageWithData:data]
//        UIImage *image = [[CZWImageCoder shareCoder] decodeImageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(data);
        });
    });
}

@end
