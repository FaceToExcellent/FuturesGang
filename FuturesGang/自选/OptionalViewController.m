//
//  OptionalViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "OptionalViewController.h"
#import "OptionalTableViewCell.h"
#import "KlineViewController.h"
@interface OptionalViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;

@property(nonatomic,strong)UIButton * zfButton;
@end

@implementation OptionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
    [self gradientLayerset];
    [self setnaviTitle:@"自选"];
    [self makeUI];
    
}



-(void)makeUI{
    _tableView = [[UITableView alloc]init];
    _tableView.frame =CGRectMake(0, 3, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarAndNavigationBarHeight-3);
    _tableView.delegate =self;
    _tableView.dataSource = self;
     _tableView.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
    _tableView.tableFooterView = [[UIView alloc]init];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableHeaderView = [self headviewmake];
    [self.view addSubview:_tableView];

}


-(UIView*)headviewmake{
    UIView * bgview = [[UIView alloc]init];
    bgview.frame =CGRectMake(0, 0, SCREEN_WIDTH, 80*hb);
    [bgview setBackgroundColor:APP_BACKCOLOR];
    
    //合约代码
    UILabel * hylabel = [[UILabel alloc]init];
    hylabel.frame =CGRectMake(30*wb, 20*hb, 170*wb, 40*hb);
    hylabel.text = @"合约代码";
    hylabel.textAlignment = NSTextAlignmentCenter;
    hylabel.font = [UIFont systemFontOfSize:14];
    hylabel.textColor = RGBA(169, 169, 169, 1);
    [bgview addSubview:hylabel];
    //最新价
    UILabel * zxlabel = [[UILabel alloc]init];
    zxlabel.frame =CGRectMake(360*wb, 20*hb, 170*wb, 40*hb);
    zxlabel.text = @"最新价";
    zxlabel.textAlignment = NSTextAlignmentLeft;
    zxlabel.font = [UIFont systemFontOfSize:14];
    zxlabel.textColor = RGBA(169, 169, 169, 1);
    [bgview addSubview:zxlabel];
    
    
    
    
    return bgview;
    
}
#pragma mark  tableView.delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * Identifier = @"OptionalViewCell";
    OptionalTableViewCell * cell = [tableView  dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell = [[OptionalTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        
        cell.selectionStyle  = UITableViewCellSelectionStyleNone;
    }
    
    [cell setcellData:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 124*hb;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    OptionalTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    KlineViewController * kvc = [[KlineViewController alloc]init];
    [kvc setnaviTitle:cell.nameLabel.text];
    [self.navigationController pushViewController:kvc animated:YES];
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
