//
//  MyPickerView.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/9.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^PickerDidFinish)(NSString * address);
@interface MyPickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView * CustomPicker;
@property (nonatomic, strong) NSArray * arrayDS;

@property(nonatomic)NSInteger provinceIndex;   // 省份选择 记录
@property(nonatomic)NSInteger cityIndex;       // 市选择 记录
@property(nonatomic)NSInteger districtIndex;   // 区选择 记录


@property (copy,nonatomic) PickerDidFinish didFinishBlock;

- (void)getSuccessBlock:(PickerDidFinish )success;
@end
