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


#import "TransactionView.h"//交易
#import "TransctionFSView.h"//分时
#import "TransactionKlineView.h"//K线


@interface TransactionSigninViewController ()<BubbleViewDelegate>
@property(nonatomic,strong)BubbleView * BubbleView ;

@property(nonatomic,strong)UIButton * zixuanButton;
@property(nonatomic,strong)UIButton * fenshiButton;
@property(nonatomic,strong)UIButton * KxianButton;
@property(nonatomic,strong)UIButton * jiaoyiButton;


@property(nonatomic,strong)TransactionView * transactionView;
@property(nonatomic,strong)TransctionFSView * FSView;
@property(nonatomic,strong)TransactionKlineView * KLineView;

@end

@implementation TransactionSigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self setnaviTitle:@"交易"];
    self.view.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
    
    [self addRightBtns:nil];
    
    [self MainUIMake];
    //默认选中交易
    [self jiaoyiButtonCLick];
    //放到最后保证菜单在最上层
    [self BubbleViewMakeUI];
}
-(void)MainUIMake{
  
   
    //底部四个按钮
    [self DownButton];
    [self fourView];
    
}

-(void)fourView{
    _transactionView = [[TransactionView alloc]init];
    _transactionView.frame =CGRectMake(0, 3, SCREEN_WIDTH, SCREEN_HEIGHT- StatusBarAndNavigationBarHeight-100*hb-3);
    _transactionView.backgroundColor =  APP_TEXTFEILD_BACKCOLOR;
    
    _FSView = [[TransctionFSView alloc]init];
    _FSView.frame =CGRectMake(0, 3, SCREEN_WIDTH, SCREEN_HEIGHT- StatusBarAndNavigationBarHeight-100*hb-3);
    _FSView.backgroundColor =  [UIColor greenColor];
    
    
    _KLineView = [[TransactionKlineView alloc]init];
    _KLineView.frame =CGRectMake(0, 3, SCREEN_WIDTH, SCREEN_HEIGHT- StatusBarAndNavigationBarHeight-100*hb-3);
    _KLineView.backgroundColor =  [UIColor orangeColor];
    
}

-(void)DownButton{
    
    UIView * conView  =[[UIView alloc]init];
    conView.frame = CGRectMake(0, SCREEN_HEIGHT -100*hb-StatusBarAndNavigationBarHeight, SCREEN_WIDTH, 100*hb);
    [conView setBackgroundColor:APP_BACKCOLOR];
    [self.view addSubview:conView];
    
    //自选
    _zixuanButton = [[UIButton alloc]init];
    _zixuanButton.frame = CGRectMake(0, 0, SCREEN_WIDTH/4, 100*hb);
    
    [_zixuanButton setTitle:@"自选" forState:UIControlStateNormal];
    [_zixuanButton setBackgroundImage:[UIImage imageNamed:@"lanse"] forState:UIControlStateSelected];
    [_zixuanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_zixuanButton setTitleColor:APP_Gray forState:UIControlStateNormal];
    [_zixuanButton addTarget:self action:@selector(zixuanButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [conView addSubview:_zixuanButton];
    //分时
    _fenshiButton = [[UIButton alloc]init];
    _fenshiButton.frame = CGRectMake(SCREEN_WIDTH/4, 0, SCREEN_WIDTH/4, 100*hb);
    
    [_fenshiButton setTitle:@"分时" forState:UIControlStateNormal];
    [_fenshiButton setBackgroundImage:[UIImage imageNamed:@"lanse"] forState:UIControlStateSelected];
    [_fenshiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_fenshiButton setTitleColor:APP_Gray forState:UIControlStateNormal];
    [_fenshiButton addTarget:self action:@selector(fenshiButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [conView addSubview:_fenshiButton];
    
    //K line
    _KxianButton = [[UIButton alloc]init];
    _KxianButton.frame = CGRectMake(SCREEN_WIDTH/4 *2, 0, SCREEN_WIDTH/4, 100*hb);
    
    [_KxianButton setTitle:@"K线" forState:UIControlStateNormal];
    [_KxianButton setBackgroundImage:[UIImage imageNamed:@"lanse"] forState:UIControlStateSelected];
    [_KxianButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_KxianButton setTitleColor:APP_Gray forState:UIControlStateNormal];
    [_KxianButton addTarget:self action:@selector(KxianButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [conView addSubview:_KxianButton];
    //交易
    _jiaoyiButton = [[UIButton alloc]init];
    _jiaoyiButton.frame = CGRectMake(SCREEN_WIDTH/4 *3 , 0, SCREEN_WIDTH/4, 100*hb);
    
    [_jiaoyiButton setTitle:@"交易" forState:UIControlStateNormal];
    [_jiaoyiButton setBackgroundImage:[UIImage imageNamed:@"lanse"] forState:UIControlStateSelected];
    [_jiaoyiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_jiaoyiButton setTitleColor:APP_Gray forState:UIControlStateNormal];
    [_jiaoyiButton addTarget:self action:@selector(jiaoyiButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [conView addSubview:_jiaoyiButton];
    
    
}
-(void)zixuanButtonCLick{
    _zixuanButton.selected  = !_zixuanButton.selected;
    if (_zixuanButton.selected) {
        _fenshiButton.selected = NO;
        _KxianButton.selected  = NO;
        _jiaoyiButton.selected  = NO;
    }
    
    RootTabViewController * vc = [[RootTabViewController alloc]init];
    [vc setSelectedIndex:1];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)fenshiButtonCLick{
    _fenshiButton.selected  = !_fenshiButton.selected;
    if (_fenshiButton.selected) {
        _zixuanButton.selected = NO;
        _KxianButton.selected  = NO;
        _jiaoyiButton.selected  = NO;
    }
    
    [self.view addSubview:_FSView];
    [_transactionView removeFromSuperview];
    [_KLineView removeFromSuperview];
}

-(void)KxianButtonCLick{
    _KxianButton.selected  = !_KxianButton.selected;
    if (_KxianButton.selected) {
        _zixuanButton.selected = NO;
        _fenshiButton.selected  = NO;
        _jiaoyiButton.selected  = NO;
    }
    
    [self.view addSubview:_KLineView];
    [_transactionView removeFromSuperview];
    [_FSView removeFromSuperview];
}
-(void)jiaoyiButtonCLick{
    _jiaoyiButton.selected  = !_jiaoyiButton.selected;
    if (_jiaoyiButton.selected) {
        _zixuanButton.selected = NO;
        _fenshiButton.selected  = NO;
        _KxianButton.selected  = NO;
    }
    
    [self.view addSubview:_transactionView];
    [_KLineView removeFromSuperview];
    [_FSView removeFromSuperview];
    
    
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
