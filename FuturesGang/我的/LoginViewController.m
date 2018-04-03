//
//  LoginViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(31, 33,44, 1.0f);
    
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
    UITextField * zhTextview = [[UITextField alloc]init];
    zhTextview.frame = CGRectMake((SCREEN_WIDTH-580*wb)/2, 520*hb, 580*wb, 88*hb);
    [self.view addSubview:zhTextview];
    
    zhTextview.layer.masksToBounds = YES;
    zhTextview.layer.cornerRadius  = zhTextview.frame.size.height/16;
    
    zhTextview.backgroundColor = RGBA(66, 69, 87, 1);
    
    UIView * leftview = [[UIView alloc]init];
    leftview.frame = CGRectMake(0, 0, 155*wb, 90*hb);
    leftview.backgroundColor =RGBA(66, 69, 87, 1);
    [zhTextview addSubview:leftview];
    
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
    zhTextview.leftView = leftview;
    zhTextview.leftViewMode=UITextFieldViewModeAlways;
    
   
    zhTextview.placeholder =@"用户名或手机号";
    [zhTextview setValue:RGBA(150, 160, 190, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [zhTextview setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    
    //密码
    UITextField * mmTextview = [[UITextField alloc]init];
    mmTextview.frame = CGRectMake((SCREEN_WIDTH-580*wb)/2, 520*hb+90*hb, 580*wb, 88*hb);
    [self.view addSubview:mmTextview];
    
    mmTextview.layer.masksToBounds = YES;
    mmTextview.layer.cornerRadius  = zhTextview.frame.size.height/16;
    
    mmTextview.backgroundColor = RGBA(66, 69, 87, 1);
    
    UIView * mleftview = [[UIView alloc]init];
    mleftview.frame = CGRectMake(0, 0, 155*wb, 90*hb);
    mleftview.backgroundColor =RGBA(66, 69, 87, 1);
    [mmTextview addSubview:mleftview];
    
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
    mmTextview.leftView = mleftview;
    mmTextview.leftViewMode=UITextFieldViewModeAlways;
    
    
    mmTextview.placeholder =@"请输入登录密码";
    [mmTextview setValue:RGBA(150, 160, 190, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [mmTextview setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    

    
    
    
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
