//
//  RootViewController.m
//  xbiao
//
//  Created by zhuangzhe on 15/5/25.
//  Copyright (c) 2015年 腕表之家. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        self.navigationController.navigationBar.barTintColor = APP_BACKCOLOR;
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

        //设置导航栏背景色不变淡
        self.navigationController.navigationBar.translucent = NO ;
        //去掉导航栏下面的黑边
        [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

-(void)gradientLayerset{
    //渐变
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0,0, SCREEN_WIDTH,3);  // 设置显示的frame
    gradientLayer.colors = @[(id)RGBA(23, 22, 33, 1).CGColor,(id)APP_BACKCOLOR.CGColor];  // 设置渐变颜色
    gradientLayer.startPoint = CGPointMake(0, 0);   //
    gradientLayer.endPoint = CGPointMake(0, 1);     //
    [self.view.layer addSublayer:gradientLayer];
}
//UIButton maker
-(UIButton*)APPButtonmaker:(NSString*)title andtitleColor:(UIColor*)titleColor  backColor:(UIColor*)color andfont:(float)font{
    UIButton * button =[[UIButton alloc]init];
    
    [button setBackgroundColor:color];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    if (SCREEN_WIDTH == 320) {
        button.titleLabel.font = [UIFont systemFontOfSize: font-2];
    }else
    {
        button.titleLabel.font = [UIFont systemFontOfSize: font];
    }
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    
    return  button;
}
//UITextField maker
-(UITextField*)textFieldMakewithtext:(NSString *)text placeholder:(NSString *)placeholder withframe:(CGRect)rect backgroundColor:(UIColor*)color andtag:(NSInteger)tag andleftViewframe:(CGRect)leftframe{
    UITextField * textfield =  [[UITextField alloc]init];
    
    textfield.frame = rect;
    textfield.tag = tag;
    textfield.backgroundColor = color;
    
    UIView * leftview = [[UIView alloc]init];
    leftview.frame = leftframe;
    leftview.backgroundColor =color;
    [textfield addSubview:leftview];
    
    UILabel * label = [[UILabel alloc]init];
    label.frame =CGRectMake(30*wb, (leftframe.size.height -30*hb)/2-1, leftframe.size.width-30*wb, 30*hb);
    label.textColor = [UIColor whiteColor];
    label.text =text;
    if (SCREEN_WIDTH == 320) {
        label.font = [UIFont systemFontOfSize:13];
    }else
    {
        label.font = [UIFont systemFontOfSize:15];
    }
    label.textAlignment = NSTextAlignmentLeft;
    [leftview addSubview:label];
    textfield.leftView = leftview;
    textfield.leftViewMode=UITextFieldViewModeAlways;
    
    
    textfield.placeholder =placeholder;
    [textfield setValue:RGBA(150, 160, 190, 1) forKeyPath:@"_placeholderLabel.textColor"];
    [textfield setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    return textfield;
}

-(void)setnaviTitle:(NSString *)title
{
//     CGSize titleSize = [title sizeWithFont:[UIFont boldSystemFontOfSize:18] constrainedToSize:CGSizeMake(200, 30)];
    
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18]};
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake(200, 30) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    _navTitleView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, titleSize.width+30, 44)];
    _navTitleLebel=[[UILabel alloc]initWithFrame:CGRectMake(15, 0, titleSize.width, 44)];
    _navTitleLebel.text=title;
    _navTitleLebel.font=[UIFont boldSystemFontOfSize:18];
    _navTitleLebel.backgroundColor=[UIColor clearColor];
    _navTitleLebel.textColor=[UIColor whiteColor];
    [_navTitleView addSubview:_navTitleLebel];
    _navTitleLebel.textAlignment=NSTextAlignmentCenter;
    self.navigationItem.titleView=_navTitleView;
}
- (void)setNaviLogo:(NSString *)picNmae
{
    _navTitleView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 8, 100, 28)];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView setImage:[UIImage imageNamed:picNmae]];
    [_navTitleView addSubview:imageView];
    self.navigationItem.titleView=_navTitleView;
}
- (void) setUserSex:(NSInteger) sex
{
    if (_sexImageView == nil) {
        _sexImageView = [[UIImageView alloc] init];
    }
    [_sexImageView setFrame:CGRectMake(_navTitleLebel.frame.size.width+20, 15, 11, 11)];
    switch (sex) {
        case 0:
             [_sexImageView setImage:[UIImage imageNamed:@"female"]];
             [_navTitleView addSubview:_sexImageView];
            break;
        case 1:
            [_sexImageView setImage:[UIImage imageNamed:@"male"]];
             [_navTitleView addSubview:_sexImageView];
            break;
        case -1:
            [_sexImageView removeFromSuperview];
            break;
        default:
            break;
    }

   
}

//-(NSUInteger)supportedInterfaceOrientations{
//    return UIInterfaceOrientationMaskPortraitUpsideDown;
//}
- (BOOL)shouldAutorotate
{
    return NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
