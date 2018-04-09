//
//  UIView+MYViewinit.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/9.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MYViewinit)
-(UITextField*)textFieldMakewithtext:(NSString *)text placeholder:(NSString *)placeholder withframe:(CGRect)rect backgroundColor:(UIColor*)color andtag:(NSInteger)tag andleftViewframe:(CGRect)leftframe;
-(UIButton*)APPButtonmaker:(NSString*)title andtitleColor:(UIColor*)titleColor  backColor:(UIColor*)color andfont:(float)font;
@end
