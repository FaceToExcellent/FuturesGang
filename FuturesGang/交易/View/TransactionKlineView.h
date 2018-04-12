//
//  TransactionKlineView.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorButton.h"
@interface TransactionKlineView : UIView


@property(nonatomic,strong)ColorButton * biggestButton;// isnoBack 1
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

@end
