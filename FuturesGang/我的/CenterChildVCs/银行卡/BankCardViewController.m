//
//  BankCardViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/8.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "BankCardViewController.h"
#import "BankCardTableViewCell.h"
@interface BankCardViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,strong)NSArray * placeholderArray;
@property(nonatomic,assign)CGFloat kbHeight ;
@property(nonatomic,assign) double duration;
@end

@implementation BankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      [self setnaviTitle:@"银行卡"];
    self.view.backgroundColor = APP_BACKCOLOR;
    
    NSArray * nameArray =@[@"持卡人",@"身份证号",@"手机号码",@"开户银行",@"开户所在省市",@"开户支行",@"银行卡号",@"确认卡号",@"登录密码",@"确认密码",];
   _placeholderArray = @[@"请输入真实姓名",@"请输入身份证号",@"请输入银行预留手机号码",@"请选择银行",@"开户所在省市",@"请填写开户行",@"请输入银行卡号",@"请再次输入银行卡号",@"6-16位数字或字母组成",@"请输入确认密码",];
    
    
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
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * Identifier = @"BankCardCell";
    BankCardTableViewCell * cell = [tableView  dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell = [[BankCardTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        
        cell.selectionStyle  = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
    }
    
    [cell setcellTextfeild:_dataArray[indexPath.row] placeholder:_placeholderArray[indexPath.row] andtag:indexPath.row];
    cell.textfeild.delegate = self;
    cell.tag = indexPath.row +100;
    if (_dataArray.count-1 == indexPath.row) {
        cell.textfeild.returnKeyType = UIReturnKeyDone;
    }
   
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
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





@end
