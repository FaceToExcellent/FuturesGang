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
        
        [self cellMakeUI];
    }
    
    return self;
}
//640
-(void)cellMakeUI{
    
    
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
