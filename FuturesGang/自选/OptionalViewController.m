//
//  OptionalViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "OptionalViewController.h"
#import "OptionalTableViewCell.h"
@interface OptionalViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
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
    [self.view addSubview:_tableView];

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
