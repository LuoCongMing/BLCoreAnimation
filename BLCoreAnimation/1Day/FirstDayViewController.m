//
//  FirstDayViewController.m
//  BLCoreAnimation
//
//  Created by 周建波 on 2017/3/15.
//  Copyright © 2017年 scqc. All rights reserved.
//

#import "FirstDayViewController.h"
#import "ContentsRectViewController.h"

@interface FirstDayViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation FirstDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // image 加到view 上面
    CALayer*blueLayer = [[CALayer alloc]init];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [_layerView.layer addSublayer:blueLayer];
    
    UIImage*image = [UIImage imageNamed:@"1day"];
    blueLayer.contents = (__bridge id)image.CGImage;
    
    // contentsGravity 相当于view 中的 contentModel属性，用来控制显示内容
    blueLayer.contentsGravity = kCAGravityResizeAspect;
   
    //contentsScale 这个属性的值用来控制每一个点显示多少个像素、1.0的时候就是一个像素一个点、2.0的时候就2*2个像素一个点（retina屏）,当设置为kCAGravityResizeAspect的时候这个值是无效的
    blueLayer.contentsScale = image.scale;
    
    //设置了 是否裁剪边界外的内容 对应的view方法叫 clipsToBounds
    
    blueLayer.masksToBounds = YES;
    
    // contentsRect 这个属性和contentsGravity 有点类似 默认（0,0,1,1）显示全部 如果要显示上半部分（0,0,1,0.5）; 可以利用这个属性做一些图片剪切 比较好用的属性
    blueLayer.contentsRect = CGRectMake(0, 0, 1, 1);
    
}
- (IBAction)contentsRectDemo:(UIButton *)sender {
    
    ContentsRectViewController*content = [ContentsRectViewController new];
    [self.navigationController pushViewController:content animated:YES];
    
}


@end
