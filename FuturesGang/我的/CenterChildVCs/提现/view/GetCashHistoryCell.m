//
//  ChargeHistoryCell.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/8.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "GetCashHistoryCell.h"

@implementation GetCashHistoryCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
        [self cellMakeUI];
    }
    
    return self;
}

-(void)cellMakeUI{
    //时间
    _timelabel =[[UILabel alloc]init];
    _timelabel.frame = CGRectMake(30*wb,33*wb, 200*wb, 30*hb);
    _timelabel.textAlignment = NSTextAlignmentLeft;
    if (SCREEN_WIDTH == 320) {
        _timelabel.font = [UIFont systemFontOfSize:14];
    }else
    {
        _timelabel.font = [UIFont systemFontOfSize:16];
    }
    _timelabel.textColor = [UIColor whiteColor];
    [self addSubview:_timelabel];
    
    
    //金额
    _cashLabel = [[UILabel alloc]init];
    _cashLabel.frame = CGRectMake(270*wb, 33*wb, 270*wb, 30*hb);
    _cashLabel.textAlignment = NSTextAlignmentLeft;
    if (SCREEN_WIDTH == 320) {
        _cashLabel.font = [UIFont systemFontOfSize:14];
    }else
    {
        _cashLabel.font = [UIFont systemFontOfSize:16];
    }
    //提现记录 所以都是绿的
    _cashLabel.textColor =  APP_Green;
    [self addSubview:_cashLabel];
    
    
    //状态
    _celltitle = [[UILabel alloc]init];
    _celltitle.frame = CGRectMake(540*wb, 35*wb, 270*wb, 30*hb);
    _celltitle.textAlignment = NSTextAlignmentLeft;
    if (SCREEN_WIDTH == 320) {
        _celltitle.font = [UIFont systemFontOfSize:14];
    }else
    {
        _celltitle.font = [UIFont systemFontOfSize:16];
    }
    _celltitle.text = @"交易完成";
     _celltitle.textColor = [UIColor whiteColor];
    // 成功是白的 不成功是红的 
   // _celltitle.textColor =  APP_Green;
    [self addSubview:_celltitle];
    
    
    //line
    UIView * view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 98*hb, SCREEN_WIDTH, 1);
    view.backgroundColor = APP_BACKCOLOR;
    [self addSubview:view];
    
}
-(void)setstateofIsDoneornot:(NSString*) isDone{
    
    self.isDoneOrnot = isDone;
    //NSLog(@"%@",isDone);
    if ([self.isDoneOrnot isEqualToString:@"Done"]) {
        _celltitle.textColor = [UIColor whiteColor];
        _celltitle.text = @"交易完成";
    }else
    {
        _celltitle.textColor = [UIColor redColor];
        _celltitle.text = @"交易进行中";
    }
}


@end
