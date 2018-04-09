//
//  RootViewController.h
//  xbiao
//
//  Created by zhuangzhe on 15/5/25.
//  Copyright (c) 2015年 腕表之家. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PresentNaviViewController.h"

@interface RootViewController : UIViewController

@property(nonatomic,strong) UILabel *navTitleLebel;
@property(nonatomic,strong) UIView *navTitleView;
@property(nonatomic,strong) UIImageView *sexImageView;
@property (nonatomic,strong) NSString *baiduTitle;

-(void)setnaviTitle:(NSString *)title;
- (void)setNaviLogo:(NSString *)picNmae;
- (void) setUserSex:(NSInteger) sex;



@end
