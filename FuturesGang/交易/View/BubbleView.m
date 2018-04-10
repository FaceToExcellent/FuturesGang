//
//  BubbleView.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/10.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "BubbleView.h"

@implementation BubbleView
-(instancetype)init
{
    if (self = [super init]) {
        
        [self makeUI];
    }
    return self;
}


-(void)makeUI{
    
    // 创建一个按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 设置按钮的frame
    btn.frame = CGRectMake(0, 0, 350*wb, 430*hb);
    
    
    
    // 加载图片
    UIImage *image = [UIImage imageNamed:@"CDXL"];
    
    
    UIImage * img  =  [self image:image WithColor:[UIColor whiteColor]];
    
    // 设置端盖的值
    CGFloat top = img.size.height * 0.5;
    CGFloat left = img.size.width * 0.5;
    CGFloat bottom = img.size.height * 0.5;
    CGFloat right = img.size.width * 0.5;
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
    
    // 拉伸图片
    UIImage *newImage = [img resizableImageWithCapInsets:edgeInsets];
    
    // 设置按钮的背景图片
    [btn setBackgroundImage:newImage forState:UIControlStateNormal];
    
    
    
    
    // 将按钮添加到控制器的view
    [self addSubview:btn];
    
   
    
    
}

@end
