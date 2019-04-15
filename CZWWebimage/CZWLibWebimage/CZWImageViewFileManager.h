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

+ (NSString *)imageDiskFilePathByUrlStr:(NSString *)urlStr;
+ (BOOL)saveImage:(UIImage *)image forUrlStr:(NSString *)urlStr;
+ (UIImage *)getDiskImageWithUrlStr:(NSString *)urlStr;

@end

NS_ASSUME_NONNULL_END
