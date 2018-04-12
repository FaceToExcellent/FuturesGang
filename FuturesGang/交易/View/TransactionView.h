//
//  TransactionView.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownMenu.h"
#import "TransactionButton.h"
@interface TransactionView : UIView

//下拉菜单部分
@property(nonatomic,strong)DropDownMenu * menu;
@property(nonatomic)CGFloat menuRowHeight;
@property(nonatomic)CGFloat reH;
@property(nonatomic)BOOL  isOpen;

//手数
@property(nonatomic,strong)UIButton * leftnumButton;
@property(nonatomic,strong)UILabel  *  numLabel;
@property(nonatomic,strong)UIButton * rightnumButton;

//价格
@property(nonatomic,strong)UIButton * leftpriceButton;
@property(nonatomic,strong)UILabel  *  priceLabel;
@property(nonatomic,strong)UIButton * rightpriceButton;

//最新
@property(nonatomic,strong)UILabel * freshLabel;
@property(nonatomic,strong)UILabel * freshnum;
//卖价
@property(nonatomic,strong)UILabel * shellLabel;
@property(nonatomic,strong)UILabel * shellnum;
//买价
@property(nonatomic,strong)UILabel * buyLabel;
@property(nonatomic,strong)UILabel * buynum;

//红绿灰 三个按钮
@property(nonatomic,strong)TransactionButton * redButton;
@property(nonatomic,strong)TransactionButton * greenButton;
@property(nonatomic,strong)TransactionButton * grayButton;



//持仓

@property(nonatomic,strong)UIButton * chicangButton;
@property(nonatomic,strong)UIView   * chicangView;
//可撤

@property(nonatomic,strong)UIButton * kecheButton;
@property(nonatomic,strong)UIView   *  kecheView;
//委托

@property(nonatomic,strong)UIButton * weituoButton;
@property(nonatomic,strong)UIView   *  weituoView;

//成交
@property(nonatomic,strong)UIButton * chengjiaoButton;
@property(nonatomic,strong)UIView   * chengjiaoView;



@end
