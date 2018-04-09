//
//  PersonalViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/4.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "PersonalViewController.h"
#import "BankCardViewController.h"
@interface PersonalViewController ()

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setnaviTitle:@"银行卡绑定"];
   
   // [self NoBandViewmakeUI];
    [self DidBandViewMakeUI];
}
-(void)DidBandViewMakeUI{
    UIButton * addButton = [[UIButton alloc]init];
    addButton.frame = CGRectMake(30*wb, 30*hb, SCREEN_WIDTH-60*wb, 320*hb);
    [addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    [addButton setBackgroundColor:APP_RED];
    
    addButton.layer.masksToBounds =YES;
    addButton.layer.borderWidth = 0;
    addButton.layer.borderColor = [UIColor whiteColor].CGColor;
    addButton.layer.cornerRadius = addButton.frame.size.width/32;
    
    //更改 415 75
    
    UIButton * changeButton = [[UIButton alloc]init];
    changeButton.frame = CGRectMake(415*wb, 75*hb, 110*wb , 60*wb);
    changeButton.layer.masksToBounds = YES;
    changeButton.layer.borderWidth = 1;
    changeButton.layer.borderColor = [UIColor whiteColor].CGColor;
    changeButton.layer.cornerRadius = addButton.frame.size.width/64;
    [changeButton setTitle:@"更改" forState:UIControlStateNormal];
    changeButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [changeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(changeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [addButton addSubview:changeButton];
    
    //解绑
    
    UIButton * UnBandButton = [[UIButton alloc]init];
    UnBandButton.frame = CGRectMake(556*wb, 75*hb, 110*wb , 60*wb);
    UnBandButton.layer.masksToBounds = YES;
    UnBandButton.layer.borderWidth = 1;
    UnBandButton.layer.borderColor = [UIColor whiteColor].CGColor;
    UnBandButton.layer.cornerRadius = addButton.frame.size.width/64;
    [UnBandButton setTitle:@"解绑" forState:UIControlStateNormal];
    UnBandButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [UnBandButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [UnBandButton addTarget:self action:@selector(UNBandButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [addButton addSubview:UnBandButton];
    
    //line
    
    UIView * view =[[UIView alloc]init];
    view.frame =CGRectMake(0, 390*hb, SCREEN_WIDTH, 1);
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}
-(void)NoBandViewmakeUI{
    
    UIButton * addButton = [[UIButton alloc]init];
    addButton.frame = CGRectMake(30*wb, 30*hb, SCREEN_WIDTH-60*wb, 320*hb);
    [addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    
    addButton.layer.masksToBounds =YES;
    addButton.layer.borderWidth = 1;
    addButton.layer.borderColor = [UIColor whiteColor].CGColor;
    addButton.layer.cornerRadius = addButton.frame.size.width/32;
    
    
    UIImageView * plusimage = [[UIImageView alloc]init];
    plusimage.frame =CGRectMake(200*wb, 130*hb, 55*wb, 55*wb);
    plusimage.image = [UIImage imageNamed:@"plus"];
    [addButton addSubview:plusimage];
    
    
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(300*wb, 140*hb, 270*wb, 40*hb);
    label.text =@"添加银行卡";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentLeft;
    
    [addButton addSubview:label];
    
    
    //line
    
    UIView * view =[[UIView alloc]init];
    view.frame =CGRectMake(0, 390*hb, SCREEN_WIDTH, 1);
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
}
-(void)addButtonClick{
    BankCardViewController * vc  =[[BankCardViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)changeButtonClick{
    BankCardViewController * vc  =[[BankCardViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)UNBandButtonClick{
    //解绑
    
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
