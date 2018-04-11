//
//  TransactionSettingViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/10.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "TransactionSettingViewController.h"
#import "MyAlertView.h"

#import "SinglePickerView.h"
#define PICKER_HEIGHT   216
@interface TransactionSettingViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UISwitch *switchView;
@property(nonatomic,strong) MyAlertView * alert;

@property(nonatomic,strong)UITextField * textField1;

@property(nonatomic,strong)SinglePickerView * picker;
@property(nonatomic,strong)SinglePickerView * picker2;
@property(nonatomic,strong)SinglePickerView * picker3;

@property(nonatomic,strong)UITextField * tex;
@property(nonatomic,strong)UITextField * tex2;
@property(nonatomic,strong)UITextField * tex3;

@property(nonatomic,strong)NSArray * arr1;
@property(nonatomic,strong)NSArray * arr2;
@property(nonatomic,strong)NSArray * arr3;
@end

@implementation TransactionSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setnaviTitle:@"交易设置"];
     [self loadDate];
    [self makeUI];
   
}

-(void)loadDate{
     _arr1 = @[@"-5",@"-10",@"对手价",@"+5",@"+10"];
    _arr2  = @[@"10秒",@"20秒",@"30秒",@"40秒",@"50秒",@"60秒",@"70秒",];
    _arr3  = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    //默认数据
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    [def setObject:@"对手价" forKey:@"快捷反手自动撤单时间"];
    [def setObject:@"10秒" forKey:@"快捷反手自动撤单时间"];
    [def setObject:@"1" forKey:@"交易数量默认加量"];

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
   
     NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    
    
    _tex = [[UITextField alloc]init];
    
    _tex.text =[def objectForKey:@"快捷反手默认委托价格"];
    _tex.delegate = self;
    _tex.tag = 101;
    _tex.font = [UIFont systemFontOfSize:14];
    _tex.textAlignment = NSTextAlignmentRight;
    _tex.textColor =  RGBA(150, 160, 190, 1);
    _tex.frame = CGRectMake(SCREEN_WIDTH-250*wb, 0, 185*wb, 100*hb);
    
    [kjfsView addSubview:_tex];
    
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
    
     _tex2 = [[UITextField alloc]init];
    _tex2.text =[def objectForKey:@"快捷反手自动撤单时间"];
    _tex2.delegate =self;
    _tex2.tag = 102;
    _tex2.font = [UIFont systemFontOfSize:14];
    _tex2.textAlignment = NSTextAlignmentRight;
    _tex2.textColor =  RGBA(150, 160, 190, 1);
    _tex2.frame = CGRectMake(SCREEN_WIDTH-250*wb, 0, 185*wb, 100*hb);
    
    [kjcdView addSubview:_tex2];
    
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
    
    _tex3 = [[UITextField alloc]init];
    _tex3.text =[def objectForKey:@"交易数量默认加量"];
    _tex3.delegate = self;
    _tex3.tag = 103;
    _tex3.font = [UIFont systemFontOfSize:14];
    _tex3.textAlignment = NSTextAlignmentRight;
    _tex3.textColor =  RGBA(150, 160, 190, 1);
    _tex3.frame = CGRectMake(SCREEN_WIDTH-250*wb, 0, 185*wb, 100*hb);
    
    [jyslView addSubview:_tex3];
    
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

#pragma mark UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField.tag == 101) {
        //对手价
        textField.inputView = self.picker;
        [self.picker  setmyarrayDS:_arr1];
    }
    if(textField.tag == 102){
        //10秒
        textField.inputView = self.picker2;
         [self.picker2  setmyarrayDS:_arr2];
    }
    if(textField.tag == 103){
        //1
        textField.inputView = self.picker3;
         [self.picker3  setmyarrayDS:_arr3];
    }
    
    
    [textField becomeFirstResponder];
}





- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    for (UITextField * mytextField in self.view.subviews) {
        if (mytextField.tag -1 == textField.tag) {
            
            [textField resignFirstResponder];
            [mytextField becomeFirstResponder];
        }else
        {
            [mytextField resignFirstResponder];
        }
    }
    
    
    return YES;
}

#pragma mark UIPickerView


-(SinglePickerView*)picker{
    if (!_picker) {
        _picker=[[SinglePickerView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - PICKER_HEIGHT, SCREEN_WIDTH, PICKER_HEIGHT)];
        _picker.backgroundColor= APP_Gray;
        __weak typeof (self)weakSelf = self;
        [_picker setDidFinishBlock:^(NSString *message) {
            
            if(message.length >0){
            
            weakSelf.tex.text = message;
             [ weakSelf.tex resignFirstResponder];
            
            NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
            [def setObject:message forKey:@"快捷反手默认委托价格"];
            }else
            {
                NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
               
                NSString * messg = [def objectForKey:@"快捷反手默认委托价格"];
                if (messg.length>0) {
                    weakSelf.tex.text = messg;
                    [ weakSelf.tex resignFirstResponder];
                }else
                {
                    weakSelf.tex.text = @"对手价";
                    [ weakSelf.tex resignFirstResponder];
                    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
                    [def setObject:@"对手价" forKey:@"快捷反手自动撤单时间"];
                }
            }
        }];
       
    }
    
    return _picker;
}
-(SinglePickerView*)picker2{
    if (!_picker2) {
        _picker2=[[SinglePickerView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - PICKER_HEIGHT, SCREEN_WIDTH, PICKER_HEIGHT)];
        _picker2.backgroundColor= APP_Gray;
        __weak typeof (self)weakSelf = self;
        [_picker2 setDidFinishBlock:^(NSString *message) {
            
            if(message.length >0){
                
                weakSelf.tex2.text = message;
                [ weakSelf.tex2 resignFirstResponder];
                
                NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
                [def setObject:message forKey:@"快捷反手自动撤单时间"];
            }else
            {
                NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
                
                NSString * messg = [def objectForKey:@"快捷反手自动撤单时间"];
                if (messg.length>0) {
                    weakSelf.tex2.text = messg;
                    [ weakSelf.tex2 resignFirstResponder];
                }else
                {
                    weakSelf.tex2.text = @"10秒";
                    [ weakSelf.tex2 resignFirstResponder];
                    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
                    [def setObject:@"10秒" forKey:@"快捷反手自动撤单时间"];
                }
            }

        }];
        
    }
    
    return _picker2;
}

-(SinglePickerView*)picker3{
    if (!_picker3) {
        _picker3=[[SinglePickerView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - PICKER_HEIGHT, SCREEN_WIDTH, PICKER_HEIGHT)];
        _picker3.backgroundColor= APP_Gray;
        __weak typeof (self)weakSelf = self;
        [_picker3 setDidFinishBlock:^(NSString *message) {
            if(message.length >0){
                
                weakSelf.tex3.text = message;
                [ weakSelf.tex3 resignFirstResponder];
                
                NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
                [def setObject:message forKey:@"交易数量默认加量"];
            }else
            {
                NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
                
                NSString * messg = [def objectForKey:@"交易数量默认加量"];
                if (messg.length>0) {
                    weakSelf.tex3.text = messg;
                    [ weakSelf.tex3 resignFirstResponder];
                }else
                {
                    weakSelf.tex3.text = @"1";
                    [ weakSelf.tex3 resignFirstResponder];
                    
                    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
                    [def setObject:@"1" forKey:@"交易数量默认加量"];
                }
            }

            
        }];
        
    }
    
    return _picker3;
}
@end
