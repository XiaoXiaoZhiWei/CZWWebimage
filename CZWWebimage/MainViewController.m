//
//  mainViewController.m
//  CZWWebimage
//
//  Created by dingdang on 2019/4/15.
//  Copyright © 2019 dingdang. All rights reserved.
//

#import "MainViewController.h"
#import "CZWLibWebimage/UIImageView+Download.h"
#import "FirstViewController.h"
#import "UIImage+CZWImageFormat.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 300, 200, 200)];
    imageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:imageView];
//    NSString *imageUrlStr = @"https://user-gold-cdn.xitu.io/2019/3/25/169b406dfc5fe46e";
    NSString *imageUrlStr = @"https://user-gold-cdn.xitu.io/2019/3/27/169bce612ee4dc21";
    [imageView downloadImageWithUrlStr:imageUrlStr completionHandler:^(UIImage * _Nonnull image) {
        if (image.imageFormat == 2) {
            imageView.animationImages = image.images;
            [imageView startAnimating];
        } else {
           imageView.image = image;
        }
        
    }];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(80, 100, 60, 30);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)next {
    [self.navigationController pushViewController:[[FirstViewController alloc] init] animated:true];
}

@end
