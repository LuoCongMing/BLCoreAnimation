//
//  HitTestViewController.m
//  BLCoreAnimation
//
//  Created by 周建波 on 2017/3/17.
//  Copyright © 2017年 scqc. All rights reserved.
//

#import "HitTestViewController.h"

@interface HitTestViewController ()
@property (weak, nonatomic) IBOutlet UIView *LayerView;
@property(nonatomic,strong)CALayer*blueLayer;

@end

@implementation HitTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.blueLayer = [[CALayer alloc]init];
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    self.blueLayer.frame = CGRectMake(0, 0, 50, 50);
    [self.LayerView.layer addSublayer:self.blueLayer];
    
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

@end
