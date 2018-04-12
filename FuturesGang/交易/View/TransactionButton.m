//
//  TransactionButton.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/12.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "TransactionButton.h"

@implementation TransactionButton

-(instancetype)init
{
    if (self = [super init]) {
        
        [self makeUI];
    }
    return self;
}


-(void)makeUI{
    
    _numlabel  = [[UILabel alloc]init];
    _numlabel.frame =CGRectMake(0, 15*hb, 200*wb, 30*hb);
    _numlabel.textColor = [UIColor whiteColor];
    _numlabel.textAlignment = NSTextAlignmentCenter;
    _numlabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_numlabel];
    
    //line
    
    UIView * line  =[[UIView alloc]init];
    line.frame = CGRectMake(10*wb, 60*hb, 180*wb, 1);
    line.backgroundColor = [UIColor whiteColor];
    [self addSubview:line];
    
    
    //
    _nameLabel  = [[UILabel alloc]init];
    _nameLabel.frame =CGRectMake(0, 80*hb, 200*wb, 35*hb);
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_nameLabel];
    
    
}

-(void)setmynamelabel:(NSString *)name numlabel:(NSString*)num{
    _nameLabel.text = name;
    _numlabel.text  = num;
}


@end
