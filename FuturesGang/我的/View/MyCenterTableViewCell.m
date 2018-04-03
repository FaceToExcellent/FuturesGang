//
//  MyCenterTableViewCell.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "MyCenterTableViewCell.h"
@implementation MyCenterTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = RGBA(38, 40, 52, 1);
        [self cellMakeUI];
    }
    
    return self;
}
//640
-(void)cellMakeUI{
    /*@property(nonatomic,strong)UIImageView * image;
     @property(nonatomic,strong)UILabel     * name;
     @property(nonatomic,strong)UIImageView * goright;
     @property(nonatomic)BOOL ishidegoright;*/
    
    
    //图标
    
    _image = [[UIImageView alloc]init];
    _image.frame= CGRectMake(27*wb, 20*hb, 60*wb, 60*wb);
    _image.layer.masksToBounds = YES;
    _image.layer.cornerRadius = _image.frame.size.width/16;
   // _image.backgroundColor = [UIColor blueColor];
    [self addSubview:_image];
    
    
    //name
    
    _name = [[UILabel alloc]init];
    _name.frame =CGRectMake(110*wb, 35*hb, 300*wb, 30*hb);
    _name.textColor = [UIColor whiteColor];
    if (SCREEN_WIDTH == 320) {
        _name.font = [UIFont systemFontOfSize:14];
    }else
    {
        _name.font = [UIFont systemFontOfSize:16];
        
    }
    [self addSubview:_name];
    
    
    // goright
    
    _goright = [[UIImageView alloc]init];
    _goright.frame= CGRectMake(SCREEN_WIDTH -45*wb, 35*hb, 20*wb, 30*wb);
    _goright.hidden = _ishidegoright;
    _goright.image =  [UIImage imageNamed:@"ZXJT"];
    //_goright.backgroundColor = [UIColor blueColor];
    [self addSubview:_goright];
    
    
    //line
    UIView * lineview = [[UIView alloc]init];
    lineview.frame =CGRectMake(0, self.frame.size.height-1, SCREEN_WIDTH, 1);
    lineview.backgroundColor = RGBA(24, 26, 37, 1);
    [self addSubview:lineview];
    
    
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
