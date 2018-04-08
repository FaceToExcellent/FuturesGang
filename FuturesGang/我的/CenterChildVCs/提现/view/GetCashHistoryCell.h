//
//  ChargeHistoryCell.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/8.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetCashHistoryCell : UITableViewCell

@property(nonatomic,strong) NSString * isDoneOrnot;//1 绿 2 红
@property(nonatomic,strong)UILabel *    celltitle;//处理状态
@property(nonatomic,strong)UILabel *    timelabel;
@property(nonatomic,strong)UILabel *    cashLabel;

-(void)setstateofIsDoneornot:(NSString*) isDone;
@end
