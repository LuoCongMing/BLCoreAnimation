//
//  CGATransformViewController.m
//  BLCoreAnimation
//
//  Created by 周建波 on 2017/3/20.
//  Copyright © 2017年 scqc. All rights reserved.
//

#import "CGATransformViewController.h"

@interface CGATransformViewController ()

@end

@implementation CGATransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //先设置view的 透视变换 控制view上所加的所有图层的视角
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0/500.0;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    perspective = CATransform3DTranslate(perspective, -50, 0, 0);
    self.view.layer.sublayerTransform = perspective;
    [self transform];
    
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)]];
    
}
-(void)pan:(UIPanGestureRecognizer*)pan{
    
    
    
}
-(void)transform{
    
    
    //说明 y向下为正 向上为负
    
    // label2放左边
    UILabel*label2 = self.labelArray[1];
    CATransform3D transform2 = CATransform3DIdentity;
    transform2 = CATransform3DTranslate(transform2, -50, 0, -50);
    transform2 = CATransform3DRotate(transform2, M_PI_2, 0, 1, 0);
    label2.layer.transform = transform2;
    
//    // label3放最后面
    
    UILabel*label3 = self.labelArray[2];
    CATransform3D transform3 = CATransform3DIdentity;
    transform3 = CATransform3DTranslate(transform3, 0, 0, -100);
    label3.layer.transform = transform3;
//
//    // label4放label2对面
    
    UILabel*label4 = self.labelArray[3];
    CATransform3D transform4 = CATransform3DIdentity;
    transform4 = CATransform3DTranslate(transform4, 50, 0, -50);
    transform4 = CATransform3DRotate(transform4, M_PI_2, 0, 1, 0);
    label4.layer.transform = transform4;
//
//    // label5放上面
//    
    UILabel*label5 = self.labelArray[4];
    CATransform3D transform5 = CATransform3DIdentity;
    transform5 = CATransform3DTranslate(transform5, 0, -50, -50);
    transform5 = CATransform3DRotate(transform5, M_PI_2, 1, 0, 0);
    label5.layer.transform = transform5;
//
//    //label6放底部
    UILabel*label6 = self.labelArray[5];
    CATransform3D transform6 = CATransform3DIdentity;
    transform6 = CATransform3DTranslate(transform6, 0, 50, -50);
    transform6 = CATransform3DRotate(transform6, -M_PI_2, 1, 0, 0);
    label6.layer.transform = transform6;
//
    
    
}

@end
