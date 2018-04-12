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
    
}

@end
