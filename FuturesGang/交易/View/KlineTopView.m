//
//  KlineTopView.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/12.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "KlineTopView.h"

@implementation KlineTopView

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
    [_maijiaLabel sizeToFit];
    [self addSubview:_maijiaLabel];
    
    _maijianum = [[UILabel alloc]init];
    _maijianum.frame = CGRectMake(SCREEN_WIDTH-70*wb, 50*hb, 70*wb, 30*hb);
    _maijianum.text = @"5";
    _maijianum.textColor = [UIColor whiteColor];
    _maijianum.textAlignment = NSTextAlignmentRight;
    _maijianum.font = [UIFont systemFontOfSize:14];
    [_maijianum sizeToFit];
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
    [_MjiaLabel sizeToFit];
    [self addSubview:_MjiaLabel];
    
    _Mjianum = [[UILabel alloc]init];
    _Mjianum.frame = CGRectMake(SCREEN_WIDTH-100*wb, 130*hb, 70*wb, 30*hb);
    _Mjianum.text = @"11115";
    _Mjianum.textColor = [UIColor whiteColor];
    _Mjianum.textAlignment = NSTextAlignmentRight;
    _Mjianum.font = [UIFont systemFontOfSize:14];
    [_Mjianum sizeToFit];
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
    [_jinkaiLabel sizeToFit];
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
    [_zuoyiLabel sizeToFit];
    [self addSubview:_zuoyiLabel];
    
    
    
    UILabel * zuigao = [[UILabel alloc]init];
    zuigao.frame = CGRectMake(310*wb, 200*hb, 100*wb, 30*hb);
    zuigao.text = @"最高";
    zuigao.textColor = [UIColor whiteColor];
    zuigao.textAlignment = NSTextAlignmentCenter;
    zuigao.font = [UIFont systemFontOfSize:12];
    [self addSubview:zuigao];
    
    _zuigaoLabel = [[UILabel alloc]init];
    _zuigaoLabel.frame = CGRectMake(310*wb, 240*hb, 110*wb, 30*hb);
    _zuigaoLabel.text = @"24870";
    _zuigaoLabel.textColor = [UIColor whiteColor];
    _zuigaoLabel.textAlignment = NSTextAlignmentCenter;
    _zuigaoLabel.font = [UIFont systemFontOfSize:12];
    [_zuigaoLabel sizeToFit];
    [self addSubview:_zuigaoLabel];
    
    
    UILabel * zuidi = [[UILabel alloc]init];
    zuidi.frame = CGRectMake(460*wb, 200*hb, 100*wb, 30*hb);
    zuidi.text = @"最低";
    zuidi.textColor = [UIColor whiteColor];
    zuidi.textAlignment = NSTextAlignmentCenter;
    zuidi.font = [UIFont systemFontOfSize:12];
    [self addSubview:zuidi];
    
    _zuidiLabel = [[UILabel alloc]init];
    _zuidiLabel.frame = CGRectMake(460*wb, 240*hb, 110*wb, 30*hb);
    _zuidiLabel.text = @"24870";
    _zuidiLabel.textColor = [UIColor whiteColor];
    _zuidiLabel.textAlignment = NSTextAlignmentCenter;
    _zuidiLabel.font = [UIFont systemFontOfSize:12];
    [_zuidiLabel sizeToFit];
    [self addSubview:_zuidiLabel];
    
    
    UILabel * keyongzijin = [[UILabel alloc]init];
    keyongzijin.frame = CGRectMake(580*wb, 200*hb, 150*wb, 30*hb);
    keyongzijin.text = @"可用资金";
    keyongzijin.textColor = [UIColor whiteColor];
    keyongzijin.textAlignment = NSTextAlignmentCenter;
    keyongzijin.font = [UIFont systemFontOfSize:12];
    [self addSubview:keyongzijin];
    
    _keyongzijinLabel = [[UILabel alloc]init];
    _keyongzijinLabel.frame = CGRectMake(580*wb, 240*hb, 180*wb, 30*hb);
    _keyongzijinLabel.text = @"2487000.05";
    _keyongzijinLabel.textColor = [UIColor whiteColor];
    _keyongzijinLabel.textAlignment = NSTextAlignmentCenter;
    _keyongzijinLabel.font = [UIFont systemFontOfSize:12];
    _keyongzijinLabel.numberOfLines = 0;
    [_keyongzijinLabel sizeToFit];
    [self addSubview:_keyongzijinLabel];
}


@end
