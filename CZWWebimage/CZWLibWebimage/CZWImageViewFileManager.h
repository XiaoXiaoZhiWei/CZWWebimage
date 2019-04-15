//
//  CZWImageViewFileManager.h
//  CZWWebimage
//
//  Created by dingdang on 2019/4/15.
//  Copyright © 2019 dingdang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZWImageViewFileManager : NSObject

+ (BOOL)containsAlphaWithCGImage:(CGImageRef)imageRef;
+ (NSString *)imageDiskFilePathByUrlStr:(NSString *)urlStr;
+ (void)saveImage:(UIImage *)image forUrlStr:(NSString *)urlStr;
+ (void)getDiskImageWithUrlStr:(NSString *)urlStr completeHandle:(void (^) (UIImage *))completionBlock;

@end

NS_ASSUME_NONNULL_END
