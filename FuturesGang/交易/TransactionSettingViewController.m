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

@property(nonatomic,strong)UITextField * textField1;
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
    [xdwqrView addSubview:label1];
    
    
    //开关
    
    _switchView = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-150*wb, 20*hb , 90*wb, 60*hb)];
    _switchView.on = NO;
     // 开关事件切换通知
    [_switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    _switchView.onTintColor = APP_BLUE;
    [self.view addSubview: _switchView];
    
   
    //快捷反手默认委托价格
    //line 1
    UIView * view1 = [[UIView alloc]init];
    view1.frame =CGRectMake(0, 100*hb+2, SCREEN_WIDTH, 1);
    view1.backgroundColor = APP_BACKCOLOR;
    [self.view addSubview:view1];
   
    
    UIView * kjfsView = [[UIView alloc]init];
    kjfsView.frame = CGRectMake(0, 100*hb+3, SCREEN_WIDTH, 100*hb);
    [kjfsView setBackgroundColor:APP_TEXTFEILD_BACKCOLOR];
    [self.view addSubview:kjfsView];
    
    UILabel * label2  = [[UILabel alloc]init];
    [label2 setText:@"快捷反手默认委托价格"];
    label2.textColor = [UIColor whiteColor];
    label2.font = [UIFont systemFontOfSize:16];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.frame = CGRectMake(30*wb, 0, 450*wb, 100*hb);
    [kjfsView addSubview:label2];
   
    UITextField * tex = [[UITextField alloc]init];
    tex.text =@"对手价";
    tex.font = [UIFont systemFontOfSize:14];
    tex.textAlignment = NSTextAlignmentRight;
    tex.textColor =  RGBA(150, 160, 190, 1);
    tex.frame = CGRectMake(SCREEN_WIDTH-250*wb, 0, 185*wb, 100*hb);
    
    [kjfsView addSubview:tex];
    
    UIImageView * gorimage = [[UIImageView alloc]init];
    gorimage.image = [UIImage imageNamed:@"ZXJT"];
    gorimage.frame = CGRectMake(SCREEN_WIDTH-45*wb, 35*hb, 15*wb, 30*hb);
    [kjfsView addSubview:gorimage];
    
    
    //快捷反手自动撤单时间
    
    //line 2
    UIView * view2 = [[UIView alloc]init];
    view2.frame =CGRectMake(0, 200*hb+2, SCREEN_WIDTH, 1);
    view2.backgroundColor = APP_BACKCOLOR;
    [self.view addSubview:view2];
    
    
    UIView * kjcdView = [[UIView alloc]init];
    kjcdView.frame = CGRectMake(0, 200*hb+3, SCREEN_WIDTH, 100*hb);
    [kjcdView setBackgroundColor:APP_TEXTFEILD_BACKCOLOR];
    [self.view addSubview:kjcdView];
    
    UILabel * label3  = [[UILabel alloc]init];
    [label3 setText:@"快捷反手自动撤单时间"];
    label3.textColor = [UIColor whiteColor];
    label3.font = [UIFont systemFontOfSize:16];
    label3.textAlignment = NSTextAlignmentLeft;
    label3.frame = CGRectMake(30*wb, 0, 450*wb, 100*hb);
    [kjcdView addSubview:label3];
    
    UITextField * tex2 = [[UITextField alloc]init];
    tex2.text =@"10秒";
    tex2.font = [UIFont systemFontOfSize:14];
    tex2.textAlignment = NSTextAlignmentRight;
    tex2.textColor =  RGBA(150, 160, 190, 1);
    tex2.frame = CGRectMake(SCREEN_WIDTH-250*wb, 0, 185*wb, 100*hb);
    
    [kjcdView addSubview:tex2];
    
    UIImageView * gorimage2 = [[UIImageView alloc]init];
    gorimage2.image = [UIImage imageNamed:@"ZXJT"];
    gorimage2.frame = CGRectMake(SCREEN_WIDTH-45*wb, 35*hb, 15*wb, 30*hb);
    [kjcdView addSubview:gorimage2];
    
    
    //交易数量默认加量
    
    //line 3
    UIView * view3 = [[UIView alloc]init];
    view3.frame =CGRectMake(0, 300*hb+2, SCREEN_WIDTH, 1);
    view3.backgroundColor = APP_BACKCOLOR;
    [self.view addSubview:view3];
    
    
    UIView * jyslView = [[UIView alloc]init];
    jyslView.frame = CGRectMake(0, 300*hb+3, SCREEN_WIDTH, 100*hb);
    [jyslView setBackgroundColor:APP_TEXTFEILD_BACKCOLOR];
    [self.view addSubview:jyslView];
    
    UILabel * label4  = [[UILabel alloc]init];
    [label4 setText:@"交易数量默认加量"];
    label4.textColor = [UIColor whiteColor];
    label4.font = [UIFont systemFontOfSize:16];
    label4.textAlignment = NSTextAlignmentLeft;
    label4.frame = CGRectMake(30*wb, 0, 450*wb, 100*hb);
    [jyslView addSubview:label4];
    
    UITextField * tex3 = [[UITextField alloc]init];
    tex3.text =@"1";
    tex3.font = [UIFont systemFontOfSize:14];
    tex3.textAlignment = NSTextAlignmentRight;
    tex3.textColor =  RGBA(150, 160, 190, 1);
    tex3.frame = CGRectMake(SCREEN_WIDTH-250*wb, 0, 185*wb, 100*hb);
    
    [jyslView addSubview:tex3];
    
    UIImageView * gorimage3 = [[UIImageView alloc]init];
    gorimage3.image = [UIImage imageNamed:@"ZXJT"];
    gorimage3.frame = CGRectMake(SCREEN_WIDTH-45*wb, 35*hb, 15*wb, 30*hb);
    [jyslView addSubview:gorimage3];
}

-(void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        NSLog(@"switchButton===开");
        [self alertviewMake];
        
    }else {
        NSLog(@"switchButton===关");
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
