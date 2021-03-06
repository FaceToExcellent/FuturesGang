//
//  BankCardViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/8.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "BankCardViewController.h"
#import "BankCardTableViewCell.h"
#import "BankCardDTableViewCell.h"
#import "MyPickerView.h"
#define PICKER_HEIGHT   216
@interface BankCardViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,BankCardDDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,strong)NSArray * placeholderArray;
@property(nonatomic,assign)CGFloat kbHeight ;
@property(nonatomic,assign) double duration;

@property(nonatomic,strong) MyPickerView * picker;
@end

@implementation BankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      [self setnaviTitle:@"银行卡"];
    self.view.backgroundColor = APP_BACKCOLOR;
    
    NSArray * nameArray =@[@"持卡人",@"身份证号",@"手机号码",@"开户银行",@"开户所在省市",@"开户支行",@"银行卡号",@"确认卡号",];
   _placeholderArray = @[@"请输入真实姓名",@"请输入身份证号",@"请输入银行预留手机号码",@"请选择银行",@"请选择省市",@"请填写开户行",@"请输入银行卡号",@"请再次输入银行卡号",];
    
    
    _dataArray = [[NSMutableArray alloc]initWithArray:nameArray];
    [self BankCardMakeUI];
    
    [self addNoticeForKeyboard];
    
    
    
   
}


-(void)BankCardMakeUI{
    _tableView = [[UITableView alloc]init];
    _tableView.frame =CGRectMake(0, 3, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarAndNavigationBarHeight-3);
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
    [self.view addSubview:_tableView];

    
}

#pragma mark  tableView.delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count+1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _dataArray.count) {
        //最后一个
        NSString * Identifier = @"BankCardCellD";
        BankCardDTableViewCell * cell = [tableView  dequeueReusableCellWithIdentifier:Identifier];
        if (!cell) {
            cell = [[BankCardDTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
            
            cell.selectionStyle  = UITableViewCellSelectionStyleNone;
            cell.delegate =self;
            cell.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
        }
        
        return  cell;
    }else{
        
    NSString * Identifier = @"BankCardCell";
    BankCardTableViewCell * cell = [tableView  dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell = [[BankCardTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        
        cell.selectionStyle  = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
    }
        if (indexPath.row == 4) {
             [cell setcellTextfeild:_dataArray[indexPath.row] placeholder:_placeholderArray[indexPath.row] andtag:indexPath.row withEXframe:40];
           cell.textfeild.inputView =  self.picker;
        }else
        {
             [cell setcellTextfeild:_dataArray[indexPath.row] placeholder:_placeholderArray[indexPath.row] andtag:indexPath.row withEXframe:0];
        }
        
   
    cell.textfeild.delegate = self;
    cell.tag = indexPath.row +100;
    if (_dataArray.count-1 == indexPath.row) {
        cell.textfeild.returnKeyType = UIReturnKeyDone;
    }
   
    
    
    
    
    return cell;
    }
    
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == _dataArray.count) {
        //最后一个
        return 300*hb;
    }else
    return 50;
    
}


#pragma mark textField delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField becomeFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    for (BankCardTableViewCell * cell in _tableView.subviews) {
        if (cell.tag  == textField.tag) {
            
            [textField resignFirstResponder];
            
            for (BankCardTableViewCell * cell2 in _tableView.subviews) {
                if (cell2.tag == cell.tag +1) {
                    [cell2.textfeild becomeFirstResponder];
                    
                    [self keyboardMove:cell2.textfeild];
                }
            }
        }
    }
    
    return YES;
}
#pragma mark - 键盘通知
- (void)addNoticeForKeyboard {
    
    //注册键盘出现的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    //注册键盘消失的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}


///键盘显示事件
- (void) keyboardWillShow:(NSNotification *)notification {
    //获取键盘高度，在不同设备上，以及中英文下是不同的
   _kbHeight = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    // 取得键盘的动画时间，这样可以在视图上移的时候更连贯
    _duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
   
}

///键盘消失事件
- (void) keyboardWillHide:(NSNotification *)notify {
    // 键盘动画时间
    double duration = [[notify.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    //视图下沉恢复原状
    [UIView animateWithDuration:duration animations:^{
        self.tableView.frame = CGRectMake(0, 3, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarAndNavigationBarHeight-3);
    }];
}


-(void)keyboardMove:(UITextField*)textView{
  
    
    //计算出键盘顶端到inputTextView panel底端的距离(加上自定义的缓冲距离INTERVAL_KEYBOARD)
    CGFloat offset = ((textView.tag-100)*50 +textView.frame.size.height+5) - (_tableView.frame.size.height - _kbHeight);
//    NSLog(@"textView%f",((textView.tag-100)*50 +textView.frame.size.height+5));
//    NSLog(@"%f",offset);
    //将视图上移计算好的偏移
    if(offset > 0) {
        [UIView animateWithDuration:_duration animations:^{
            self.tableView.frame = CGRectMake(0.0f, -offset, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarAndNavigationBarHeight-3);
        }];
    }
    
  
}

#pragma mark BankCardDDelegate
-(void)pushToPersonnal
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark UIPickerView


-(MyPickerView*)picker{
    if (!_picker) {
        _picker=[[MyPickerView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - PICKER_HEIGHT, SCREEN_WIDTH, PICKER_HEIGHT)];
        _picker.backgroundColor= APP_Gray;
        
        [_picker getSuccessBlock:^(NSString * address) {
            for ( BankCardTableViewCell * cell in self.tableView.subviews) {
                if (cell.tag == 104) {
                    cell.textfeild.text = address;
                    [cell.textfeild resignFirstResponder];
                    
                    for (BankCardTableViewCell * cell2 in self.tableView.subviews) {
                        if (cell2.tag == cell.tag +1) {
                            [cell2.textfeild becomeFirstResponder];
                            
                            [self keyboardMove:cell2.textfeild];
                        }
                    }
                    
                }
            }
            
        }];
    }
    
    return _picker;
}



@end
