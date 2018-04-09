//
//  BankCardTableViewCell.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/9.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BankCardTableViewCellDelegate <NSObject>

//预留
@end

@interface BankCardTableViewCell : UITableViewCell
@property(nonatomic,strong)UITextField * textfeild;

-(void)setcellTextfeild:(NSString*)text placeholder:(NSString*)placeholder andtag:(NSInteger)tag;
@end
