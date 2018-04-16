//
//  LoginViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetWordViewController.h"
#import "SignUPViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField * zhTextview;
@property(nonatomic,strong) UITextField * mmTextview;
@property(nonatomic,strong) UIButton * dlbutton;
@property(nonatomic,strong) UIButton * wjbutton;
@property(nonatomic,strong) UIButton * mfbutton;

@property(nonatomic,copy)NSString * message;
@property(nonatomic,strong)MyAlertView * alert;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APP_BACKCOLOR;
    
    [self loginUIMake];
}


-(void)loginUIMake{
    
    //logo
    UIImageView * image = [[UIImageView alloc]init];
    image.frame = CGRectMake((SCREEN_WIDTH-220*wb)/2, 184*hb, 220*wb, 220*wb);
    //image.backgroundColor = RGBA(218, 84, 54, 1);
    image.image = [UIImage imageNamed:@"FuturesGang"];
    image.layer.masksToBounds = YES;
    image.layer.cornerRadius =  image.frame.size.width/2;
    [self.view addSubview:image];
    
    
    //账号 切圆角
    _zhTextview = [self textFieldMakewithtext:@"账号" placeholder:@"请输入手机号" withframe:CGRectMake((SCREEN_WIDTH-580*wb)/2, 520*hb, 580*wb, 88*hb) backgroundColor:RGBA(66, 69, 87, 1) andtag:101 andleftViewframe: CGRectMake(0, 0, 155*wb, 90*hb)];
    _zhTextview.delegate = self ;
    _zhTextview.returnKeyType = UIReturnKeyNext;
    [self.view addSubview:_zhTextview];
    _zhTextview.layer.masksToBounds = YES;
    _zhTextview.layer.cornerRadius  = _zhTextview.frame.size.height/16;
    
   
    
    //密码
    
    _mmTextview = [self textFieldMakewithtext:@"密码" placeholder:@"请输入登录密码" withframe:CGRectMake((SCREEN_WIDTH-580*wb)/2, 520*hb+90*hb, 580*wb, 88*hb) backgroundColor:RGBA(66, 69, 87, 1) andtag:102 andleftViewframe: CGRectMake(0, 0, 155*wb, 90*hb)];
    _mmTextview.delegate = self ;
    _mmTextview.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_mmTextview];
    _mmTextview.layer.masksToBounds = YES;
    _mmTextview.secureTextEntry = YES;
    _mmTextview.layer.cornerRadius  = _mmTextview.frame.size.height/16;
 
    

    //忘记密码
    _wjbutton = [[UIButton alloc]init];
    _wjbutton.frame = CGRectMake(86*wb,  520*hb+90*hb+88*hb, 250*wb, 60*hb);
    [_wjbutton setTitleColor:RGBA(63, 111, 198, 1) forState:UIControlStateNormal];
    [_wjbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_wjbutton setTitle:@"忘记密码" forState:UIControlStateNormal];
    if (SCREEN_WIDTH == 320) {
        _wjbutton.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    }else
    {
        _wjbutton.titleLabel.font = [UIFont systemFontOfSize: 18.0];
    }
    [_wjbutton addTarget:self action:@selector(wordforgetAndGetBack) forControlEvents:UIControlEventTouchUpInside];
    
    _wjbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.view addSubview:_wjbutton];
    
    //免费注册
    
    _mfbutton = [[UIButton alloc]init];
    _mfbutton.frame = CGRectMake(SCREEN_WIDTH-86*wb-250*wb,  520*hb+90*hb+88*hb, 250*wb, 60*hb);
    [_mfbutton setTitleColor:RGBA(63, 111, 198, 1) forState:UIControlStateNormal];
     [_mfbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_mfbutton setTitle:@"免费注册" forState:UIControlStateNormal];
    if (SCREEN_WIDTH == 320) {
        _mfbutton.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    }else
    {
        _mfbutton.titleLabel.font = [UIFont systemFontOfSize: 18.0];
    }
     [_mfbutton addTarget:self action:@selector(registeForFree) forControlEvents:UIControlEventTouchUpInside];
    _mfbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.view addSubview:_mfbutton];
    
    
    
    //登录按钮
    
    
    _dlbutton = [self APPButtonmaker:@"登录" andtitleColor:[UIColor whiteColor]  backColor:APP_BLUE andfont:18.0];
    _dlbutton.frame = CGRectMake((SCREEN_WIDTH-580*wb)/2, 520*hb+90*hb+88*hb+190*hb, 580*wb, 80*hb);
    [_dlbutton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    _dlbutton.layer.masksToBounds = YES;
    _dlbutton.layer.cornerRadius = _dlbutton.frame.size.width/64;
    
    [self.view addSubview:_dlbutton];
    
    
  
    
    
    
}
//忘记密码
-(void)wordforgetAndGetBack{
 //  #import "ForgetWordViewController.h"
    ForgetWordViewController * fvc = [[ForgetWordViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];
    
}
//免费注册
-(void)registeForFree{
    
    SignUPViewController * fvc = [[SignUPViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];
}
//登录按钮 这里需要登录成功或者失败
-(void)loginClick{
    
     [self dismissViewControllerAnimated:YES completion:nil];
    
    //NSLog(@"URL_Regist--%@",URL_Regist);
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithCapacity:2];
    [parameters setObject:_zhTextview.text forKey:@"phone"];
    [parameters setObject:_mmTextview.text forKey:@"password"];
    __weak typeof(self)weakself = self;
    [AFNetworkTool postJSONWithUrl:URL_loginuser parameters:parameters images:nil imageKey:nil success:^(id dict) {
//        NSLog(@"%@",dict);
//        NSLog(@"URL_Regist%@",dict[@"msg"]);
       
        weakself.message = dict[@"msg"];
        
        if (![dict[@"status"] isEqualToString:@"1"]) {
            weakself.alert = [[MyAlertView alloc]initWithNormalAndNOCancell];
            [weakself.alert setTitile:@"登录失败" message:weakself.message];
            [weakself.alert setOkBlock:^{
                
                weakself.zhTextview.text = nil;
                weakself.mmTextview.text = nil;
            }];
            
            
            
            [weakself.view addSubview:weakself.alert];
        }else
        {
            NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
            [def setObject:dict[@"TokenId"] forKey:@"APP_TokenId"];
            [def setObject:dict[@"uid"] forKey:@"APP_Uid"];
            
            
                RootTabViewController * vc = [[RootTabViewController alloc]init];
              //  [self presentModalViewController:vc animated:YES];
                 [self presentViewController:vc animated:YES completion:Nil];
            
        }
    } fail:^(NSError *error) {
        
        //网络错误的时候
      
    }];
    
    
    
    
//    RootTabViewController * vc = [[RootTabViewController alloc]init];
//  //  [self presentModalViewController:vc animated:YES];
//     [self presentViewController:vc animated:YES completion:Nil];
    
    
}
#pragma mark textField delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField becomeFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.tag == 101) {
        [_zhTextview resignFirstResponder];
        [_mmTextview becomeFirstResponder];
    }else
    {
        [_mmTextview resignFirstResponder];
    }
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
