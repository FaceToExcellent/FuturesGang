//
//  ColorButton.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/8.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorButton : UIButton


@property(nonatomic,strong) NSString * stateString; //1 红色  2 灰色  3 绿色

@property(nonatomic)BOOL isnoBack;//1 无背景  0 有背景

-(void)setmyisnoBack:(BOOL)isnoBack;

-(void)setmystateString:(NSString*)stateString;

@end
