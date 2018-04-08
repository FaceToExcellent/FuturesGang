//
//  MyCenterViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "MyCenterViewController.h"
#import "MyCenterTableViewCell.h"
#import "MycenterHeadView.h"


#import "CashDetailViewController.h"
#import "SettlementViewController.h"
#import "DealRecordViewController.h"
#import "PersonalViewController.h"
#import "AboutUsViewController.h"
#import "SpreadViewController.h"

#import "LoginViewController.h"

#import "ChargeViewController.h"
#import "GetCashViewController.h"

@interface MyCenterViewController ()<UITableViewDelegate,UITableViewDataSource,MycenterHeadViewDelegate>
@property(nonatomic,strong)UITableView * mycenterTableView;

@property(nonatomic,strong)NSArray * namearray;
@property(nonatomic,strong)NSArray * imageArray;
@end

@implementation MyCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(31, 33, 44, 1);
    [self setnaviTitle:@"我的"];
    [self atrrayset];
    
    //[self addRightBtn];
    
    [self mycenterTabviewMake];
    
    
}
-(void)atrrayset{
    _namearray = @[@"资金明细",@"结算单",@"成交记录",@"个人信息",@"关于我们",@"推广赚钱",@"退出登录"];
    _imageArray= @[@"ZJMX",@"JSD",@"CJJL",@"GRXX",@"GYWM",@"TGZQ",@"TCDL"];
    
}


-(void)mycenterTabviewMake{
    _mycenterTableView = [[UITableView alloc]init];
    _mycenterTableView.backgroundColor =RGBA(31, 33, 44, 1);
    _mycenterTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarAndNavigationBarHeight-TabbarHeight);
    
    _mycenterTableView.delegate = self;
    _mycenterTableView.dataSource =self;
    _mycenterTableView.tableFooterView = [[UIView alloc]init];
    _mycenterTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   // _mycenterTableView.scrollEnabled =NO;
    [self.view addSubview:_mycenterTableView];
    
    
    MycenterHeadView * view = [[MycenterHeadView alloc]init];
    view.frame =CGRectMake(0, 0, SCREEN_WIDTH, 345*hb);
    view.delegate = self;
    _mycenterTableView.tableHeaderView = view;
}

#pragma mark TableView.delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return 5;
    }else
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCenterTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"mycentercell"];
    if (!cell) {
        cell = [[MyCenterTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycentercell"];
    }
     cell.ishidegoright = NO;
    if (indexPath.section == 0) {
        cell.name.text = [NSString stringWithFormat:@"%@",_namearray[indexPath.row]];
        cell.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_imageArray[indexPath.row]]];
    }
    if (indexPath.section == 1) {
        cell.name.text = [NSString stringWithFormat:@"%@",_namearray[5]];
        cell.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_imageArray[5]]];
    }
    if (indexPath.section == 2) {
        cell.name.text = [NSString stringWithFormat:@"%@",_namearray.lastObject];
        cell.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_imageArray.lastObject]];
    }
    
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 15*wb);
    view.backgroundColor = RGBA(31, 33, 44, 1);
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100*hb;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15*hb;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //资金明细
            
            CashDetailViewController * vc = [[CashDetailViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            
        }
        if (indexPath.row == 1) {
            //结算单
            SettlementViewController * vc = [[SettlementViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.row == 2) {
            //成交记录
            DealRecordViewController * vc = [[DealRecordViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.row == 3) {
            //个人信息
            PersonalViewController * vc = [[PersonalViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.row == 4) {
            //关于我们
            AboutUsViewController * vc = [[AboutUsViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
    if(indexPath.section == 1){
        if (indexPath.row == 0) {
            //推广赚钱
            SpreadViewController * vc = [[SpreadViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            //退出登录
            
            LoginViewController * lvc= [[LoginViewController alloc]init];
            [self presentViewController:lvc animated:YES completion:nil];
        }
    }
    
    
}
#pragma mark  MycenterHeadViewDelegate
-(void)czButtonpushToDetail{
     ChargeViewController * vc = [[ChargeViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)txButtonpushToDetail{
    GetCashViewController * VC = [[GetCashViewController alloc]init];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
