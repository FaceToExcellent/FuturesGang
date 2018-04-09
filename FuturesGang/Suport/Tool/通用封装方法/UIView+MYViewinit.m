//
//  UIView+MYViewinit.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/9.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "UIView+MYViewinit.h"

@implementation UIView (MYViewinit)


//UITextField maker
-(UITextField*)textFieldMakewithtext:(NSString *)text placeholder:(NSString *)placeholder withframe:(CGRect)rect backgroundColor:(UIColor*)color andtag:(NSInteger)tag andleftViewframe:(CGRect)leftframe{
    UITextField * textfield =  [[UITextField alloc]init];
    
    textfield.frame = rect;
    textfield.tag = tag;
    textfield.backgroundColor = color;
    
    UIView * leftview = [[UIView alloc]init];
    leftview.frame = leftframe;
    leftview.backgroundColor =color;
    [textfield addSubview:leftview];
    
    UILabel * label = [[UILabel alloc]init];
    label.frame =CGRectMake(30*wb, (leftframe.size.height -30*hb)/2-1, leftframe.size.width-30*wb, 30*hb);
    label.textColor = [UIColor whiteColor];
    label.text =text;
    if (SCREEN_WIDTH == 320) {
        label.font = [UIFont systemFontOfSize:13];
    }else
    {
        label.font = [UIFont systemFontOfSize:15];
    }
    label.textAlignment = NSTextAlignmentLeft;
    [leftview addSubview:label];
    textfield.leftView = leftview;
    textfield.leftViewMode=UITextFieldViewModeAlways;
    
    
    textfield.placeholder =placeholder;
    [textfield setValue:RGBA(150, 160, 190, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [textfield setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    return textfield;
}


//UIButton maker
-(UIButton*)APPButtonmaker:(NSString*)title andtitleColor:(UIColor*)titleColor  backColor:(UIColor*)color andfont:(float)font{
    UIButton * button =[[UIButton alloc]init];
    
    [button setBackgroundColor:color];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    if (SCREEN_WIDTH == 320) {
        button.titleLabel.font = [UIFont systemFontOfSize: font-2];
    }else
    {
        button.titleLabel.font = [UIFont systemFontOfSize: font];
    }
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    
    return  button;
}



@end
