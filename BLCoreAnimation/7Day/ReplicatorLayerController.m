//
//  ReplicatorLayerController.m
//  BLCoreAnimation
//
//  Created by 周建波 on 2017/3/21.
//  Copyright © 2017年 scqc. All rights reserved.
//

#import "ReplicatorLayerController.h"

@interface ReplicatorLayerController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *imageView;

@end

@implementation ReplicatorLayerController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    CAReplicatorLayer*replicator = [CAReplicatorLayer layer];
    replicator.frame = _contentView.bounds;
    replicator.backgroundColor = [UIColor lightGrayColor].CGColor;
    [_contentView.layer addSublayer:replicator];
    
    //实例数量
    replicator.instanceCount = 5;
    
    //apply a transform for each instance 这里的意思是设置每一个实例的相对位置 这里设置的旋转
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 20, 0);
    transform = CATransform3DRotate(transform, 2*M_PI/5, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -20, 0);
    replicator.instanceTransform = transform;
    
    //apply a color shift for each instance 这里设置颜色的渐变
    replicator.instanceBlueOffset = -0.1;
    replicator.instanceGreenOffset = -0.1;
    
    //create a sublayer and place it inside the replicator
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(70.0f, 30.0f, 70.0f, 70.0f);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicator addSublayer:layer];
    
    
    
    /************/

    // 利用复制图层做一个倒影
    CAReplicatorLayer *replicatorLayer =[CAReplicatorLayer layer];
    replicatorLayer.frame = _imageView.bounds;
    [_imageView.layer addSublayer:replicatorLayer];
    
    //包括本身的内容在内创建2份子层的内容
    replicatorLayer.instanceCount = 2;
    
    //调整颜色及透明度
    replicatorLayer.instanceRedOffset -= 0.3;
    replicatorLayer.instanceGreenOffset -= 0.3;
    replicatorLayer.instanceBlueOffset -= 0.3;
    replicatorLayer.instanceAlphaOffset -= 0.4;
    
    //做垂直翻转形变
    CATransform3D instanceTransform = CATransform3DIdentity;
    instanceTransform = CATransform3DRotate(instanceTransform, M_PI, 1, 0, 0);
    instanceTransform = CATransform3DTranslate(instanceTransform, 0, 2, 0);
    replicatorLayer.instanceTransform = instanceTransform;
    
    CALayer*imageLayer = [[CALayer alloc] init];
    imageLayer.frame = CGRectMake(0, 0, 100, 100);
    imageLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"flowers"].CGImage);
    [replicatorLayer addSublayer:imageLayer];
    
}
@end
