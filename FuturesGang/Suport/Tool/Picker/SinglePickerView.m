//
//  SinglePickerView.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "SinglePickerView.h"

@implementation SinglePickerView

-(instancetype)init
{
    if (self = [super init]) {
        
        [self makeUI];
    }
    return self;
}
-(void)setmyarrayDS:(NSArray*)arr{
    _arrayDS = arr;
    //NSLog(@"%@",arr);
    [self makeUI];
}

-(void)makeUI{
    
    _CustomPicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 30, self.frame.size.width, self.frame.size.height - 30)];
    _CustomPicker.delegate = self;
    _CustomPicker.dataSource = self;
    _CustomPicker.showsSelectionIndicator = YES;
    _CustomPicker.backgroundColor = [UIColor whiteColor];
    [_CustomPicker selectRow:0 inComponent:0 animated:YES];
    [self addSubview:_CustomPicker];
    
    
    [_CustomPicker reloadAllComponents];
    
    UIButton  * button =[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60, 5, 50, 20)];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    
    
}

-(void)selectClick
{
    
    self.didFinishBlock(_selectedMessage);
    
    [self removeFromSuperview];
}

#pragma mark Picker delegete

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
// 每列有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
   return self.arrayDS.count;
    
}

// 返回每一行的内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return self.arrayDS[row];
   
   
}

// 滑动或点击选择，确认pickerView选中结果
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    _selectedMessage = self.arrayDS[row];
   
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30;
}



@end
