//
//  CashDetailViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/4.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "CashDetailViewController.h"
#import "CashTableViewCell.h"
@interface CashDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataarray;
@end

@implementation CashDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setnaviTitle:@"资金明细"];
    self.view.backgroundColor = APP_BACKCOLOR;
    // Do any additional setup after loading the view.
    
    NSArray * arr = @[@[@"down",@"银行卡提现",@"2018-4-2 15：35",@"+2100000000元"],@[@"up",@"银行卡充值",@"2018-4-2 15：30",@"+1800元"],@[@"up",@"银行卡充值",@"2018-4-2 15：30",@"+1800元"],@[@"up",@"银行卡充值",@"2018-4-2 15：30",@"+1800元"],@[@"up",@"银行卡充值",@"2018-4-2 15：30",@"+1800元"]];
    //假数据
    _dataarray = [[NSMutableArray alloc]initWithArray:arr];
    [self cashMakeUI];
}



-(void)cashMakeUI{
    _tableView = [[UITableView alloc]init];
    _tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - StatusBarAndNavigationBarHeight);
    _tableView.tableFooterView = [[UIView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = APP_BACKCOLOR;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataarray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CashTableViewCell * cell =[ tableView dequeueReusableCellWithIdentifier:@"cashcell"];
    if (!cell) {
        cell = [[CashTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cashcell"];
        
    }
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    NSArray * arr = [_dataarray objectAtIndex:indexPath.row];
    
    [cell resetColor:arr[0]];
    cell.celltitle.text = arr[1];
    cell.timelabel.text = arr[2];
    cell.cashLabel.text = arr[3];
    
    cell.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
