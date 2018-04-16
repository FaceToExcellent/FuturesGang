//
//  MyPickerView.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/9.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "MyPickerView.h"

@implementation MyPickerView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initData];
        // 默认Picker状态
        [self resetPickerSelectRow];
        [self makeUI];
        
        
    }
    return self;
}

-(void)initData
{
    _provinceIndex = _cityIndex  = 0;
}
// 读取本地Plist加载数据源
-(NSArray *)arrayDS
{
    if(!_arrayDS){
        NSString * path = [[NSBundle mainBundle] pathForResource:@"Province" ofType:@"plist"];
        _arrayDS = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return _arrayDS;
}


-(void)makeUI
{
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
    //self.didFinishBlock(self.id_,self.brand_name);
    
     NSString * address = [NSString stringWithFormat:@"%@-%@", self.arrayDS[_provinceIndex][@"province"], self.arrayDS[_provinceIndex][@"citys"][_cityIndex][@"city"]];
    self.didFinishBlock(address);
    
    [self removeFromSuperview];
}

- (void)getSuccessBlock:(PickerDidFinish)success
{
    self.didFinishBlock = success;
}

#pragma mark Picker delegete

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
// 每列有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0){
        return self.arrayDS.count;
    }
    else if (component == 1){
        return [self.arrayDS[_provinceIndex][@"citys"] count];
    }
//    else{
//        return [self.arrayDS[_provinceIndex][@"citys"][_cityIndex][@"districts"] count];
//    }
   // return nil;
    return 0;
}

// 返回每一行的内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0){
        return self.arrayDS[row][@"province"];
    }
    else if (component == 1){
        return self.arrayDS[_provinceIndex][@"citys"][row][@"city"];
    }
//    else{
//        return self.arrayDS[_provinceIndex][@"citys"][_cityIndex][@"districts"][row];
//    }
    return nil;
}

// 滑动或点击选择，确认pickerView选中结果
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if(component == 0){
        _provinceIndex = row;
        _cityIndex = 0;
       // _districtIndex = 0;
        
        [self.CustomPicker reloadComponent:1];
      //  [self.CustomPicker reloadComponent:2];
    }
    else if (component == 1){
        _cityIndex = row;
       // _districtIndex = 0;
        
       // [self.CustomPicker reloadComponent:2];
    }
//    else{
//        _districtIndex = row;
//    }
    
    // 重置当前选中项
    [self resetPickerSelectRow];
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30;
}

-(void)resetPickerSelectRow
{
    [self.CustomPicker selectRow:_provinceIndex inComponent:0 animated:YES];
    [self.CustomPicker selectRow:_cityIndex inComponent:1 animated:YES];
   // [self.CustomPicker selectRow:_districtIndex inComponent:2 animated:YES];
}

@end
