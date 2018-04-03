//
//  MycenterHeadView.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "MycenterHeadView.h"

@implementation MycenterHeadView

/*@property(nonatomic,strong)UILabel * zjlabel;
 @property(nonatomic,strong)UILabel * rzjLabel;
 @property(nonatomic,strong)UIButton * czButton;
 @property(nonatomic,strong)UIButton * txButton;*/
-(instancetype)init
{
    if (self = [super init]) {
        
        self.backgroundColor = RGBA(31, 33, 44, 1);
        [self makeUI];
    }
    return self;
}


-(void)makeUI{
    //line
    UIView * lineview = [[UIView alloc]init];
    lineview.frame = CGRectMake(0, 0, SCREEN_WIDTH, 2);
    lineview.backgroundColor = RGBA(23, 24, 34, 1);
    [self addSubview:lineview];
    
    
    //我的资金
    
    _zjlabel = [[UILabel alloc]init];
    _zjlabel.frame = CGRectMake((SCREEN_WIDTH -250*wb)/2, 65*hb, 250*wb, 35*hb);
    _zjlabel.text =@"我的资金";
    _zjlabel.textColor = [UIColor whiteColor];
    _zjlabel.backgroundColor =RGBA(31, 33, 44, 1);
    _zjlabel.textAlignment = NSTextAlignmentCenter;
    if (SCREEN_WIDTH == 320) {
         _zjlabel.font = [UIFont systemFontOfSize:12];
    }else
    {
        _zjlabel.font = [UIFont systemFontOfSize:14];
    }
    [self addSubview:_zjlabel];
    
    //钱数
    
    _rzjLabel = [[UILabel alloc]init];
    _rzjLabel.frame = CGRectMake((SCREEN_WIDTH -450*wb)/2, 65*hb+80*hb, 450*wb, 35*hb);
    _rzjLabel.text =@"1234567890";
    _rzjLabel.textColor = [UIColor whiteColor];
    _rzjLabel.backgroundColor =RGBA(31, 33, 44, 1);
    _rzjLabel.textAlignment = NSTextAlignmentCenter;
    if (SCREEN_WIDTH == 320) {
        _rzjLabel.font = [UIFont systemFontOfSize:18];
    }else
    {
        _rzjLabel.font = [UIFont systemFontOfSize:20];
    }
    [self addSubview:_rzjLabel];
    
    //充值
    _czButton = [[UIButton alloc]init];
    _czButton.frame =CGRectMake(26*wb, 340*hb-80*hb, 300*wb, 80*hb);
    [_czButton setBackgroundColor:RGBA(61, 108, 196, 1)];
    [_czButton setTitle:@"充值" forState:UIControlStateNormal];
    [_czButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _czButton.titleLabel.font = [UIFont systemFontOfSize:16];
    _czButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    _czButton.layer.masksToBounds = YES;
    _czButton.layer.cornerRadius = _czButton.frame.size.width/32;
    [self addSubview:_czButton];
    
    
    //提现
    
    _txButton = [[UIButton alloc]init];
    _txButton.frame =CGRectMake(SCREEN_WIDTH-326*hb, 340*hb-80*hb, 300*wb, 80*hb);
    [_txButton setBackgroundColor:RGBA(61, 108, 196, 1)];
    [_txButton setTitle:@"提现" forState:UIControlStateNormal];
    [_txButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _txButton.titleLabel.font = [UIFont systemFontOfSize:16];
    _txButton.layer.masksToBounds = YES;
    _txButton.layer.cornerRadius = _txButton.frame.size.width/32;
    _txButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self addSubview:_txButton];
    
    
    
    
    
}
@end
