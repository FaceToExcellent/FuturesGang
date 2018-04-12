//
//  TransctionFSView.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "TransctionFSView.h"

@implementation TransctionFSView

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
}

@end
