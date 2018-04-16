//
//  OptionalViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "OptionalViewController.h"
#import "OptionalTableViewCell.h"
#import "KlineViewController.h"

@interface OptionalViewController ()
@property(nonatomic,strong) UITableView * tableView;

@property(nonatomic,strong)YButton * zfButton;

@end

@implementation OptionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
    [self gradientLayerset];
    [self setnaviTitle:@"自选"];
   // [self makeUI];
    
}






@end
