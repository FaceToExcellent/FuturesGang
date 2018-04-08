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
@property(nonatomic,strong)UITextField * tjWord;
@property(nonatomic,strong)UIButton    * zcButton;


@property(nonatomic,strong) dispatch_source_t timer;
@property(nonatomic,assign) __block NSInteger time;
@end

@implementation SignUPViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setnaviTitle:@"注册"];
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
    
    _phoneNumber = [self textFieldMakewithtext:@"手机号" placeholder:@"请输入手机号码" withframe:CGRectMake(0, 0, SCREEN_WIDTH, 100*hb) backgroundColor:APP_TEXTFEILD_BACKCOLOR andtag:101 andleftViewframe: CGRectMake(0, 0, 175*wb, 100*hb)];
    _phoneNumber.returnKeyType = UIReturnKeyNext;
    _phoneNumber.delegate = self ;
    [self.view addSubview:_phoneNumber];
   
    //验证码
    
    _yzm = [self textFieldMakewithtext:@"验证码" placeholder:@"请输入验证码" withframe:CGRectMake(0, 100*hb +1, SCREEN_WIDTH, 100*hb) backgroundColor:APP_TEXTFEILD_BACKCOLOR andtag:102 andleftViewframe: CGRectMake(0, 0, 175*wb, 100*hb)];
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
    _hqyzmButton.frame = CGRectMake(SCREEN_WIDTH-215*wb + 2, 0, 210*wb, 100*hb);
    _hqyzmButton.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
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
    
    //登录密码
    
    _spnewWord = [self textFieldMakewithtext:@"登录密码" placeholder:@"6-12位数字和字母组合" withframe:CGRectMake(0, 210*hb, SCREEN_WIDTH, 100*hb) backgroundColor:APP_TEXTFEILD_BACKCOLOR andtag:103 andleftViewframe: CGRectMake(0, 0, 230*wb, 100*hb)];
    _spnewWord.delegate = self ;
    _spnewWord.returnKeyType = UIReturnKeyNext;
    [self.view addSubview:_spnewWord];
    
    
    
    //推荐码
    _tjWord = [self textFieldMakewithtext:@"推荐码" placeholder:@"请输入推荐码" withframe:CGRectMake(0, 310*hb+1, SCREEN_WIDTH, 100*hb) backgroundColor:APP_TEXTFEILD_BACKCOLOR andtag:104 andleftViewframe: CGRectMake(0, 0, 230*wb, 100*hb)];
    _tjWord.delegate = self ;
    _tjWord.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_tjWord];
    
  //注册
    _zcButton = [self APPButtonmaker:@"注册" andtitleColor:[UIColor whiteColor]  backColor:APP_BLUE andfont:18.0];
    _zcButton.frame = CGRectMake((SCREEN_WIDTH-580*wb)/2, 550*hb, 580*wb, 80*hb);
    [_zcButton addTarget:self action:@selector(zcButtonClick) forControlEvents:UIControlEventTouchUpInside];
    _zcButton.layer.masksToBounds = YES;
    _zcButton.layer.cornerRadius = _zcButton.frame.size.width/64;
    
    [self.view addSubview:_zcButton];
}

-(void)zcButtonClick{
    [self.navigationController popViewControllerAnimated:YES];
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
