//
//  CashTableViewCell.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/8.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CashTableViewCell : UITableViewCell
@property(nonatomic,strong) NSString * isUPorDown;//1 上 2 下
@property(nonatomic,strong)UIImageView * UPorDown;
@property(nonatomic,strong)UILabel *    celltitle;
@property(nonatomic,strong)UILabel *    timelabel;
@property(nonatomic,strong)UILabel *    cashLabel;



-(void)resetColor:(NSString*)IsUPorDown;
@end
