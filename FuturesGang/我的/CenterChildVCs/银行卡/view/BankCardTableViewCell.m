//
//  BankCardTableViewCell.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/9.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "BankCardTableViewCell.h"

@implementation BankCardTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
        [self cellMakeUI];
    }
    
    return self;
}

-(void)cellMakeUI{
    
    _textfeild = [[UITextField alloc]init];
    _textfeild.returnKeyType = UIReturnKeyNext;
    //这里的协议需要传递
   // _textfeild.delegate = self ;
    [self addSubview:_textfeild];
    
    //line
    UIView * view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 49, SCREEN_WIDTH, 1);
    view.backgroundColor = APP_BACKCOLOR;
    [self addSubview:view];
    
}

-(void)setcellTextfeild:(NSString*)text placeholder:(NSString*)placeholder andtag:(NSInteger)tag  withEXframe:(CGFloat)exWidth{
    
     _textfeild = [self textFieldMakewithtext:text placeholder:placeholder withframe:CGRectMake(0, 5, SCREEN_WIDTH, 100*hb) backgroundColor:APP_TEXTFEILD_BACKCOLOR andtag:tag+100 andleftViewframe: CGRectMake(0, 0,175*wb+exWidth, 100*hb)];
     [self addSubview:_textfeild];
    
}


@end
