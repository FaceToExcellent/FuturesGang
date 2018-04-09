//
//  BankCardDTableViewCell.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/9.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BankCardDDelegate <NSObject>

-(void)pushToPersonnal;
@end
@interface BankCardDTableViewCell : UITableViewCell
@property(nonatomic,strong)UIButton * tjrzButton;
@property(nonatomic,weak) id<BankCardDDelegate>delegate;
@end
