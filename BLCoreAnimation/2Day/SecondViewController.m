//
//  SecondViewController.m
//  BLCoreAnimation
//
//  Created by 周建波 on 2017/3/16.
//  Copyright © 2017年 scqc. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *firstAddView;
@property (weak, nonatomic) IBOutlet UIView *secondAddView;
@property(nonatomic,strong)CALayer*blueLayer;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    _blueLayer = [[CALayer alloc]init];
    _blueLayer.frame = CGRectMake(0, 0, 100, 100);
    _blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [_layerView.layer addSublayer:_blueLayer];

     
}

- (IBAction)geometryFlipped:(id)sender {
    // 垂直翻转属性打开的话 它上面的子图层都会被垂直翻转 不从上面开始而是从下面开始
    _layerView.layer.geometryFlipped = YES;
}
- (IBAction)changePositionZ:(UIButton *)sender {
    //zPosition  default is 0  subLayer的zPosition最大的在最上面
    _firstAddView.layer.zPosition = 1;
}

@end
