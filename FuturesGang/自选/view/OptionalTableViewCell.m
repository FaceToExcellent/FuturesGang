//
//  OptionalTableViewCell.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/13.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "OptionalTableViewCell.h"

@implementation OptionalTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
        [self cellMakeUI];
    }
    
    return self;
}

-(void)cellMakeUI{
    
    _signView = [[UIImageView alloc]init];
    _signView.frame = CGRectMake(0, 28*hb, 35*wb, 20*hb);
    _signView.backgroundColor = [UIColor redColor];
    [self addSubview:_signView];
    
    
    
}

@end
