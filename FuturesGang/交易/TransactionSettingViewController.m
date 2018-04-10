//
//  TransactionSettingViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/10.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "TransactionSettingViewController.h"
#import "MyAlertView.h"
@interface TransactionSettingViewController ()
@property(nonatomic,strong)UISwitch *switchView;
@property(nonatomic,strong) MyAlertView * alert;
@end

@implementation TransactionSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setnaviTitle:@"交易设置"];
    
    [self makeUI];
}

-(void)makeUI{
    
    //下单无需确认
    
    UIView * xdwqrView = [[UIView alloc]init];
    xdwqrView.frame = CGRectMake(0, 3, SCREEN_WIDTH, 100*hb);
    [xdwqrView setBackgroundColor:APP_TEXTFEILD_BACKCOLOR];
    [self.view addSubview:xdwqrView];
    
    UILabel * label1  = [[UILabel alloc]init];
    [label1 setText:@"下单无需确认"];
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:16];
    label1.textAlignment = NSTextAlignmentLeft;
    label1.frame = CGRectMake(30*wb, 0, 450*wb, 100*hb);
    [self.view addSubview:label1];
    
    
    //开关
    
    _switchView = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-150*wb, 20*hb , 90*wb, 60*hb)];
    _switchView.on = NO;
    [_switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];   // 开关事件切换通知
    _switchView.onTintColor = APP_BLUE;
    [self.view addSubview: _switchView];
    
   
    
    
}

-(void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        NSLog(@"开");
        [self alertviewMake];
        
    }else {
        NSLog(@"关");
    }
}

-(void)alertviewMake{
   _alert = [[MyAlertView alloc]initWithNormal];
   __weak typeof(self) weakSelf = self;
 
    [weakSelf.alert setOkBlock:^{
        // NSLog(@"确定");
    }];
    
    [weakSelf.alert setCancelBlock:^{
       // NSLog(@"取消");
        weakSelf.switchView.on =NO;
    }];
    
    [self.view addSubview:_alert];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
