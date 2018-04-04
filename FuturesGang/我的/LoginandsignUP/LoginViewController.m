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
    image.backgroundColor = RGBA(218, 84, 54, 1);
    image.layer.masksToBounds = YES;
    image.layer.cornerRadius =  image.frame.size.width/2;
    [self.view addSubview:image];
    
    
    //账号 切圆角
    _zhTextview = [[UITextField alloc]init];
    _zhTextview.frame = CGRectMake((SCREEN_WIDTH-580*wb)/2, 520*hb, 580*wb, 88*hb);
    [self.view addSubview:_zhTextview];
    _zhTextview.delegate = self;
    _zhTextview.tag = 101;
    _zhTextview.returnKeyType = UIReturnKeyNext;
    _zhTextview.layer.masksToBounds = YES;
    _zhTextview.layer.cornerRadius  = _zhTextview.frame.size.height/16;
    
    _zhTextview.backgroundColor = RGBA(66, 69, 87, 1);
    
    UIView * leftview = [[UIView alloc]init];
    leftview.frame = CGRectMake(0, 0, 155*wb, 90*hb);
    leftview.backgroundColor =RGBA(66, 69, 87, 1);
    [_zhTextview addSubview:leftview];
    
    UILabel * label = [[UILabel alloc]init];
    label.frame =CGRectMake(60*wb, 28*hb, 75*wb, 30*hb);
    label.textColor = [UIColor whiteColor];
    label.text =@"账号";
    if (SCREEN_WIDTH == 320) {
        label.font = [UIFont systemFontOfSize:14];
    }else
    {
    label.font = [UIFont systemFontOfSize:16];
    }
    label.textAlignment = NSTextAlignmentLeft;
    [leftview addSubview:label];
    _zhTextview.leftView = leftview;
    _zhTextview.leftViewMode=UITextFieldViewModeAlways;
    
   
    _zhTextview.placeholder =@"用户名或手机号";
    [_zhTextview setValue:RGBA(150, 160, 190, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_zhTextview setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    
    //密码
    _mmTextview = [[UITextField alloc]init];
    _mmTextview.frame = CGRectMake((SCREEN_WIDTH-580*wb)/2, 520*hb+90*hb, 580*wb, 88*hb);
    [self.view addSubview:_mmTextview];
    _mmTextview.delegate = self;
    _mmTextview.tag = 102;
    _mmTextview.returnKeyType = UIReturnKeyDone;
    _mmTextview.layer.masksToBounds = YES;
    _mmTextview.layer.cornerRadius  = _mmTextview.frame.size.height/16;
    
    _mmTextview.backgroundColor = RGBA(66, 69, 87, 1);
    
    UIView * mleftview = [[UIView alloc]init];
    mleftview.frame = CGRectMake(0, 0, 155*wb, 90*hb);
    mleftview.backgroundColor =RGBA(66, 69, 87, 1);
    [_mmTextview addSubview:mleftview];
    
    UILabel * mlabel = [[UILabel alloc]init];
    mlabel.frame =CGRectMake(60*wb, 28*hb, 75*wb, 30*hb);
    mlabel.textColor = [UIColor whiteColor];
    mlabel.text =@"密码";
    if (SCREEN_WIDTH == 320) {
        mlabel.font = [UIFont systemFontOfSize:14];
    }else
    {
        mlabel.font = [UIFont systemFontOfSize:16];
    }
    mlabel.textAlignment = NSTextAlignmentLeft;
    [mleftview addSubview:mlabel];
    _mmTextview.leftView = mleftview;
    _mmTextview.leftViewMode=UITextFieldViewModeAlways;
    
    
    _mmTextview.placeholder =@"请输入登录密码";
    [_mmTextview setValue:RGBA(150, 160, 190, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [_mmTextview setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    

    //忘记密码
    UIButton * wjbutton = [[UIButton alloc]init];
    wjbutton.frame = CGRectMake(86*wb,  520*hb+90*hb+88*hb, 250*wb, 60*hb);
    [wjbutton setTitleColor:RGBA(63, 111, 198, 1) forState:UIControlStateNormal];
    [wjbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [wjbutton setTitle:@"忘记密码" forState:UIControlStateNormal];
    if (SCREEN_WIDTH == 320) {
        wjbutton.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    }else
    {
        wjbutton.titleLabel.font = [UIFont systemFontOfSize: 18.0];
    }
    [wjbutton addTarget:self action:@selector(wordforgetAndGetBack) forControlEvents:UIControlEventTouchUpInside];
    
    wjbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.view addSubview:wjbutton];
    
    //免费注册
    
    UIButton * mfbutton = [[UIButton alloc]init];
    mfbutton.frame = CGRectMake(SCREEN_WIDTH-86*wb-250*wb,  520*hb+90*hb+88*hb, 250*wb, 60*hb);
    [mfbutton setTitleColor:RGBA(63, 111, 198, 1) forState:UIControlStateNormal];
     [mfbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [mfbutton setTitle:@"免费注册" forState:UIControlStateNormal];
    if (SCREEN_WIDTH == 320) {
        mfbutton.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    }else
    {
        mfbutton.titleLabel.font = [UIFont systemFontOfSize: 18.0];
    }
     [mfbutton addTarget:self action:@selector(registeForFree) forControlEvents:UIControlEventTouchUpInside];
    mfbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.view addSubview:mfbutton];
    
    
    
    //登录按钮
    
    UIButton * dlbutton = [[UIButton alloc]init];
    dlbutton.frame = CGRectMake((SCREEN_WIDTH-580*wb)/2, 520*hb+90*hb+88*hb+190*hb, 580*wb, 80*hb);
    [dlbutton setBackgroundColor:APP_BLUE];
    [dlbutton setTitle:@"登录" forState:UIControlStateNormal];
    [dlbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    if (SCREEN_WIDTH == 320) {
         dlbutton.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    }else
    {
        dlbutton.titleLabel.font = [UIFont systemFontOfSize: 18.0];
    }
    [dlbutton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    dlbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    dlbutton.layer.masksToBounds =YES;
    dlbutton.layer.cornerRadius = dlbutton.frame.size.width/64;
    [self.view addSubview:dlbutton];
    
    
    
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
    
    RootTabViewController * vc = [[RootTabViewController alloc]init];
  //  [self presentModalViewController:vc animated:YES];
     [self presentViewController:vc animated:YES completion:Nil];
    
    
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
