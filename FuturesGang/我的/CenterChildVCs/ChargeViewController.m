//
//  ChargeViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/4.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "ChargeViewController.h"
#import "ChargeHistoryViewController.h"
@interface ChargeViewController ()
@property(nonatomic,strong)UIButton * czButton;
@end

@implementation ChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值";
    
    [self addRightBtn:@"充值记录"];
    
    [self ChargeMakeUI];
    
}


-(void)onClickedOKbtn
{
    [super onClickedOKbtn];
    ChargeHistoryViewController * vc = [[ChargeHistoryViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)ChargeMakeUI{
    
   _czButton =  [self APPButtonmaker:@"确定充值" andtitleColor:[UIColor whiteColor] backColor:APP_BLUE andfont:18];
    _czButton.frame = CGRectMake((SCREEN_WIDTH-580*wb)/2, 635*hb, 580*wb, 80*hb);
    [_czButton addTarget:self action:@selector(czButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_czButton];
    
    _czButton.layer.masksToBounds = YES;
    _czButton.layer.cornerRadius = _czButton.frame.size.width/64;
}
-(void)czButtonClick{
    
    [self.navigationController popViewControllerAnimated:YES];
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
