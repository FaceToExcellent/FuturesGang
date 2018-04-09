//
//  BankCardViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/8.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "BankCardViewController.h"

@interface BankCardViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation BankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      [self setnaviTitle:@"银行卡"];
    self.view.backgroundColor = APP_BACKCOLOR;
    
    NSArray * nameArray =@[@"持卡人",@"身份证号",@"手机号码",@"开户银行",@"开户所在省市",@"开户支行",@"银行卡号",@"确认卡号",@"登录密码",@"确认密码",];
    NSArray * placeholderArray =@[@"请输入真实姓名",@"请输入身份证号",@"请输入银行预留手机号码",@"请选择银行",@"开户所在省市",@"请填写开户行",@"请输入银行卡号",@"请再次输入银行卡号",@"6-16位数字或字母组成",@"请输入确认密码",];
    
    
    _dataArray = [[NSMutableArray alloc]initWithArray:nameArray];
    [self BankCardMakeUI];
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
    UITableViewCell * cell = [tableView  dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        
        cell.selectionStyle  = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
