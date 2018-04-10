//
//  MyAlertView.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/10.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MyAlertViewCancelBLock)(void);
typedef void(^MyAlertViewViewOKBLock)(void);
@interface MyAlertView : UIView


@property(nonatomic,strong)UILabel * Alerttitle;
@property(nonatomic,strong)UILabel * AlertMessage;


@property(nonatomic,copy)MyAlertViewCancelBLock  cancelBlock;
@property(nonatomic,copy)MyAlertViewViewOKBLock  okBlock;


-(void)setCancelBlock:(MyAlertViewCancelBLock)cancelBlock;
-(void)setOkBlock:(MyAlertViewViewOKBLock)okBlock;


-(id)initWithNormal;
@end
