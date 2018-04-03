//
//  RootTabViewController.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "RootTabViewController.h"


#import "QuotationViewController.h"
#import "OptionalViewController.h"
#import "TransactionViewController.h"
#import "MyCenterViewController.h"

@interface RootTabViewController ()

@end

@implementation RootTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBar appearance] setBarTintColor:RGBA(31, 33,44, 1.0f)];
    [UITabBar appearance].translucent = NO;
    [self setVCs];

}
-(void)setVCs{
    //创建页面
    QuotationViewController   * QuVC = [[QuotationViewController alloc] init];
    OptionalViewController    * OptionVC = [[OptionalViewController alloc] init];
    TransactionViewController * TRSVC = [[TransactionViewController alloc] init];
    MyCenterViewController    *  myCenterVC = [[MyCenterViewController alloc] init];
    
    //设置导航条
    UINavigationController *selNav = [[UINavigationController alloc] initWithRootViewController:QuVC];
    [selNav.tabBarItem setImage:[UIImage imageNamed:@"tab1"]];
    [selNav.tabBarItem setSelectedImage:[self tabBarSelectImageWithName:@"tab1_h"]];
    [selNav.tabBarItem setTitle:@"行情"];
    [selNav.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0F], NSForegroundColorAttributeName :RGBA(24, 22, 22, 1.0f) } forState:UIControlStateSelected];
    
    //
    UINavigationController *jewelryNav = [[UINavigationController alloc] initWithRootViewController:OptionVC];
    [jewelryNav.tabBarItem setImage:[UIImage imageNamed:@"tab2"]];
    [jewelryNav.tabBarItem setSelectedImage:[self tabBarSelectImageWithName:@"tab2_h"]];
    [jewelryNav.tabBarItem setTitle:@"自选"];
    [jewelryNav.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0F], NSForegroundColorAttributeName :RGBA(24, 22, 22, 1.0f) } forState:UIControlStateSelected];
    //
    UINavigationController *bbsNav = [[UINavigationController alloc] initWithRootViewController:TRSVC];
    [bbsNav.tabBarItem setImage:[UIImage imageNamed:@"tab3"]];
    [bbsNav.tabBarItem setSelectedImage:[self tabBarSelectImageWithName:@"tab3_h"]];
    [bbsNav.tabBarItem setTitle:@"交易"];
    [bbsNav.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0F], NSForegroundColorAttributeName :RGBA(24, 22, 22, 1.0f) } forState:UIControlStateSelected];
    //
    UINavigationController *myCenterNav = [[UINavigationController alloc] initWithRootViewController:myCenterVC];
    [myCenterNav.tabBarItem setImage:[UIImage imageNamed:@"tab4"]];
    [myCenterNav.tabBarItem setSelectedImage:[self tabBarSelectImageWithName:@"tab4_h"]];
    [myCenterNav.tabBarItem setTitle:@"我的"];
    [myCenterNav.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0F], NSForegroundColorAttributeName :RGBA(24, 22, 22, 1.0f) } forState:UIControlStateSelected];
    //
    self.viewControllers = @[selNav,jewelryNav,bbsNav,myCenterNav];

}

- (UIImage *)tabBarSelectImageWithName:(NSString *)name
{
    UIImage * image = [UIImage imageNamed:name];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
