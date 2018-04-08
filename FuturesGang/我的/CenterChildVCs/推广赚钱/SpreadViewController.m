//
//  SpreadViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/4.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "SpreadViewController.h"
#import "MyuserViewController.h"
@interface SpreadViewController ()

@end

@implementation SpreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self setnaviTitle:@"推广赚钱"];
    [self addRightBtn:@"我的用户"];
   
    
}

-(void)onClickedOKbtn{
    //跳转我的用户
    MyuserViewController *vc = [[MyuserViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
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
