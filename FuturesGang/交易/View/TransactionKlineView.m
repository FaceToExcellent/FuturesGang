//
//  TransactionKlineView.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "TransactionKlineView.h"

@implementation TransactionKlineView
/*@property(nonatomic,strong)ColorButton * biggestButton;// isnoBack 1
 @property(nonatomic,strong)ColorButton * leftcolorButton;//  isnoBack 1
 @property(nonatomic,strong)ColorButton * rightcolorButton;// isnoBack 1
 //卖价
 @property(nonatomic,strong)UILabel * maijiaLabel;
 //买价
 @property(nonatomic,strong)UILabel * MjiaLabel;
 @property(nonatomic,strong)UILabel * maijianum;
 @property(nonatomic,strong)UILabel * Mjianum;
 //今开
 @property(nonatomic,strong)UILabel * jinkaiLabel;
 //昨益
 @property(nonatomic,strong)UILabel * zuoyiLabel;
 //最高
 @property(nonatomic,strong)UILabel * zuigaoLabel;
 //最低
 @property(nonatomic,strong)UILabel * zuidiLabel;
 //可用资金
 @property(nonatomic,strong)UILabel * keyongzijinLabel;
*/

-(instancetype)init
{
    if (self = [super init]) {
        
        [self makeUI];
    }
    return self;
}


-(void)makeUI{
    
    _biggestButton =  [[ColorButton alloc]init];
    _biggestButton.frame = CGRectMake(30*wb, 25*hb, 360*wb, 80*hb);
    [_biggestButton setIsnoBack:1];
    [_biggestButton setmystateString:@"1"];
    [_biggestButton setTitle:@"24995" forState:UIControlStateNormal];
    _biggestButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:40];
    _biggestButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:_biggestButton];
    
    
    _leftcolorButton =  [[ColorButton alloc]init];
    _leftcolorButton.frame = CGRectMake(30*wb, 120*hb, 110*wb, 50*hb);
    [_leftcolorButton setIsnoBack:1];
    [_leftcolorButton setmystateString:@"1"];
    [_leftcolorButton setTitle:@"125" forState:UIControlStateNormal];
    _leftcolorButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:35];
    _leftcolorButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:_leftcolorButton];
    
    
    _rightcolorButton =  [[ColorButton alloc]init];
    _rightcolorButton.frame = CGRectMake(130*wb, 120*hb, 240*wb, 50*hb);
    [_rightcolorButton setIsnoBack:1];
    [_rightcolorButton setmystateString:@"1"];
    [_rightcolorButton setTitle:@"+0.050%" forState:UIControlStateNormal];
    _rightcolorButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:35];
    _rightcolorButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:_rightcolorButton];
    
    
    
    
    UILabel * maijia = [[UILabel alloc]init];
    maijia.frame = CGRectMake(430*wb, 50*hb, 70*wb, 30*hb);
    maijia.text = @"卖价";
    maijia.textColor = [UIColor whiteColor];
    maijia.font = [UIFont systemFontOfSize:14];
    [self addSubview:maijia];
    
    _maijiaLabel = [[UILabel alloc]init];
    _maijiaLabel.frame = CGRectMake(530*wb, 50*hb, 130*wb, 30*hb);
    _maijiaLabel.text = @"24995";
    _maijiaLabel.textColor = [UIColor whiteColor];
    _maijiaLabel.textAlignment = NSTextAlignmentRight;
    _maijiaLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_maijiaLabel];
    
    _maijianum = [[UILabel alloc]init];
    _maijianum.frame = CGRectMake(SCREEN_WIDTH-100*wb, 50*hb, 70*wb, 30*hb);
    _maijianum.text = @"5";
    _maijianum.textColor = [UIColor whiteColor];
    _maijianum.textAlignment = NSTextAlignmentRight;
    _maijianum.font = [UIFont systemFontOfSize:14];
    [self addSubview:_maijianum];
    
    
    UILabel * Mjia = [[UILabel alloc]init];
    Mjia.frame = CGRectMake(430*wb, 130*hb, 70*wb, 30*hb);
    Mjia.text = @"买价";
    Mjia.textColor = [UIColor whiteColor];
    Mjia.font = [UIFont systemFontOfSize:14];
    [self addSubview:Mjia];
    
    _MjiaLabel = [[UILabel alloc]init];
    _MjiaLabel.frame = CGRectMake(530*wb, 130*hb, 130*wb, 30*hb);
    _MjiaLabel.text = @"24995";
    _MjiaLabel.textColor = [UIColor whiteColor];
    _MjiaLabel.textAlignment = NSTextAlignmentRight;
    _MjiaLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_MjiaLabel];
    
    _Mjianum = [[UILabel alloc]init];
    _Mjianum.frame = CGRectMake(SCREEN_WIDTH-100*wb, 130*hb, 70*wb, 30*hb);
    _Mjianum.text = @"5";
    _Mjianum.textColor = [UIColor whiteColor];
    _Mjianum.textAlignment = NSTextAlignmentRight;
    _Mjianum.font = [UIFont systemFontOfSize:14];
    [self addSubview:_Mjianum];
    
    
    UILabel * jinkai = [[UILabel alloc]init];
    jinkai.frame = CGRectMake(30*wb, 200*hb, 100*wb, 30*hb);
    jinkai.text = @"今开";
    jinkai.textColor = [UIColor whiteColor];
    jinkai.textAlignment = NSTextAlignmentCenter;
    jinkai.font = [UIFont systemFontOfSize:12];
    [self addSubview:jinkai];
    
    _jinkaiLabel = [[UILabel alloc]init];
    _jinkaiLabel.frame = CGRectMake(30*wb, 240*hb, 110*wb, 30*hb);
    _jinkaiLabel.text = @"24870";
    _jinkaiLabel.textColor = [UIColor whiteColor];
    _jinkaiLabel.textAlignment = NSTextAlignmentCenter;
    _jinkaiLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_jinkaiLabel];
    
    
    
    UILabel * zuoyi = [[UILabel alloc]init];
    zuoyi.frame = CGRectMake(170*wb, 200*hb, 100*wb, 30*hb);
    zuoyi.text = @"昨益";
    zuoyi.textColor = [UIColor whiteColor];
    zuoyi.textAlignment = NSTextAlignmentCenter;
    zuoyi.font = [UIFont systemFontOfSize:12];
    [self addSubview:zuoyi];
    
    _zuoyiLabel = [[UILabel alloc]init];
    _zuoyiLabel.frame = CGRectMake(170*wb, 240*hb, 110*wb, 30*hb);
    _zuoyiLabel.text = @"24870";
    _zuoyiLabel.textColor = [UIColor whiteColor];
    _zuoyiLabel.textAlignment = NSTextAlignmentCenter;
    _zuoyiLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_zuoyiLabel];

    
    
    
}

@end
