//
//  CornerRectViewController.m
//  BLCoreAnimation
//
//  Created by 周建波 on 2017/3/20.
//  Copyright © 2017年 scqc. All rights reserved.
//

#import "CornerRectViewController.h"
#import "CATextLayerViewController.h"

@interface CornerRectViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation CornerRectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIRectCorner rect = UIRectCornerTopLeft|UIRectCornerTopRight;
    UIBezierPath*path = [UIBezierPath bezierPathWithRoundedRect:_contentView.bounds byRoundingCorners:rect cornerRadii:CGSizeMake(5, 5)];
    
    CAShapeLayer*layer = [[CAShapeLayer alloc]init];
    layer.frame = _contentView.bounds;
    layer.path = path.CGPath;
    _contentView.layer.mask = layer;
    
    [_contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)]];
    
}
-(void)tap{
    
    CATextLayerViewController*textLayer = [[CATextLayerViewController alloc]init];
    
    [self.navigationController pushViewController:textLayer animated:YES];
}

@end
