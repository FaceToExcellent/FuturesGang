//
//  TransactionKlineView.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "TransactionKlineView.h"

@implementation TransactionKlineView


-(instancetype)init
{
    if (self = [super init]) {
        
        [self makeUI];
    }
    return self;
}


-(void)makeUI{
    
    _topView = [[KlineTopView alloc]init];
    _topView.frame =CGRectMake(0, 0, SCREEN_WIDTH, 280*hb);
    [self addSubview:_topView];
    
    _web = [[UIWebView alloc]init];
    _web.frame = CGRectMake(0, 280*hb, SCREEN_WIDTH, 810*hb);
    [_web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    [self addSubview:_web];
}

@end
