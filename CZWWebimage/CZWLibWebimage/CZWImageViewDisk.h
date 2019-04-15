//
//  CZWImageViewDisk.h
//  CZWWebimage
//
//  Created by dingdang on 2019/4/15.
//  Copyright © 2019 dingdang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZWImageViewFileManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface CZWImageViewDisk : NSObject

+(CZWImageViewDisk *)shareInstance;

-(void)setImage:(UIImage *)image forkey:(NSString *)urlStr;
-(void)getDiskImageWithUrlStr:(NSString *)UrlStr completeHandle:(void (^) (UIImage *))completionBlock;

@end

NS_ASSUME_NONNULL_END
