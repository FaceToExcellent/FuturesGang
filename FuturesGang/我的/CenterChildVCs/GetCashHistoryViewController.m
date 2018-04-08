//
//  GetCashHistoryViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/4.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "GetCashHistoryViewController.h"
#import "GetCashHistoryCell.h"
@interface GetCashHistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation GetCashHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.title = @"提现记录";
    
    NSArray * arr = @[@[@"Done",@"2018-4-2",@"210000.00"],@[@"not",@"2018-4-2",@"18000.00"]];
    _dataArray = [[NSMutableArray alloc]initWithArray:arr];
    [self gradientLayerset];
    [self GetCashHistoryMakeUI];
}


-(void)GetCashHistoryMakeUI{
    
    _tableView = [[UITableView alloc]init];
    _tableView.frame =CGRectMake(0, 3, SCREEN_WIDTH, SCREEN_HEIGHT -StatusBarAndNavigationBarHeight-3);
    _tableView.delegate = self;
    _tableView.dataSource =self;
    _tableView.tableFooterView = [[UIView alloc]init];
    _tableView.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    _tableView.tableHeaderView = [self headviewmaker];
    
    
    
    
}

-(UIView*)headviewmaker{
    UIView * view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    view.backgroundColor =  APP_BACKCOLOR;
    
    
   
    //shijian
    UILabel * timelabel = [[UILabel alloc]init];
    timelabel.frame = CGRectMake(30*wb, 35*wb, 240*wb, 30*hb);
    timelabel.text = @"时间";
    timelabel.textColor = [UIColor whiteColor];
    [view addSubview:timelabel];
    //金额
    UILabel * cashLabel = [[UILabel alloc]init];
    cashLabel.frame = CGRectMake(270*wb, 35*hb, 270*wb, 30*hb);
    cashLabel.text = @"金额";
    cashLabel.textColor = [UIColor whiteColor];
    [view addSubview:cashLabel];
    //状态
    UILabel * stateLabel = [[UILabel alloc]init];
    stateLabel.frame = CGRectMake(540*wb, 35*hb, 270*wb, 30*hb);
    stateLabel.text = @"状态";
    stateLabel.textColor = [UIColor whiteColor];
    [view addSubview:stateLabel];
    
    if (SCREEN_WIDTH == 320) {
        timelabel.font = [UIFont systemFontOfSize:14];
        cashLabel.font = [UIFont systemFontOfSize:14];
        stateLabel.font = [UIFont systemFontOfSize:14];
    }else
    {
        timelabel.font = [UIFont systemFontOfSize:16];
        cashLabel.font = [UIFont systemFontOfSize:16];
        stateLabel.font = [UIFont systemFontOfSize:16];
    }
    
    
    
    return view;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GetCashHistoryCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GetCashHistoryCell"];
    if (!cell) {
        cell = [[GetCashHistoryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GetCashHistoryCell"];
          cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    }
    NSArray * arr = [_dataArray objectAtIndex:indexPath.row];
    
    [cell setstateofIsDoneornot:[arr objectAtIndex:0]];
    cell.timelabel.text = arr[1];
    cell.cashLabel.text = arr[2];
    
    
    return cell;
}


@end
