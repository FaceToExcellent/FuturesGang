//
//  DropDownMenuCellTableViewCell.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "DropDownMenuCell.h"

@implementation DropDownMenuCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
        [self cellMakeUI];
    }
    
    return self;
}

-(void)cellMakeUI{
    _mytitle = [[UILabel alloc]init];
    _mytitle.frame = CGRectMake(0, 0, 390*wb, 65*hb);
    _mytitle.textAlignment = NSTextAlignmentLeft;
    _mytitle.textColor = [UIColor whiteColor];
    _mytitle.font = [UIFont systemFontOfSize:14];
    [self addSubview:_mytitle];
    
   // self.backgroundColor =  APP_TEXTFEILD_BACKCOLOR;
}
-(void)setMycelltitle:(NSString*)str{
    _mytitle.text = str;
}

@end
