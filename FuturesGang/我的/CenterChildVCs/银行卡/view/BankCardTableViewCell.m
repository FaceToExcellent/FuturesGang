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
    
//    _textfeild = [self textFieldMakewithtext:@"手机号" placeholder:@"请输入手机号码" withframe:CGRectMake(0, 0, SCREEN_WIDTH, 100*hb) backgroundColor:APP_TEXTFEILD_BACKCOLOR andtag:101 andleftViewframe: CGRectMake(0, 0, 175*wb, 100*hb)];
//    _phoneNumber.returnKeyType = UIReturnKeyNext;
//    _phoneNumber.delegate = self ;
//    [self.view addSubview:_phoneNumber];
}
@end
