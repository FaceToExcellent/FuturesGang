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

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self MakeUIWithframe:frame];
    }
    return self;
}


-(void)bgimageMakeWith:(CGRect)frame{
    
    // 创建一个按钮
    _bgImage = [[UIImageView alloc]init];
    
    // 设置按钮的frame
    _bgImage.frame = frame;
    
    
    
    // 加载图片
    UIImage *image = [UIImage imageNamed:@"CDXL"];
    
    
    UIImage * img  =  [self image:image WithColor:APP_TEXTFEILD_BACKCOLOR];
    
    // 设置端盖的值
    CGFloat top = img.size.height * 0.5;
    CGFloat left = img.size.width * 0.5;
    CGFloat bottom = img.size.height * 0.5;
    CGFloat right = img.size.width * 0.5;
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
    
    // 拉伸图片
    UIImage *newImage = [img resizableImageWithCapInsets:edgeInsets];
    
    // 设置按钮的背景图片
    _bgImage.image = newImage;
    
    //这句很重要，因为是默认关闭的
    _bgImage.userInteractionEnabled = YES;
    
    // 将按钮添加到控制器的view
    [self addSubview:_bgImage];
    
}


-(void)MakeUIWithframe:(CGRect)frame{
    
   
    [self bgimageMakeWith:frame];
    
    //资金详情
    
    UIButton * zjxqButton = [[UIButton alloc]init];
    zjxqButton.frame = CGRectMake(30*wb, 30*hb, 290*wb, 90*hb);
    //[zjxqButton setBackgroundColor:[UIColor redColor]];
    [zjxqButton setTitle:@"资金详情" forState:UIControlStateNormal];
    [zjxqButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    zjxqButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [zjxqButton addTarget:self action:@selector(zjxqButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:zjxqButton];
    
    //line
    
    UIView * line1  = [[UIView alloc]init];
    line1.frame = CGRectMake(30*wb, 122*wb, 290*wb, 1);
    line1.backgroundColor = APP_Gray;
    [self addSubview:line1];
    
    //出入金
    UIButton * crjButton = [[UIButton alloc]init];
    crjButton.frame = CGRectMake(30*wb, 125*wb , 290*wb, 90*wb);
    [crjButton setTitle:@"出入金" forState:UIControlStateNormal];
    [crjButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    crjButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [crjButton addTarget:self action:@selector(crjButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:crjButton];
    //line2
    UIView * line2  = [[UIView alloc]init];
    line2.frame = CGRectMake(30*wb, 217*wb, 290*wb, 1);
    line2.backgroundColor = APP_Gray;
    [self addSubview:line2];
    
    
    //退出登录
    UIButton * tcdlButton = [[UIButton alloc]init];
    tcdlButton.frame = CGRectMake(30*wb, 220*wb , 290*wb, 90*wb);
    [tcdlButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [tcdlButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    tcdlButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [tcdlButton addTarget:self action:@selector(tcdlButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tcdlButton];
    //line4
    UIView * line4  = [[UIView alloc]init];
    line4.frame = CGRectMake(30*wb,312*wb, 290*wb, 1);
    line4.backgroundColor = APP_Gray;
    [self addSubview:line4];
}



-(void)makeUI{
    
 
     //创建默认大小
   [self bgimageMakeWith: CGRectMake(0, 0, 350*wb, 430*hb)];
   
   
   
    //资金详情
    
    UIButton * zjxqButton = [[UIButton alloc]init];
    zjxqButton.frame = CGRectMake(30*wb, 30*hb, 290*wb, 90*hb);
    //[zjxqButton setBackgroundColor:[UIColor redColor]];
    [zjxqButton setTitle:@"资金详情" forState:UIControlStateNormal];
    [zjxqButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    zjxqButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [zjxqButton addTarget:self action:@selector(zjxqButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:zjxqButton];
    
    
    
    
    //line
    
    UIView * line1  = [[UIView alloc]init];
    line1.frame = CGRectMake(30*wb, 122*wb, 290*wb, 1);
    line1.backgroundColor = APP_Gray;
    [self addSubview:line1];
    
    //出入金
    UIButton * crjButton = [[UIButton alloc]init];
    crjButton.frame = CGRectMake(30*wb, 125*wb , 290*wb, 90*wb);
    [crjButton setTitle:@"出入金" forState:UIControlStateNormal];
    [crjButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    crjButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [crjButton addTarget:self action:@selector(crjButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:crjButton];
    //line2
    UIView * line2  = [[UIView alloc]init];
    line2.frame = CGRectMake(30*wb, 217*wb, 290*wb, 1);
    line2.backgroundColor = APP_Gray;
    [self addSubview:line2];
    

    
    //退出登录
    UIButton * tcdlButton = [[UIButton alloc]init];
    tcdlButton.frame = CGRectMake(30*wb, 220*wb , 290*wb, 90*wb);
    [tcdlButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [tcdlButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    tcdlButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [tcdlButton addTarget:self action:@selector(tcdlButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tcdlButton];
    //line4
    UIView * line4  = [[UIView alloc]init];
    line4.frame = CGRectMake(30*wb,312*wb, 290*wb, 1);
    line4.backgroundColor = APP_Gray;
    [self addSubview:line4];
}

-(void)tcdlButtonClick{
    if (_delegate) {
        //退出登录
        [_delegate BubbleViewDelegatePushWithTag:1004];
    }
}
//-(void)jyszButtonCLick{
//    if (_delegate) {
//        //交易设置
//        [_delegate BubbleViewDelegatePushWithTag:1003];
//    }
//}

-(void)zjxqButtonCLick{
    if (_delegate) {
         //资金详情
        [_delegate BubbleViewDelegatePushWithTag:1001];
    }
}
-(void)crjButtonCLick{
    if (_delegate) {
        //出入金
        [_delegate BubbleViewDelegatePushWithTag:1002];
    }
}






@end
