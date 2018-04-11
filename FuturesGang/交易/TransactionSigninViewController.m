//
//  TransactionSigninViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/9.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "TransactionSigninViewController.h"
#import "BubbleView.h"

#import "TransactionCashDetailViewController.h"
#import "TransactionSettingViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"


#import "TransactionView.h"

@interface TransactionSigninViewController ()<BubbleViewDelegate>
@property(nonatomic,strong)BubbleView * BubbleView ;


@end

@implementation TransactionSigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self setnaviTitle:@"交易"];
    self.view.backgroundColor = APP_BACKCOLOR;
    
    [self addRightBtns:nil];
    [self BubbleViewMakeUI];
    [self MainUIMake];
}
-(void)MainUIMake{
  
    TransactionView * view = [[TransactionView alloc]init];
    view.frame =CGRectMake(0, 3, SCREEN_WIDTH, 500);
    [self.view addSubview:view];
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
-(void)BubbleViewMakeUI{
    //弹出菜单栏
    
    _BubbleView  =[[BubbleView alloc]init];
    _BubbleView.backgroundColor = [UIColor clearColor];
    _BubbleView.delegate = self;
    _BubbleView.frame =CGRectMake(SCREEN_WIDTH-350*wb,0, 350*wb, 430*hb);
    [self.view addSubview:_BubbleView];
    _BubbleView.hidden  = YES;
    
    
 
}

- (void)onClickedOKbtns {
    //这一句不设置就会无响应 
    _BubbleView.userInteractionEnabled = YES;
    _BubbleView.hidden  = ! _BubbleView.hidden;
    
}

- (void)backBtnClick
{

    RootTabViewController * vc = [[RootTabViewController alloc]init];
    //  [self presentModalViewController:vc animated:YES];
    [vc setSelectedIndex:0];
    [self presentViewController:vc animated:YES completion:nil];
    
}

#pragma  mark BubbleViewDelegate
-(void)BubbleViewDelegatePushWithTag:(NSInteger)tag
{
    //资金详情
    if (tag == 1001) {
        TransactionCashDetailViewController * vc  = [[TransactionCashDetailViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    //出入金
    if (tag == 1002) {
        
    }
    //交易设置
    if (tag == 1003) {
        
        TransactionSettingViewController * vc  = [[TransactionSettingViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    //退出登录
    if (tag == 1004) {
        //退出登录
        
        LoginViewController * lvc= [[LoginViewController alloc]init];
        //因为 loginVC 需要push VC 所以在present 之前要声明 导航控制器
        UINavigationController * VC = [[UINavigationController alloc]initWithRootViewController:lvc];
        
        //之所以这样做 是为了防止  whose view is not in the window hierarchy 错误
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        UIWindow *_window = appDelegate.window;
        
        _window.rootViewController = VC ;
        
        [_window makeKeyAndVisible];
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
