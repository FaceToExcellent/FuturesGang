//
//  OneLevelViewController.h
//  xbiao
//
//  Created by zhuangzhe on 15/5/28.
//  Copyright (c) 2015年 腕表之家. All rights reserved.
//

#import "RootViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface OneLevelViewController : RootViewController
//左侧
- (void)backBtnClick;
- (void)setBackBtnWithImgName:(NSString *)imgName;
//右侧
- (void)addRightBtn:(NSString*)title;
- (void)onClickedOKbtn;


-(void)gradientLayerset;
@end
