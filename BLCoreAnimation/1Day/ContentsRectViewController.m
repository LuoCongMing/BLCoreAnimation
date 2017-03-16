//
//  ContentsRectViewController.m
//  BLCoreAnimation
//
//  Created by 周建波 on 2017/3/15.
//  Copyright © 2017年 scqc. All rights reserved.
//

#import "ContentsRectViewController.h"

@interface ContentsRectViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *first;
@property (weak, nonatomic) IBOutlet UIImageView *second;
@property (weak, nonatomic) IBOutlet UIImageView *third;
@property (weak, nonatomic) IBOutlet UIImageView *fouth;


@end

@implementation ContentsRectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    
    //注意这里的值是比例，而不是绝对坐标的值
    
    _first.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    _second.layer.contentsRect = CGRectMake(0.5, 0, 0.5, 0.5);
    _third.layer.contentsRect = CGRectMake(0, 0.5, 0.5, 0.5);
    _fouth.layer.contentsRect = CGRectMake(0.5, 0.5, 0.5, 0.5);
    
}

@end
