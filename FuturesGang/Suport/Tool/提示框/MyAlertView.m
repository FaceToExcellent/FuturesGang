//
//  MyAlertView.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/10.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "MyAlertView.h"

@implementation MyAlertView

-(id)initWithNormal{
    
    if (self = [super init]) {
        
        [self setbackground];
        [self makeUI];
    }
    return self;
}

-(void)setbackground{
    self.backgroundColor = [UIColor clearColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelButtonClick)];
    [view addGestureRecognizer:tap];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.5;
    [self addSubview:view];
    self.alpha = 1;
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}
-(void)makeUI{
  
    UIView * bgview = [[UIView alloc]init];
    bgview.frame = CGRectMake((SCREEN_WIDTH-550*wb)/2, 430*hb, 550*wb, 250*hb);
    [bgview setBackgroundColor:[UIColor whiteColor]];
    bgview.layer.masksToBounds = YES;
    bgview.layer.cornerRadius = bgview.frame.size.width/32;
    [self addSubview:bgview];
    
    //标题
    _Alerttitle = [[UILabel alloc]init];
    _Alerttitle.frame =CGRectMake(0, 30*hb, 550*wb, 40*hb);
    [_Alerttitle setText:@"警告"];
    [_Alerttitle setTextColor:[UIColor blackColor]];
    [_Alerttitle setFont:[UIFont systemFontOfSize:14]];
    _Alerttitle.textAlignment = NSTextAlignmentCenter;
    _Alerttitle.numberOfLines = 1;
    [bgview addSubview:_Alerttitle];
    
    //message
    _AlertMessage = [[UILabel alloc]init];
    _AlertMessage.frame =CGRectMake(65*wb, 80*hb, 415*wb, 75*hb);
    [_AlertMessage setText:@"打开此功能后,下单时将没有确认提示,请谨慎使用"];
    [_AlertMessage setTextColor:[UIColor blackColor]];
    [_AlertMessage setFont:[UIFont systemFontOfSize:12]];
    _AlertMessage.textAlignment = NSTextAlignmentCenter;
    _AlertMessage.numberOfLines = 2;
    [bgview addSubview:_AlertMessage];
    
    //line1
    
    UIView * line1  =[[UIView alloc]init];
    line1.frame =CGRectMake(0, 160*hb, 550*wb, 1);
    line1.backgroundColor = RGBA(243, 243, 243, 1);
    [bgview addSubview:line1];
    
    //lin2
    
    UIView * line2  =[[UIView alloc]init];
    line2.frame =CGRectMake(550*wb/2, 160*hb,1 , bgview.frame.size.height-160*wb);
    line2.backgroundColor = RGBA(243, 243, 243, 1);
    [bgview addSubview:line2];
    
    
    //取消
    UIButton * cancelButton = [[UIButton alloc]init];
    cancelButton.frame = CGRectMake(0, 160*hb, 260*wb, 85*hb);
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:APP_BLUE forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancelButton addTarget:self action:@selector(qxButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:cancelButton];
    //确定
    UIButton * qdButton = [[UIButton alloc]init];
    qdButton.frame = CGRectMake(bgview.frame.size.width -260*wb, 160*hb, 260*wb, 85*hb);
    [qdButton setTitle:@"确定" forState:UIControlStateNormal];
    [qdButton setTitleColor:APP_BLUE forState:UIControlStateNormal];
    [qdButton addTarget:self action:@selector(qdButtonClick) forControlEvents:UIControlEventTouchUpInside];
    qdButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [bgview addSubview:qdButton];
    
    
    
}
-(void)qxButtonClick{
    //取消
    _cancelBlock();
    [self cancelButtonClick];
   
}
-(void)qdButtonClick{
    //确定
    _okBlock();
    [self cancelButtonClick];
}
-(void)setCancelBlock:(MyAlertViewCancelBLock)cancelBlock{
    _cancelBlock = cancelBlock;
}
-(void)setOkBlock:(MyAlertViewViewOKBLock)okBlock{
    _okBlock = okBlock;
}
- (void)cancelButtonClick
{
     [self removeFromSuperview];
   
}



@end
