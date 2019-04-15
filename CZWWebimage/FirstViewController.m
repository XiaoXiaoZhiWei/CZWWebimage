//
//  FirstViewController.m
//  CZWWebimage
//
//  Created by dingdang on 2019/4/15.
//  Copyright © 2019 dingdang. All rights reserved.
//

#import "FirstViewController.h"
#import "CZWLibWebimage/UIImageView+Download.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 500, 100, 100)];
    imageView2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:imageView2];
    NSString *imageUrlStr2 = @"https://user-gold-cdn.xitu.io/2019/3/25/169b406dfc5fe46e";
    [imageView2 downloadImageWithUrlStr:imageUrlStr2 completionHandler:^(UIImage * _Nonnull image) {
        imageView2.image = image;
    }];
}


@end
