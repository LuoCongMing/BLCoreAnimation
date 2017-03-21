//
//  CATextLayerViewController.m
//  BLCoreAnimation
//
//  Created by 周建波 on 2017/3/20.
//  Copyright © 2017年 scqc. All rights reserved.
//

#import "CATextLayerViewController.h"

@interface CATextLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *textLayerView;
@property (weak, nonatomic) IBOutlet UIView *mutableTextLayerView;

@end

@implementation CATextLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CATextLayer*textLayer = [[CATextLayer alloc]init];
    textLayer.frame = _textLayerView.bounds;
    [_textLayerView.layer addSublayer:textLayer];
    
    //设置 textLayer渲染内容
    
    //设置根据屏幕调节显示是否Retina
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    textLayer.backgroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.wrapped = YES;//是否覆盖，这里不是很理解

    // set layer font 不同的是这里的字体大小需要重新设置 CFTypeRef 中的font 不包含字体大小
    UIFont*font = [UIFont systemFontOfSize:15];
    textLayer.font = (__bridge CFTypeRef _Nullable)(font);
    textLayer.fontSize = font.pointSize;
    
    // 这里的string 类型是id 可以用 attributeString
    
    textLayer.string = @"Hello World Hello World Hello World Hello World";
    
    
#pragma mark 富文本
    
    // 这里就不设置其他东西了，留着做一个对比
    
    CATextLayer * mutableLayer = [[CATextLayer alloc]init];
    mutableLayer.frame = _mutableTextLayerView.bounds;
    NSMutableAttributedString*attribute = [[NSMutableAttributedString alloc]initWithString:textLayer.string];
    NSDictionary*attribute1 = @{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:font,NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)};
    [attribute addAttributes:attribute1 range:NSMakeRange(6, 5)];
    
    mutableLayer.string = attribute;
    
    [_mutableTextLayerView.layer addSublayer:mutableLayer];
    
    
    
}

@end
