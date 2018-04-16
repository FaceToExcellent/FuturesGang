//
//  QuotationTableViewCell.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/16.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "QuotationTableViewCell.h"

@implementation QuotationTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
        [self cellMakeUI];
    }
    
    return self;
}

-(void)cellMakeUI{
    [super cellMakeUI];
    
    self.followButton = [[UIButton alloc]init];
    self.followButton.frame = CGRectMake(0, 70*hb, 30*wb, 30*wb);
    
    [self.followButton setBackgroundImage:[UIImage imageNamed:@"guanzhu"] forState:UIControlStateNormal];
    [self.followButton setBackgroundImage:[UIImage imageNamed:@"jianhao"] forState:UIControlStateSelected];
    
    [self.followButton addTarget:self action:@selector(followButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.followButton];
    
}

-(void)followButtonClick{
    self.followButton.selected = ! self.followButton.selected;
    
}



@end
