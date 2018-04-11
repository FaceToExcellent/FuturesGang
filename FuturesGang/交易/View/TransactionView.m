//
//  TransactionView.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "TransactionView.h"

@implementation TransactionView

-(instancetype)init
{
    if (self = [super init]) {
        
        [self makeUI];
    }
    return self;
}


-(void)makeUI{
    [self DropDownMenuAdd];
}
-(void)DropDownMenuAdd{
    _menuRowHeight = 65*hb;
    _menu = [[DropDownMenu alloc]initWithFrame:CGRectMake(30*wb, 27*hb, 390*wb, _menuRowHeight+250*hb)];
    [_menu setMyheightForRow:_menuRowHeight];
    NSMutableArray * arr = [[NSMutableArray alloc]initWithArray:@[@"狐金1806",@"狐金1802",@"狐金1803",@"狐金1804",@"狐金1805",@"狐金1807",@"狐金1808"]];
    [_menu setMydatearray:arr];
    [_menu setMytopViewlabel:arr[0]];
    CGFloat reH =  [_menu setMytableViewHeight:250*hb];
    _menu.frame = CGRectMake(30*wb, 27*hb, 390*wb,_menuRowHeight+reH);
    [_menu setMyleftImage:[UIImage imageNamed:@"xia"]];
    
    
    
    [self addSubview:_menu];
}



@end
