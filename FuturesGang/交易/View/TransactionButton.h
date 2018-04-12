//
//  TransactionButton.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/12.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransactionButton : UIButton

@property(nonatomic,strong)UILabel * numlabel;

@property(nonatomic,strong)UILabel * nameLabel;



-(void)setmynamelabel:(NSString *)name numlabel:(NSString*)num;
@end
