//
//  CashTableViewCell.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/8.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "CashTableViewCell.h"

@implementation CashTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
        [self cellMakeUI];
    }
    
    return self;
}
/*@property(nonatomic,strong)UIImageView * UPorDown;
 @property(nonatomic,strong)UILabel *    celltitle;
 @property(nonatomic,strong)UILabel *    timelabel;
 @property(nonatomic,strong)UILabel *    cashLabel;*/
-(void)cellMakeUI{
    
    
    //line
    UIView * view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 1);
    view.backgroundColor = APP_BACKCOLOR;
    [self addSubview:view];
    
    
    //28  居中 50 * 50
    _UPorDown = [[UIImageView alloc]init];
    _UPorDown.frame = CGRectMake(28*wb, 25*wb, 50*wb, 50*wb);
   
    [self addSubview:_UPorDown];
    
    
    
    //celltitle
    
    _celltitle = [[UILabel alloc]init];
    _celltitle.frame = CGRectMake(100*wb, 20*hb, 300*wb, 30*hb);
    _celltitle.textColor = [UIColor whiteColor];
    if (SCREEN_WIDTH == 320) {
        _celltitle.font = [UIFont systemFontOfSize:12];
    }else
    {
        _celltitle.font = [UIFont systemFontOfSize:14];
        
    }
    [self addSubview:_celltitle];
    
    //time
    
    _timelabel = [[UILabel alloc]init];
    _timelabel.frame = CGRectMake(100*wb, 60*hb, SCREEN_WIDTH, 30*hb);
    _timelabel.textColor = [UIColor whiteColor];
    if (SCREEN_WIDTH == 320) {
        _timelabel.font = [UIFont systemFontOfSize:12];
    }else
    {
        _timelabel.font = [UIFont systemFontOfSize:14];
        
    }
    [self addSubview:_timelabel];
    
    //cash
    
    _cashLabel =[[UILabel alloc]init];
    _cashLabel.frame = CGRectMake(SCREEN_WIDTH- 280*wb, 35*wb, 250*wb, 30*hb);
    
    _cashLabel.textAlignment = NSTextAlignmentRight;
    if (SCREEN_WIDTH == 320) {
        _cashLabel.font = [UIFont systemFontOfSize:16];
    }else
    {
        _cashLabel.font = [UIFont systemFontOfSize:18];
        
    }
    _cashLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:_cashLabel];
    
    
}

-(void)resetColor:(NSString*)IsUPorDown{
    self.isUPorDown = IsUPorDown;
    
    if ([_isUPorDown isEqualToString:@"up"]) {
        _UPorDown.image = [UIImage imageNamed:@"CZ"];
    }else
    {
        _UPorDown.image = [UIImage imageNamed:@"TX"];
    }
    
    
    if ([_isUPorDown isEqualToString:@"up"]) {
        _cashLabel.textColor  = APP_Green;
    }else
    {
        _cashLabel.textColor  = APP_RED;
    }
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
