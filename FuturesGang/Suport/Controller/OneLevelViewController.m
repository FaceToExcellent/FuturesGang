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
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(onClickedOKbtn)];
    [rightBarItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightBarItem;
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
