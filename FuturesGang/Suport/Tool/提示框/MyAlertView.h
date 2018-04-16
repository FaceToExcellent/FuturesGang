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
typedef void(^MyAlertViewconditionBLock)(NSString*biggerOrlitter,NSString * defultPrice);
typedef void(^MyAlertViewAddquantityBLock)(NSString*number);



@interface MyAlertView : UIView


@property(nonatomic,strong)UILabel * Alerttitle;
@property(nonatomic,strong)UILabel * AlertMessage;

@property(nonatomic,copy)MyAlertViewCancelBLock  cancelBlock;
@property(nonatomic,copy)MyAlertViewViewOKBLock  okBlock;


-(void)setCancelBlock:(MyAlertViewCancelBLock)cancelBlock;
-(void)setOkBlock:(MyAlertViewViewOKBLock)okBlock;


-(id)initWithNormal;
-(id)initWithNormalAndNOCancell;
-(void)setTitile:(NSString*)title  message:(NSString*)message;
- (void)cancelButtonClick;


//条件单

@property(nonatomic,copy) NSString * biggerOrlitter;//大于等于 1   小于等于  0
@property(nonatomic,strong) UIButton  * addButton;
@property(nonatomic,strong) UIButton  * reduceButton;
@property(nonatomic,strong) UITextField * textfield;
@property(nonatomic,strong) UIButton * topButton;//上选择
@property(nonatomic,strong)  UIButton * downButton;//下选中

@property(nonatomic,assign) float  defultPrice;//默认价
@property(nonatomic,assign) float  maxPrice; //最高价
@property(nonatomic,assign) float  minPrice; //最低价
@property(nonatomic,assign) NSInteger step; //步数

@property(nonatomic,copy)MyAlertViewconditionBLock  conditionBLock ;
-(void)setConditionBLock:(MyAlertViewconditionBLock)conditionBLock;

-(void)setbackground;
-(void)qxButtonClick;
-(void)qdButtonClick;

//Addquantity.h
@property(nonatomic,strong)UITextField *AddquantityFeild;
@property(nonatomic,copy)MyAlertViewAddquantityBLock addquantityBlock;
-(void)setAddquantityBlock:(MyAlertViewAddquantityBLock)addquantityBlock;


@end

