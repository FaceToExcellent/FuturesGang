//
//  InformationNavView.m
//  xbiao
//
//  Created by zhuangzhe on 15/6/3.
//  Copyright (c) 2015年 腕表之家. All rights reserved.
//

//高度
#define Navi_BtnTitle_H  14
//高度
#define Navi_BtnTitle  15
//
#define Navi_BtnWedth  90

#define Navi_FootOrginX  16

#define Navi_Height  36

#import "InformationNavView.h"
@interface InformationNavView ()
@property (nonatomic) NSInteger page;
@property (nonatomic) NSInteger leftOrRight;
@property (nonatomic) BOOL isBegin;
@property (nonatomic) BOOL isClick;
@property (nonatomic,strong) UIButton *btnA;
@property (nonatomic,strong) UIButton *btnB;
@property (nonatomic)        float naviWedth;

@end
@implementation InformationNavView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        _page = 0;
        _isBegin =YES;
        _isClick = YES;
        self.backgroundColor = APP_BACKCOLOR;
       
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Navi_Height)];
//            _scrollView.backgroundColor = [UIColor cyanColor];
        _scrollView.delegate = self;
        self.scrollView.contentSize = CGSizeMake(8*Navi_BtnWedth, 0);
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [_scrollView setScrollsToTop:NO];
        _naviWedth = Navi_BtnWedth;
         _scrollView.backgroundColor = APP_BACKCOLOR;
        [self setNavBar];
        [self creatView];
        [self creatNavFootView];
        
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame andNaviArr:(NSArray *)naviArr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        _page = 0;
        _isBegin =YES;
        _isClick = YES;
       self.backgroundColor = APP_BACKCOLOR;
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Navi_Height)];
        //            _scrollView.backgroundColor = [UIColor cyanColor];
        _scrollView.delegate = self;
         _scrollView.backgroundColor = APP_BACKCOLOR;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [_scrollView setScrollsToTop:NO];
        _naviWedth = SCREEN_WIDTH/naviArr.count;
        [self setNavBarWithArr:naviArr];
        [self creatNavFootViewWith:45];
        
    }
    return self;
}
- (void) creatView
{
    

    _leftLayerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, Navi_Height)];
   // [self setViewLayer:self.leftLayerView startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    [_leftLayerView setUserInteractionEnabled:NO];
    [self addSubview:_leftLayerView];
    
    _rightLayerView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width -40, 0, 40, Navi_Height)];
   // [self setViewLayer:self.rightLayerView startPoint:CGPointMake(1, 0) endPoint:CGPointMake(0, 0)];
    [_rightLayerView setUserInteractionEnabled:NO];
    [self addSubview:_rightLayerView];
}
//- (void)setViewLayer:(UIView *)LayerView startPoint:(CGPoint )startPoint endPoint:(CGPoint )endPoint
//{
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];  // 设置渐变效果
//
//    gradientLayer.bounds = self.leftLayerView.bounds;
//    gradientLayer.borderWidth = 0;
//
//    gradientLayer.frame = self.leftLayerView.bounds;
//    gradientLayer.colors = [NSArray arrayWithObjects:
//                            (id)[RGBA(255, 255, 255, 1) CGColor],
//                            (id)[RGBA(255, 255, 255, 0) CGColor], nil];
//    gradientLayer.startPoint = startPoint;
//    gradientLayer.endPoint = endPoint;
//
//    [LayerView.layer insertSublayer:gradientLayer atIndex:0];
//
//
//}
//写着玩，没有用--旋转
- (void)setAnimation:(UIView *)view
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotationAnimation.duration = 2;
    rotationAnimation.repeatCount = 1000;//你可以设置到最大的整数值
    rotationAnimation.cumulative = NO;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    [view.layer addAnimation:rotationAnimation forKey:@"Rotation"];
}
//导航栏按钮标记
- (void)creatNavFootView
{
    _navFootView  = [[UIView alloc] initWithFrame:CGRectMake(Navi_FootOrginX, Navi_Height -2.5f, 128*wb, 2.5f)];
    _navFootView.backgroundColor = APP_BLUE ;
    [_navFootView setUserInteractionEnabled:NO];
    [self.scrollView addSubview:self.navFootView];
}
- (void)creatNavFootViewWith:(float)wedth
{
    _navFootView  = [[UIView alloc] initWithFrame:CGRectMake((_naviWedth - wedth)/2, Navi_Height -2.5f, wedth, 2.5f)];
    _navFootView.backgroundColor =  APP_BLUE  ;
    [_navFootView setUserInteractionEnabled:NO];
    [self.scrollView addSubview:self.navFootView];
}
//导航条
- (void)setNavBar
{
    NSArray *titleArray = @[@"主力行情",@"上海期货",@"郑州期货",@"大连期货",@"广东期货",@"深圳期货",@"香港期货",@"美国期货"];
    for (int i = 0; i< 8; i++)
    {
        float orginX =Navi_BtnWedth *i;
        UIButton *navBtn = [[UIButton alloc] initWithFrame:CGRectMake(orginX, 0, Navi_BtnWedth, Navi_Height)];
//                navBtn.backgroundColor= RGBA(248, 248, 248, 1);
        [navBtn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [navBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [navBtn setTitleColor:APP_BLUE forState:UIControlStateSelected];
//        [navBtn setBackgroundColor:[UIColor clearColor]];
        navBtn.titleLabel.font = [UIFont systemFontOfSize: Navi_BtnTitle_H];//选中状态变为20
        navBtn.tag = i+100;
        [navBtn addTarget:self action:@selector(navBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        //进入时设置系统消息界面为选中状态，且不可点击
        if (i == 0) {
            navBtn.selected = YES;
            [navBtn setUserInteractionEnabled:NO];
            navBtn.titleLabel.font = [UIFont systemFontOfSize: Navi_BtnTitle_H];
        }
        
        [self.scrollView addSubview:navBtn];
    }
    [self addSubview:_scrollView];
    
}
- (void)setNavBarWithArr:(NSArray*)naviArr
{
    for (int i = 0; i< naviArr.count; i++)
    {
        float wedth = SCREEN_WIDTH/naviArr.count;
        float orginX =wedth *i;
        UIButton *navBtn = [[UIButton alloc] initWithFrame:CGRectMake(orginX, 0, wedth, Navi_Height)];
        //                navBtn.backgroundColor= RGBA(248, 248, 248, 1);
        [navBtn setTitle:[naviArr objectAtIndex:i] forState:UIControlStateNormal];
        [navBtn setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        [navBtn setTitleColor:APP_BLUE forState:UIControlStateSelected];
        //        [navBtn setBackgroundColor:[UIColor clearColor]];
        navBtn.titleLabel.font = [UIFont systemFontOfSize: Navi_BtnTitle_H];//选中状态变为20
        navBtn.tag = i+100;
        [navBtn addTarget:self action:@selector(navBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        //进入时设置系统消息界面为选中状态，且不可点击
        if (i == 0) {
            navBtn.selected = YES;
            [navBtn setUserInteractionEnabled:NO];
            navBtn.titleLabel.font = [UIFont systemFontOfSize: Navi_BtnTitle_H];
        }
        
        [self.scrollView addSubview:navBtn];
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, _scrollView.frame.size.height - 0.5, SCREEN_WIDTH, 0.5f)];
    [label setBackgroundColor:RGBA(229, 229, 229, 1)];
    [_scrollView addSubview:label];
    [self addSubview:_scrollView];
}

- (void) navBtnClick:(UIButton *)sender
{
    _isClick = YES;
    [self setBtnTitleFont];
    _page = sender.tag -100;
    CGRect footFrame = _navFootView.frame;

        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
    footFrame.origin.x = sender.frame.origin.x + (sender.frame.size.width - _navFootView.frame.size.width)/2;//_page *Navi_BtnWedth+Navi_FootOrginX;
//        footFrame.size.width = 40;
        [_navFootView setFrame:footFrame];
        [UIView commitAnimations];
//    }
    [_delegate navViewButtonClick:sender.tag];
//    sender.titleLabel.font = [UIFont systemFontOfSize: Navi_BtnTitle_H];
    sender.selected = YES;
    [sender setUserInteractionEnabled:NO];
}

- (void) setBtnTitleFont
{
    for (int i = 100; i<108; i++) {
        UIButton *abtn = (UIButton *)[self viewWithTag:i];
//        abtn.titleLabel.font = [UIFont systemFontOfSize: Navi_BtnTitle];
        abtn.selected = NO;
        [abtn setUserInteractionEnabled:YES];
    }
}
#pragma - scrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    
}
//已知BUG:快速滑动会使标题条失控，等待修复(已修复)
- (void)PageScrollViewDidScroll:(UIScrollView *)scrollView
{
    float xxx = scrollView.contentOffset.x/scrollView.frame.size.width;
    //开始滑动时判断是向左滑还是向右滑，从而判定相应的button改变
    if (xxx< 6 &&xxx>0 && !_isClick)
    {
        if (_isBegin) {

            _leftOrRight= xxx >_page ? 1: -1;
            _btnA = (UIButton *)[self viewWithTag:100+_page];
            _btnB = (UIButton *)[self viewWithTag:100+_page +_leftOrRight];
            _isBegin = NO;
        }

    }
    if (xxx -_page >1||xxx -_page<-1) {
        _page = _page + _leftOrRight;
        _isBegin = YES;
    }
    if (!_isClick) {
        CGRect footFrame = _navFootView.frame;
        footFrame.origin.x = xxx *_naviWedth+(_naviWedth - _navFootView.frame.size.width)/2;
        [_navFootView setFrame:footFrame];
    }
    _isClick = NO;
    
}


//页面滑动结束后
- (void)PageScrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger orignX = scrollView.contentOffset.x/scrollView.frame.size.width;
    _page = orignX;
//    NSLog(@"page:%ld",_page);
    _isBegin = YES;
    [self setBtnTitleFont];
    _btnA = (UIButton *)[self viewWithTag:_page+100];
//    _btnA.titleLabel.font = [UIFont systemFontOfSize: Navi_BtnTitle_H];
    _btnA.selected = YES;
    [_btnA setUserInteractionEnabled:NO];
    float xx = scrollView.contentOffset.x * (Navi_BtnWedth / self.frame.size.width) -Navi_BtnWedth;
    if (xx > self.scrollView.contentSize.width - self.frame.size.width+10) {
        xx = self.scrollView.contentSize.width - self.frame.size.width+10;
    }
    if (xx< -40) {
        xx = 0 ;
    }
    CGPoint contentOffset = self.scrollView.contentOffset;
    [self.scrollView setContentOffset:CGPointMake(xx, contentOffset.y ) animated:YES];
    CGRect footFrame = _navFootView.frame;

        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        footFrame.origin.x = _page *_naviWedth+(_naviWedth - _navFootView.frame.size.width)/2;
//        footFrame.size.width = 40;
        [_navFootView setFrame:footFrame];
        [UIView commitAnimations];
//    }
}
@end
