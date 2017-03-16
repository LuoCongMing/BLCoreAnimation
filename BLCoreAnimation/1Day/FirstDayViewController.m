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
{
    
    CALayer*blueLayer;
}
@property (weak, nonatomic) IBOutlet UIView *layerView;
@end
@implementation FirstDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // image 加到view 上面
    blueLayer = [[CALayer alloc]init];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [_layerView.layer addSublayer:blueLayer];
    
    UIImage*image = [UIImage imageNamed:@"flowers"];
    blueLayer.contents = (__bridge id)image.CGImage;
    
    // contentsGravity 相当于view 中的 contentModel属性，用来控制显示内容
    blueLayer.contentsGravity = kCAGravityResize;
   
    //contentsScale 这个属性的值用来控制每一个点显示多少个像素、1.0的时候就是一个像素一个点、2.0的时候就2*2个像素一个点（retina屏）,当设置为kCAGravityResizeAspect的时候这个值是无效的
//    blueLayer.contentsScale = image.scale;
    
    //设置了 是否裁剪边界外的内容 对应的view方法叫 clipsToBounds
    
    blueLayer.masksToBounds = YES;
    
    // contentsRect 这个属性和contentsGravity 有点类似 默认（0,0,1,1）显示全部 如果要显示上半部分（0,0,1,0.5）; 可以利用这个属性做一些图片剪切 比较好用的属性
    blueLayer.contentsRect = CGRectMake(0, 0, 1, 1);
    
}
- (IBAction)contentsRectDemo:(UIButton *)sender {
    
    ContentsRectViewController*content = [ContentsRectViewController new];
    [self.navigationController pushViewController:content animated:YES];
    
}
- (IBAction)contentCenter:(id)sender {
    
    //contentsCenter 其实是一个CGRect，它定义了一个固定的边框和一个在图 层上可拉伸的区域。 改变 contentsCenter 的值并不会影响到寄宿图的显示，除 非这个图层的大小改变了，你才看得到效果。  默认是{0, 0, 1, 1}
    
    blueLayer.contentsCenter = CGRectMake(0.5, 0, 0.5, 0.5);//设置拉伸范围为左下角
}


@end
