//
//  ForgetWordViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "ForgetWordViewController.h"

@interface ForgetWordViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField * phoneNumber;
@property(nonatomic,strong)UITextField * yzm;
@property(nonatomic,strong)UIButton    * hqyzmButton;
@property(nonatomic,strong)UITextField * mynewWord;
@property(nonatomic,strong)UITextField * comformWord;

@property(nonatomic,strong)UIButton * qdButton;

@property(nonatomic,strong) dispatch_source_t timer;
@property(nonatomic,assign) __block NSInteger time;

@property(nonatomic,strong)MyAlertView * alert;
@end

@implementation ForgetWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setnaviTitle:@"忘记密码"];
    self.view.backgroundColor = APP_BACKCOLOR;
    [self FWUImake];
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    NSString * timeIfOn = [def objectForKey:@"mytimer"];
    if([timeIfOn isEqualToString:@"timeNotOver"]){
        
        [self openCountdown];
    }
    
    
    
}

-(void)FWUImake{
    
    //手机号码
    _phoneNumber = [self textFieldMakewithtext:@"手机号" placeholder:@"请输入手机号码" withframe:CGRectMake(0, 0, SCREEN_WIDTH, 100*hb) backgroundColor:APP_TEXTFEILD_BACKCOLOR andtag:101 andleftViewframe:CGRectMake(0, 0, 175*wb, 100*hb)];
    _phoneNumber.delegate = self ;
    _phoneNumber.returnKeyType = UIReturnKeyNext;
    [self.view addSubview:_phoneNumber];
    
   
    //验证码
    
    _yzm = [self textFieldMakewithtext:@"验证码" placeholder:@"请输入验证码" withframe:CGRectMake(0, 100*hb +1, SCREEN_WIDTH, 100*hb) backgroundColor:APP_TEXTFEILD_BACKCOLOR andtag:102 andleftViewframe:CGRectMake(0, 0, 175*wb, 100*hb)];
    _yzm.delegate = self ;
    _yzm.returnKeyType = UIReturnKeyNext;
    [self.view addSubview:_yzm];
   
    
    //竖线
    UIView * sxview =[[UIView alloc]init];
    sxview.frame = CGRectMake(SCREEN_WIDTH-215*wb, 10*hb, 1, 80*hb);
    sxview.backgroundColor = self.view.backgroundColor;
    [_yzm addSubview:sxview];
    //获取验证码
    
    _hqyzmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _hqyzmButton.frame = CGRectMake(SCREEN_WIDTH-230*wb, 15*hb, 200*wb, 70*hb);
    _hqyzmButton.backgroundColor = APP_BLUE;
    [_hqyzmButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    _hqyzmButton.layer.masksToBounds  = YES;
    _hqyzmButton.layer.cornerRadius  = _hqyzmButton.frame.size.width/32;
    if (SCREEN_WIDTH ==320) {
        _hqyzmButton.titleLabel.font = [UIFont systemFontOfSize:14];
    }else
    {
        _hqyzmButton.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    [_hqyzmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_yzm addSubview:_hqyzmButton];
    
    [_hqyzmButton addTarget:self action:@selector(openCountdown) forControlEvents:UIControlEventTouchUpInside];
    
    //新登录密码
    _mynewWord = [self textFieldMakewithtext:@"新登录密码" placeholder:@"6-12位数字和字母组合" withframe:CGRectMake(0, 210*hb, SCREEN_WIDTH, 100*hb) backgroundColor:APP_TEXTFEILD_BACKCOLOR andtag:103 andleftViewframe:CGRectMake(0, 0, 230*wb, 100*hb)];
    _mynewWord.delegate = self ;
    _mynewWord.secureTextEntry = YES;
    _mynewWord.returnKeyType = UIReturnKeyNext;
    [self.view addSubview:_mynewWord];
    
    

    //确认登录密码
    
    _comformWord = [self textFieldMakewithtext:@"确认登录密码" placeholder:@"请输入确认登录密码" withframe:CGRectMake(0, 210*hb +100*hb + 1, SCREEN_WIDTH, 100*hb) backgroundColor:APP_TEXTFEILD_BACKCOLOR andtag:104 andleftViewframe:CGRectMake(0, 0, 230*wb, 100*hb)];
    _comformWord.delegate = self ;
    _comformWord.secureTextEntry = YES;
    _comformWord.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_comformWord];
    
    
    //确定
    _qdButton = [self APPButtonmaker:@"确定" andtitleColor:[UIColor whiteColor]  backColor:APP_BLUE andfont:18.0];
    _qdButton.frame = CGRectMake((SCREEN_WIDTH-580*wb)/2, 545*hb, 580*wb, 80*hb);
    [_qdButton addTarget:self action:@selector(qdbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    _qdButton.layer.masksToBounds = YES;
    _qdButton.layer.cornerRadius = _qdButton.frame.size.width/64;

    [self.view addSubview:_qdButton];
    
}


//确定按钮 这里需要提交网路
-(void)qdbuttonClick{
    [_comformWord resignFirstResponder];

    if (![_comformWord.text isEqualToString:_mynewWord.text]) {
        
        _alert = [[MyAlertView alloc]initWithNormalAndNOCancell];
        [_alert setTitile:@"提示" message:@"密码和再次输入密码不相同"];
        __weak typeof(self)weakself = self;
        [_alert setOkBlock:^{
            weakself.comformWord.text = nil;
        }];
        
        [self.view addSubview:_alert];
        
        return;
    }
  
   // [self.navigationController popViewControllerAnimated:YES];
    
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
                 self.hqyzmButton.backgroundColor = APP_BLUE;
                self.hqyzmButton.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = self.time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.hqyzmButton setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                [self.hqyzmButton setBackgroundColor:APP_Gray];
               // [self.hqyzmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [self.hqyzmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                self.hqyzmButton.userInteractionEnabled = NO;
            });
            self.time--;
        }
    });
    dispatch_resume(self.timer);
}

-(void)backBtnClick
{
    [super backBtnClick];
    if (self.time >0) {
        NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
        [def setObject:@"timeNotOver" forKey:@"mytimer"];
        
    }else
    {
        NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
        [def setObject:@"timeIsOver" forKey:@"mytimer"];
    }
    
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
