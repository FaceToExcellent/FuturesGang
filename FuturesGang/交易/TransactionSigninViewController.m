//
//  TransactionSigninViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/9.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "TransactionSigninViewController.h"

@interface TransactionSigninViewController ()

@end

@implementation TransactionSigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setnaviTitle:@"交易"];
    
    [self addRightBtns:nil];
}

- (void)addRightBtns:(NSString*)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //! 这里需要根据内容大小来调整宽度
    button.frame = CGRectMake(0, 0, 44/2, 33/2);
 
    [button setBackgroundImage:[UIImage imageNamed:@"CD"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(onClickedOKbtns) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIButton * tjbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    tjbutton.frame = CGRectMake(0, 0, 87/2, 20);
    [tjbutton setBackgroundImage:[UIImage imageNamed:@"TIAOJIAN"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem2 = [[UIBarButtonItem alloc] initWithCustomView:tjbutton];
    
    
    self.navigationItem.rightBarButtonItems = @[backItem,backItem2];
    // self.navigationItem.rightBarButtonItems = @[negativeSpacer, backItem];
}

- (void)onClickedOKbtns {
    
}

- (void)backBtnClick
{

    RootTabViewController * vc = [[RootTabViewController alloc]init];
    //  [self presentModalViewController:vc animated:YES];
    [vc setSelectedIndex:0];
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
