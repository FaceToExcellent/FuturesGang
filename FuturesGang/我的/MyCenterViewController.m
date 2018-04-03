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
@interface MyCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
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
    
    [self addRightBtn];
    
    [self mycenterTabviewMake];
    
    
}
-(void)atrrayset{
    _namearray = @[@"资金明细",@"结算单",@"成交记录",@"个人信息",@"关于我们",@"推广赚钱",@"退出登录"];
    _imageArray= @[@"ZJMX",@"JSD",@"CJJL",@"GRXX",@"GYWM",@"TGZQ",@"TCDL"];
    
}
- (void)addRightBtn {
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"客服" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedOKbtn)];
    [rightBarItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)onClickedOKbtn {
    NSLog(@"客服");
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
