//
//  SinglePickerView.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SinglePickerViewBlock)(NSString * message);
@interface SinglePickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView * CustomPicker;
@property (nonatomic, strong) NSArray * arrayDS;

@property(nonatomic,copy)NSString * selectedMessage;

@property (copy,nonatomic) SinglePickerViewBlock didFinishBlock;

-(void)setDidFinishBlock:(SinglePickerViewBlock)didFinishBlock;

-(void)setmyarrayDS:(NSArray*)arr;
@end
