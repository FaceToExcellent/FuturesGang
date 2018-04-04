//
//  SignUPViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "SignUPViewController.h"

@interface SignUPViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField * phoneNumber;
@property(nonatomic,strong)UITextField * yzm;
@property(nonatomic,strong)UIButton    * hqyzmButton;
@property(nonatomic,strong)UITextField * spnewWord;

@property(nonatomic,strong) dispatch_source_t timer;
@property(nonatomic,assign) __block NSInteger time;
@end

@implementation SignUPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    self.view.backgroundColor = APP_BACKCOLOR;
    [self SignUPUImake];
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    NSString * timeIfOn = [def objectForKey:@"SignUpmytimer"];
    if([timeIfOn isEqualToString:@"SignUptimeNotOver"]){
        
        [self openCountdown];
    }
}
-(void)SignUPUImake{
    //手机号码
    _phoneNumber = [[UITextField alloc]init];
    _phoneNumber.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100*hb);
    [self.view addSubview:_phoneNumber];
    _phoneNumber.delegate = self;
    _phoneNumber.tag = 101;
    _phoneNumber.returnKeyType = UIReturnKeyNext;
    //    _phoneNumber.layer.masksToBounds = YES;
    //    _phoneNumber.layer.cornerRadius  = _phoneNumber.frame.size.height/16;
    
    _phoneNumber.backgroundColor = RGBA(38, 40, 52, 1);
    
    UIView * leftview = [[UIView alloc]init];
    leftview.frame = CGRectMake(0, 0, 175*wb, 100*hb);
    leftview.backgroundColor =RGBA(38, 40, 52, 1);
    [_phoneNumber addSubview:leftview];
    
    UILabel * label = [[UILabel alloc]init];
    label.frame =CGRectMake(30*hb, 33*hb, 145*wb, 30*hb);
    label.textColor = [UIColor whiteColor];
    label.text =@"手机号";
    if (SCREEN_WIDTH == 320) {
        label.font = [UIFont systemFontOfSize:13];
    }else
    {
        label.font = [UIFont systemFontOfSize:15];
    }
    label.textAlignment = NSTextAlignmentLeft;
    [leftview addSubview:label];
    _phoneNumber.leftView = leftview;
    _phoneNumber.leftViewMode=UITextFieldViewModeAlways;
    
    
    _phoneNumber.placeholder =@"请输入手机号码";
    [_phoneNumber setValue:RGBA(150, 160, 190, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_phoneNumber setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    
    //验证码
    
    _yzm = [[UITextField alloc]init];
    _yzm.frame = CGRectMake(0, 100*hb +1, SCREEN_WIDTH, 100*hb);
    [self.view addSubview:_yzm];
    _yzm.delegate = self;
    _yzm.tag = 102;
    _yzm.returnKeyType = UIReturnKeyNext;
    
    
    _yzm.backgroundColor = RGBA(38, 40, 52, 1);
    
    UIView * _yzmleftview = [[UIView alloc]init];
    _yzmleftview.frame = CGRectMake(0, 0, 175*wb, 100*hb);
    _yzmleftview.backgroundColor =RGBA(38, 40, 52, 1);
    [_yzm addSubview:_yzmleftview];
    
    UILabel * _yzmlabel = [[UILabel alloc]init];
    _yzmlabel.frame =CGRectMake(30*wb, 33*hb, 145*wb, 30*hb);
    _yzmlabel.textColor = [UIColor whiteColor];
    _yzmlabel.text =@"验证码";
    if (SCREEN_WIDTH == 320) {
        _yzmlabel.font = [UIFont systemFontOfSize:13];
    }else
    {
        _yzmlabel.font = [UIFont systemFontOfSize:15];
    }
    _yzmlabel.textAlignment = NSTextAlignmentLeft;
    [_yzmleftview addSubview:_yzmlabel];
    _yzm.leftView = _yzmleftview;
    _yzm.leftViewMode=UITextFieldViewModeAlways;
    
    
    _yzm.placeholder =@"请输入验证码";
    [_yzm setValue:RGBA(150, 160, 190, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_yzm setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    
    //竖线
    UIView * sxview =[[UIView alloc]init];
    sxview.frame = CGRectMake(SCREEN_WIDTH-215*wb, 10*hb, 1, 80*hb);
    sxview.backgroundColor = self.view.backgroundColor;
    [_yzm addSubview:sxview];
    //获取验证码
    
    _hqyzmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _hqyzmButton.frame = CGRectMake(SCREEN_WIDTH-215*wb + 2, 0, 210*wb, 100*hb);
    _hqyzmButton.backgroundColor = RGBA(38, 40, 52, 1);
    [_hqyzmButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    if (SCREEN_WIDTH ==320) {
        _hqyzmButton.titleLabel.font = [UIFont systemFontOfSize:14];
    }else
    {
        _hqyzmButton.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    [_hqyzmButton setTitleColor:APP_BLUE forState:UIControlStateNormal];
    [_yzm addSubview:_hqyzmButton];
    
    [_hqyzmButton addTarget:self action:@selector(openCountdown) forControlEvents:UIControlEventTouchUpInside];
    
    //新登录密码
    
    _spnewWord = [[UITextField alloc]init];
    _spnewWord.frame = CGRectMake(0, 210*hb, SCREEN_WIDTH, 100*hb);
    [self.view addSubview:_spnewWord];
    _spnewWord.delegate = self;
    _spnewWord.tag = 103;
    _spnewWord.returnKeyType = UIReturnKeyNext;
    //    _phoneNumber.layer.masksToBounds = YES;
    //    _phoneNumber.layer.cornerRadius  = _phoneNumber.frame.size.height/16;
    
    _spnewWord.backgroundColor = RGBA(38, 40, 52, 1);
    
    UIView * _mynewWordleftview = [[UIView alloc]init];
    _mynewWordleftview.frame = CGRectMake(0, 0, 230*wb, 100*hb);
    _mynewWordleftview.backgroundColor =RGBA(38, 40, 52, 1);
    [_spnewWord addSubview:_mynewWordleftview];
    
    UILabel * _mynewWordlabel = [[UILabel alloc]init];
    _mynewWordlabel.frame =CGRectMake(30*wb, 33*hb, 200*wb, 30*hb);
    _mynewWordlabel.textColor = [UIColor whiteColor];
    _mynewWordlabel.text =@"登录密码";
    if (SCREEN_WIDTH == 320) {
        _mynewWordlabel.font = [UIFont systemFontOfSize:13];
    }else
    {
        _mynewWordlabel.font = [UIFont systemFontOfSize:15];
    }
    _mynewWordlabel.textAlignment = NSTextAlignmentLeft;
    [_mynewWordleftview addSubview:_mynewWordlabel];
    _spnewWord.leftView = _mynewWordleftview;
    _spnewWord.leftViewMode=UITextFieldViewModeAlways;
    
    
    _spnewWord.placeholder =@"6-12位数字和字母组合";
    [_spnewWord setValue:RGBA(150, 160, 190, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_spnewWord setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];

}

// 开启倒计时效果
-(void)openCountdown{
    
    self.time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(self.timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(self.timer, ^{
        
        if(self.time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(self.timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.hqyzmButton setTitle:@"获取验证码" forState:UIControlStateNormal];
                [self.hqyzmButton setTitleColor:RGBA(63, 111, 198, 1) forState:UIControlStateNormal];
                self.hqyzmButton.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = self.time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.hqyzmButton setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                [self.hqyzmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                self.hqyzmButton.userInteractionEnabled = NO;
            });
            self.time--;
        }
    });
    dispatch_resume(self.timer);
}
#pragma mark textField delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
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

-(void)backBtnClick
{
    [super backBtnClick];
    if (self.time >0) {
        NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
        [def setObject:@"SignUptimeNotOver" forKey:@"SignUpmytimer"];
        
    }else
    {
        NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
        [def setObject:@"SignUptimeIsOver" forKey:@"SignUpmytimer"];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
