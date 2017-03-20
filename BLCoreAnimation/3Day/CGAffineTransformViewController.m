//
//  CGAffineTransformViewController.m
//  BLCoreAnimation
//
//  Created by 周建波 on 2017/3/17.
//  Copyright © 2017年 scqc. All rights reserved.
//

#import "CGAffineTransformViewController.h"

@interface CGAffineTransformViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *flowers;
@property (weak, nonatomic) IBOutlet UIImageView *flowers2;

@end

@implementation CGAffineTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//2d变换
- (IBAction)transform:(id)sender {
    //创建一个transform
    CGAffineTransform transform = CGAffineTransformIdentity;
    //先让它平移 100
    transform = CGAffineTransformTranslate(transform, 100, 0);
    //旋转 45度
    transform = CGAffineTransformRotate(transform, M_PI_4);
    //再放大1倍
    transform = CGAffineTransformScale(transform, 1.5, 1.5);
    
    self.flowers.layer.affineTransform = transform;
    
    //    self.flowers.transform = transform;

    
    //tips：这里的平移和缩放的顺序是不能反的，要不然会影响最后结果
    
}
- (IBAction)transform3D:(id)sender {
    
    // CALayer 有一个属性叫做 sublayerTransform 。它也是 CATransform3D 类 型，但和对一个图层的变换不同，它影响到所有的子图层 这里设置了 就不用在每一个子图层中设置透视变换了（M34）
    CATransform3D perfespective = CATransform3DIdentity;
    perfespective.m34 = -1.0/500;
    self.view.layer.sublayerTransform = perfespective;
    
    
    //m34 的默认值是0，我们可以通过设置 m34 为-1.0 / d 来应用透视效果， d 代 表了想象中视角相机和屏幕之间的距离，以像素为单位 m34的值在rotate之前设置
//    CATransform3D transform3D = CATransform3DIdentity;
//    transform3D.m34 = -1.0/500.0;
//    transform3D = CATransform3DRotate(transform3D, M_PI_4, 0, 1, 0);
//    
//    self.flowers.layer.transform = transform3D;
    
    
    _flowers.layer.doubleSided = NO;//关闭双面绘制（正面和背面）
    CATransform3D left = CATransform3DIdentity;
    left = CATransform3DRotate(left, M_PI, 0, 1, 0);
    _flowers.layer.transform = left;
    
    //旋转超过M_PI_2的时候就什么都看不到了
    
    
    CATransform3D right = CATransform3DIdentity;
    right = CATransform3DRotate(right, M_PI, 0, 1, 0);
    _flowers2.layer.transform = right;
}


@end
