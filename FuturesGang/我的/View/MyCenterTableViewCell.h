//
//  MyCenterTableViewCell.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCenterTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView * image;
@property(nonatomic,strong)UILabel     * name;
@property(nonatomic,strong)UIImageView * goright;
@property(nonatomic)BOOL ishidegoright;
@end
