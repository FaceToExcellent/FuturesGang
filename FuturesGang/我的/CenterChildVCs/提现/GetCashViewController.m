//
//  GetCashViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/4.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "GetCashViewController.h"
#import "GetCashHistoryViewController.h"
#import "PersonalViewController.h"
@interface GetCashViewController ()
@property(nonatomic,strong)UIButton * txButton;
@end

@implementation GetCashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setnaviTitle:@"提现"];
    [self addRightBtn:@"提现记录"];
   // [self GetCashMakeUI];
    [self noBandCard];
}

-(void)noBandCard{
    
    UIButton * noBandButton = [[UIButton alloc]init];
    noBandButton.frame = CGRectMake(0, 3, SCREEN_WIDTH, 100*hb);
    [noBandButton setBackgroundColor: APP_TEXTFEILD_BACKCOLOR];
    [noBandButton addTarget:self action:@selector(noBandButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:noBandButton];
    
    
    UIButton * plusButton = [[UIButton alloc]init];
    plusButton.frame = CGRectMake(30*wb, 30*hb, 40*wb, 40*hb);
    [plusButton setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    [noBandButton addSubview:plusButton];
    
    
    UILabel * buttonlabel = [[UILabel alloc]init];
    buttonlabel.frame =  CGRectMake(100*wb, 35*hb, 250*wb, 30*hb);
    buttonlabel.text = @"请添加银行卡";
    buttonlabel.font = [UIFont systemFontOfSize:14];
    buttonlabel.textColor = [UIColor whiteColor];
    [noBandButton addSubview:buttonlabel];
    
    UIImageView * _goright = [[UIImageView alloc]init];
    _goright.frame= CGRectMake(SCREEN_WIDTH -45*wb, 35*hb, 20*wb, 30*wb);
    _goright.image =  [UIImage imageNamed:@"ZXJT"];
    //_goright.backgroundColor = [UIColor blueColor];
    [noBandButton addSubview:_goright];
    
    
}

-(void)noBandButtonClick{
    
    PersonalViewController * vc = [[PersonalViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


-(void)GetCashMakeUI{
    
    _txButton =  [self APPButtonmaker:@"提现" andtitleColor:[UIColor whiteColor] backColor:APP_BLUE andfont:18];
    _txButton.frame = CGRectMake((SCREEN_WIDTH-580*wb)/2, 635*hb, 580*wb, 80*hb);
    [_txButton addTarget:self action:@selector(txButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_txButton];
    
    _txButton.layer.masksToBounds = YES;
    _txButton.layer.cornerRadius = _txButton.frame.size.width/64;
}
-(void)txButtonClick{
    
}
-(void)onClickedOKbtn
{
    [super onClickedOKbtn];
    GetCashHistoryViewController * vc = [[GetCashHistoryViewController alloc]init];
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
