//
//  KlineViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/13.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "KlineViewController.h"
#import "TransactionKlineView.h"
@interface KlineViewController ()

@end

@implementation KlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TransactionKlineView * view  =[[TransactionKlineView alloc]init];
    
    view.frame = self.view.frame;
    [self.view addSubview:view];
  
    // Do any additional setup after loading the view.
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
