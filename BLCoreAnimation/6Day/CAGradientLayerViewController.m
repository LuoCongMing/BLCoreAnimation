//
//  CAGradientLayerViewController.m
//  BLCoreAnimation
//
//  Created by 周建波 on 2017/3/20.
//  Copyright © 2017年 scqc. All rights reserved.
//

#import "CAGradientLayerViewController.h"

@interface CAGradientLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation CAGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CAGradientLayer *layer = [[CAGradientLayer alloc]init];
    
    //locations 和 colors 个数必须相同，不然会渐变失败
    layer.locations = @[@0.2,@0.5,@0.8];
    layer.colors = @[(id)[UIColor blueColor].CGColor,(id)[UIColor orangeColor].CGColor,(id)[UIColor grayColor].CGColor];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);
    
    
    layer.frame = _contentView.bounds;
    [_contentView.layer addSublayer:layer];
    
}


@end
