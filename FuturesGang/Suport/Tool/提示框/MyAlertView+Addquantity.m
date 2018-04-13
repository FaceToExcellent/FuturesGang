//
//  MyAlertView+Addquantity.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/13.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "MyAlertView+Addquantity.h"

@implementation MyAlertView (Addquantity)


-(id)initWithAddquantity{
    if (self = [super init]) {
        
        [self setbackground];
        [self makeUIAddquantity];
        
    }
    return self;
}

-(void)makeUIAddquantity{
    
    
    UIView * bgview = [[UIView alloc]init];
    bgview.frame = CGRectMake((SCREEN_WIDTH-550*wb)/2, 300*hb, 550*wb, 300*hb);
    [bgview setBackgroundColor:[UIColor whiteColor]];
    bgview.layer.masksToBounds = YES;
    bgview.layer.cornerRadius = bgview.frame.size.width/32;
    [self addSubview:bgview];
    
    //标题
    self.Alerttitle = [[UILabel alloc]init];
    self.Alerttitle.frame =CGRectMake(0, 30*hb, 550*wb, 40*hb);
    [self.Alerttitle setText:@"请输入默认交易加量数"];
    [self.Alerttitle setTextColor:[UIColor blackColor]];
    [self.Alerttitle setFont:[UIFont systemFontOfSize:14]];
    self.Alerttitle.textAlignment = NSTextAlignmentCenter;
    self.Alerttitle.numberOfLines = 1;
    [bgview addSubview:self.Alerttitle];
    
    self.AddquantityFeild  = [[UITextField alloc]init];
    self.AddquantityFeild.frame = CGRectMake(24*wb, 100*hb, bgview.frame.size.width-48*wb, 60*hb);
    self.AddquantityFeild.layer.masksToBounds = YES;
    self.AddquantityFeild.layer.cornerRadius = 60*hb/8;
    self.AddquantityFeild.layer.borderWidth = .5;
    self.AddquantityFeild.layer.borderColor = [UIColor grayColor].CGColor;
    self.AddquantityFeild.keyboardType  = UIKeyboardTypeNumberPad;
    self.AddquantityFeild.placeholder = @"请输入数量";
    [self.AddquantityFeild setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.AddquantityFeild setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    [bgview addSubview:self.AddquantityFeild];
    
    UIView * leftview = [[UIView alloc]init];
    leftview.frame = CGRectMake(0, 0, 165*wb, 60*hb);
    leftview.backgroundColor = [UIColor whiteColor];
    [self.AddquantityFeild addSubview:leftview];
    
    self.AddquantityFeild.leftView = leftview;
    self.AddquantityFeild.leftViewMode=UITextFieldViewModeAlways;
    
    //line1
    
    UIView * line1  =[[UIView alloc]init];
    line1.frame =CGRectMake(0, 210*hb, 550*wb, 1);
    line1.backgroundColor = RGBA(243, 243, 243, 1);
    [bgview addSubview:line1];
    
    //lin2
    
    UIView * line2  =[[UIView alloc]init];
    line2.frame =CGRectMake(550*wb/2, 210*hb,1 , bgview.frame.size.height-160*wb);
    line2.backgroundColor = RGBA(243, 243, 243, 1);
    [bgview addSubview:line2];
    
    
    //取消
    UIButton * cancelButton = [[UIButton alloc]init];
    cancelButton.frame = CGRectMake(0,210*hb, 260*wb, 85*hb);
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:APP_BLUE forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancelButton addTarget:self action:@selector(qxButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:cancelButton];
    //确定
    UIButton * qdButton = [[UIButton alloc]init];
    qdButton.frame = CGRectMake(bgview.frame.size.width -260*wb, 210*hb, 260*wb, 85*hb);
    [qdButton setTitle:@"确定" forState:UIControlStateNormal];
    [qdButton setTitleColor:APP_BLUE forState:UIControlStateNormal];
    [qdButton addTarget:self action:@selector(AddquantityqdButtonClick) forControlEvents:UIControlEventTouchUpInside];
    qdButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [bgview addSubview:qdButton];
    
    
    
    
}

-(void)AddquantityqdButtonClick{
    if (self.AddquantityFeild.text.length>0) {
        self.addquantityBlock(self.AddquantityFeild.text);
    }else
    {
        self.addquantityBlock(@"1");
    }
    
    [self cancelButtonClick];
}

@end
