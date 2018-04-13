//
//  OptionalTableViewCell.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/13.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionalTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView * signView;//hk sh us
@property(nonatomic,strong)UILabel     * nameLabel;
@property(nonatomic,strong)UILabel     * EnameLabel;

@property(nonatomic,strong)ColorButton  * newnestButton;

@property(nonatomic,strong)ColorButton  * RoseButton;

@end
