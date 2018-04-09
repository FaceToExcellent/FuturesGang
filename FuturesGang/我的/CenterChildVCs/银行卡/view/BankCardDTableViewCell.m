//
//  BankCardDTableViewCell.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/9.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "BankCardDTableViewCell.h"

@implementation BankCardDTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
        [self cellMakeUI];
    }
    
    return self;
}

-(void)cellMakeUI{
    
    _tjrzButton = [self APPButtonmaker:@"提交认证" andtitleColor:[UIColor whiteColor]  backColor:APP_BLUE andfont:18.0];
    _tjrzButton.frame = CGRectMake((SCREEN_WIDTH-580*wb)/2, 180*hb, 580*wb, 80*hb);
    [_tjrzButton addTarget:self action:@selector(tjrzButtonClick) forControlEvents:UIControlEventTouchUpInside];
    _tjrzButton.layer.masksToBounds = YES;
    _tjrzButton.layer.cornerRadius = _tjrzButton.frame.size.width/64;
    
    [self addSubview:_tjrzButton];

}

-(void)tjrzButtonClick{
    NSLog(@"提交认证");
    if (_delegate) {
        [_delegate pushToPersonnal];
    }
}


@end
