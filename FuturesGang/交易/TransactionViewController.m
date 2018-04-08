//
//  TransactionViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "TransactionViewController.h"
#import "NNValidationView.h"
@interface TransactionViewController ()
@property (nonatomic, strong) NNValidationView *testView;
@end

@implementation TransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setnaviTitle:@"交易"];
    [self setupViews];
}


- (void)setupViews {
    _testView = [[NNValidationView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 100) / 2, 200, 100, 40) andCharCount:4 andLineCount:4];
    [self.view addSubview:_testView];
    
    __weak typeof(self) weakSelf = self;
    /// 返回验证码数字
    _testView.changeValidationCodeBlock = ^(void){
        NSLog(@"验证码被点击了：%@", weakSelf.testView.charString);
    };
    NSLog(@"第一次打印：%@", self.testView.charString);
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
