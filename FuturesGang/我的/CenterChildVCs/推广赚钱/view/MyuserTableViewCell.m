//
//  MyuserTableViewCell.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/8.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "MyuserTableViewCell.h"

@implementation MyuserTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
        [self cellMakeUI];
    }
    
    return self;
}

-(void)cellMakeUI{
    
   
    _usertitle =[[UILabel alloc]init];
    _usertitle.frame = CGRectMake(30*wb,33*wb, 200*wb, 30*hb);
    _usertitle.textAlignment = NSTextAlignmentLeft;
    if (SCREEN_WIDTH == 320) {
        _usertitle.font = [UIFont systemFontOfSize:14];
    }else
    {
        _usertitle.font = [UIFont systemFontOfSize:16];
    }
    _usertitle.textColor = [UIColor whiteColor];
    [self addSubview:_usertitle];
    
    

    _timeslabel = [[UILabel alloc]init];
    _timeslabel.frame = CGRectMake(270*wb, 33*wb, 270*wb, 30*hb);
    _timeslabel.textAlignment = NSTextAlignmentLeft;
    if (SCREEN_WIDTH == 320) {
        _timeslabel.font = [UIFont systemFontOfSize:14];
    }else
    {
        _timeslabel.font = [UIFont systemFontOfSize:16];
    }
    
    _timeslabel.textColor =  [UIColor whiteColor];
    [self addSubview:_timeslabel];
    
    
    //状态
    _signinLabel = [[UILabel alloc]init];
    _signinLabel.frame = CGRectMake(540*wb, 35*wb, 270*wb, 30*hb);
    _signinLabel.textAlignment = NSTextAlignmentLeft;
    if (SCREEN_WIDTH == 320) {
        _signinLabel.font = [UIFont systemFontOfSize:14];
    }else
    {
        _signinLabel.font = [UIFont systemFontOfSize:16];
    }
    //_signinLabel.text = @"注册时间";
    _signinLabel.textColor = [UIColor whiteColor];
    [self addSubview:_signinLabel];
    
    
    //line
    UIView * view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 98*hb, SCREEN_WIDTH, 1);
    view.backgroundColor = APP_BACKCOLOR;
    [self addSubview:view];
}

@end
