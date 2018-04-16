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
@property (nonatomic,strong)InformationScrollView *infoView;
@property (nonatomic) NSInteger selIndex;
@end

@implementation QuotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   [self setnaviTitle:@"行情"];
     _selIndex = 0;
    [self creatView];
    [self gradientLayerset];
}

- (void)creatView
{
    if (_infoView == nil) {
        _infoView = [[InformationScrollView alloc] initWithFrame:CGRectMake(0, 3, SCREEN_WIDTH, SCREEN_HEIGHT - StatusBarAndNavigationBarHeight - TabbarHeight-3)];
        _infoView.delegate = self;
        _infoView.backgroundColor = self.view.backgroundColor;
        [_infoView loadView];
    }
    [self.view addSubview:_infoView];
}

-(void)setViewsDataSource
{
    if (_infoView.viewArray == nil) {
        _infoView.viewArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    [_infoView.viewArray removeAllObjects];
  
    CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - StatusBarAndNavigationBarHeight - TabbarHeight);

    
    UIView *view1 = [[UIView alloc] initWithFrame:rect];
    
    view1.backgroundColor = [UIColor redColor];
    [_infoView.viewArray addObject:view1];
    
    
    UIView *view2 = [[UIView alloc] initWithFrame:rect];
    view2.backgroundColor = [UIColor blueColor];
    
    [_infoView.viewArray addObject:view2];
    UIView *view3 = [[UIView alloc] initWithFrame:rect];
    view3.backgroundColor = [UIColor orangeColor];
    
    [_infoView.viewArray addObject:view3];
    UIView *view4 = [[UIView alloc] initWithFrame:rect];
    
     view4.backgroundColor = [UIColor purpleColor];
    [_infoView.viewArray addObject:view4];
    UIView *view5 = [[UIView alloc] initWithFrame:rect];
    view5.backgroundColor = [UIColor grayColor];
    
    [_infoView.viewArray addObject:view5];
    UIView *view6 = [[UIView alloc] initWithFrame:rect];
    
     view6.backgroundColor = [UIColor greenColor];
    [_infoView.viewArray addObject:view6];
    UIView *view7 = [[UIView alloc] initWithFrame:rect];
    
      view7.backgroundColor = [UIColor blackColor];
    [_infoView.viewArray addObject:view7];
    UIView *view8 = [[UIView alloc] initWithFrame:rect];
    
    view8.backgroundColor = [UIColor brownColor];
    [_infoView.viewArray addObject:view8];
    
    
    
    
    
    
    
}


- (void)changeViewWith:(NSInteger)tag
{
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
