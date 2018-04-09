//
//  ChargeViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/4.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "ChargeViewController.h"
#import "ChargeHistoryViewController.h"
#import "PersonalViewController.h"
@interface ChargeViewController ()
@property(nonatomic,strong)UIButton * czButton;
@end

@implementation ChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setnaviTitle:@"充值"];
    [self addRightBtn:@"充值记录"];
    
   // [self ChargeMakeUI];
    
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
