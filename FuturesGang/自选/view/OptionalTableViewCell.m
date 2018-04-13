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
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.frame = CGRectMake(45*wb, 21*hb, 280*wb, 40*hb);
    _nameLabel.font = [UIFont systemFontOfSize:16];
    _nameLabel.textColor = [UIColor whiteColor];
    [self addSubview:_nameLabel];
    
    
    
    _EnameLabel = [[UILabel alloc]init];
    _EnameLabel.frame = CGRectMake(45*wb, 81*hb, 280*wb, 40*hb);
    //_EnameLabel.backgroundColor = APP_Gray;
    _EnameLabel.font = [UIFont systemFontOfSize:10];
    _EnameLabel.textColor = APP_Gray;
    [self addSubview:_EnameLabel];
    
    _newnestButton = [[ColorButton alloc]init];
    _newnestButton.frame = CGRectMake(330*wb, 40*hb, 170*wb, 40*hb);
   // [_newnestButton setmyisnoBack:YES];
    _newnestButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_newnestButton];
    
    _RoseButton = [[ColorButton alloc]init];
    _RoseButton.frame = CGRectMake(550*wb, 30*hb, 170*wb, 50*hb);
  //  [_RoseButton setmyisnoBack:NO];
    _RoseButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_RoseButton];
    
    
    
    UIView * view = [[UIView alloc]init];
    view.frame =CGRectMake(0, 122*hb, SCREEN_WIDTH, 1);
    view.backgroundColor = APP_BACKCOLOR;
    [self addSubview:view];
    
}


-(void)setcellData:(NSInteger)row{
    
    _nameLabel.text = @"沪锌1804";
    
    _EnameLabel.text = @"AU1804";
    
    [_newnestButton setmystateString:[NSString stringWithFormat:@"%ld",row%3]];
    //NSLog(@"%ld,==>%@",row,[NSString stringWithFormat:@"%ld",row%3+1]);
     [_newnestButton setmyisnoBack:YES];
    [_newnestButton setTitle:@"24885" forState:UIControlStateNormal];
    
    [_RoseButton setmystateString:[NSString stringWithFormat:@"%ld",row%3]];
    [_RoseButton setmyisnoBack:NO];
    [_RoseButton setTitle:@"-0.05%" forState:UIControlStateNormal];
    
    
}

@end
