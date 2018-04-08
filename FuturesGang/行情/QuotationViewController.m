//
//  QuotationViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "QuotationViewController.h"
#import "SRNetworkTool.h"
@interface QuotationViewController ()

@end

@implementation QuotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   [self setnaviTitle:@"行情"];
    
    //暂时如此 无法验证
    [SRNetworkTool getSRMessageWithUrl:@"www.baidu.com" success:^(id dict) {
        
    } fail:^(NSError *error) {
        
    }];
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
