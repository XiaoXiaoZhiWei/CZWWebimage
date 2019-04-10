//
//  ViewController.m
//  CZWWebimage
//
//  Created by dingdang on 2019/4/9.
//  Copyright © 2019 dingdang. All rights reserved.
//

#import "ViewController.h"
#import "CZWLibWebimage/CZWDownload.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 300, 200, 200)];
    imageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:imageView];
  
    NSString *imageUrlStr = @"https://user-gold-cdn.xitu.io/2019/3/25/169b406dfc5fe46e";
    [CZWDownload downloadImageWithUrlStr:imageUrlStr completionHandler:^(UIImage *image) {
        
        imageView.image = image;
    }];
}


@end
