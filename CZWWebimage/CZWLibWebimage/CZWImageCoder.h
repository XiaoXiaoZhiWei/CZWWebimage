//
//  CZWImageCoder.h
//  CZWWebimage
//
//  Created by dingdang on 2019/4/22.
//  Copyright © 2019 dingdang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+CZWImageFormat.h"

NS_ASSUME_NONNULL_BEGIN

@interface CZWImageCoder : NSObject

+(instancetype)shareCoder;
-(UIImage *)decodeImageWithData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
