//
//  OneLevelViewController.m
//  xbiao
//
//  Created by zhuangzhe on 15/5/28.
//  Copyright (c) 2015年 腕表之家. All rights reserved.
//

#import "OneLevelViewController.h"
#import "AppDelegate.h"


@interface OneLevelViewController ()

@end

@implementation OneLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBackBtnWithImgName:@"FH"];
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    [self gradientLayerset];
    self.view.backgroundColor = APP_BACKCOLOR;
    
}

-(void)gradientLayerset{
    //渐变
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0,0, SCREEN_WIDTH,3);  // 设置显示的frame
    gradientLayer.colors = @[(id)RGBA(23, 22, 33, 1).CGColor,(id)APP_BACKCOLOR.CGColor];  // 设置渐变颜色
    gradientLayer.startPoint = CGPointMake(0, 0);   //
    gradientLayer.endPoint = CGPointMake(0, 1);     //
    [self.view.layer addSublayer:gradientLayer];
}
- (void)setBackBtnWithImgName:(NSString *)imgName
{
    UIImage *_backImg = [UIImage imageNamed:imgName];
    UIImage *_backImgH = [UIImage imageNamed:imgName];
    UIButton * _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 44)];
    [_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_backBtn setImage:_backImg forState:UIControlStateNormal];
    [_backBtn setImage:_backImgH forState:UIControlStateHighlighted];
    // [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
    UIBarButtonItem * backItem =[[UIBarButtonItem alloc] initWithCustomView:_backBtn];
    self.navigationItem.leftBarButtonItem =backItem;
}
#pragma mark -  返回按钮
- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (void)addRightBtn:(NSString*)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //! 这里需要根据内容大小来调整宽度
    button.frame = CGRectMake(0, 0, 44, 44);
    button.titleLabel.textColor = [UIColor redColor];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    [button setTitle:title forState:UIControlStateNormal];
//    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
//                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                       target:nil action:nil];
//    negativeSpacer.width = -15;
    
    [button addTarget:self action:@selector(onClickedOKbtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = backItem;
   // self.navigationItem.rightBarButtonItems = @[negativeSpacer, backItem];
}

- (void)onClickedOKbtn {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
