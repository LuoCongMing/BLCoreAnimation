//
//  HitTestViewController.m
//  BLCoreAnimation
//
//  Created by 周建波 on 2017/3/17.
//  Copyright © 2017年 scqc. All rights reserved.
//

#import "HitTestViewController.h"
#import "CGAffineTransformViewController.h"

@interface HitTestViewController ()
@property (weak, nonatomic) IBOutlet UIView *LayerView;
@property(nonatomic,strong)CALayer*blueLayer;

@end

@implementation HitTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.blueLayer = [[CALayer alloc]init];
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    self.blueLayer.frame = CGRectMake(0, 0, 50, 50);
    [self.LayerView.layer addSublayer:self.blueLayer];
    
    
    UIButton *button1 = [self customButton];
    button1.center = CGPointMake(50, CGRectGetMaxY(_LayerView.frame)+50);
    button1.alpha = 0.5;
    [self.view addSubview:button1];
    
    
    
    //create translucent button
    UIButton *button2 = [self customButton];
    button2.center = CGPointMake(250, CGRectGetMaxY(_LayerView.frame)+50);
    button2.alpha = 0.5;
    [self.view addSubview:button2];
    
    // shouldRasterize 这个属性设置为YES的时候 在设置alpha之前的时候 就会整个组被组合成一张图片、再设置alpha就不会出现 button 中的label和button 颜色不一致了（这里没有试出来有什么不同，书上这样写的、可能是iOS 修改了吧）
    //enable rasterization for the translucent button
    button2.layer.shouldRasterize = YES;
    button2.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

/**
 对比两种方法判断是否点击了blueLayer hitTest明显更方便一些
 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    CALayer*layer = [self.view.layer hitTest:point]; //hit Test 返回点击的当前Layer
    
    if (layer==self.blueLayer) {
        UIAlertController*alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击了blueLayer" preferredStyle:UIAlertControllerStyleAlert];
        [alter addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alter dismissViewControllerAnimated:YES completion:nil];
        }]];
        
        [self presentViewController:alter animated:YES completion:nil];
    }
    
    // 这里也可以这样写
    //先将 point 转换到layerView
    
    CGPoint  convertPoint = [self.LayerView.layer convertPoint:point fromLayer:self.view.layer];
    if ([self.LayerView.layer containsPoint:convertPoint]) {
        
        // 再将convertPoint 转换到blueLayer中
        CGPoint bluePoint = [self.blueLayer convertPoint:convertPoint fromLayer:self.LayerView.layer];
        if ([self.blueLayer containsPoint:bluePoint]) {
            
            NSLog(@"点击了blueLayer");
        }
        
    }
    
}

- (UIButton *)customButton
{
    //create button
    CGRect frame = CGRectMake(0, 0, 100, 50);
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 10;
    //add label
    frame = CGRectMake(10, 10, 80, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setBackgroundColor:[UIColor whiteColor]];
    label.text = @"Hello";
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
    return button;
}
- (IBAction)popToCGAffineTransform:(id)sender {
    
    CGAffineTransformViewController*transform = [CGAffineTransformViewController new];
    [self.navigationController pushViewController:transform animated:YES];
}


@end
