//
//  TransctionFSView.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KlineTopView.h"
@interface TransctionFSView : UIView
@property(nonatomic,strong)KlineTopView * topView;
@property(nonatomic,strong)UIWebView  * web;
@end
