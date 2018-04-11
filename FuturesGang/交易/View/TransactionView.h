//
//  TransactionView.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownMenu.h"
@interface TransactionView : UIView
@property(nonatomic,strong)DropDownMenu * menu;
@property(nonatomic)CGFloat menuRowHeight;
@property(nonatomic)CGFloat reH;
@property(nonatomic)BOOL  isOpen;
@end
