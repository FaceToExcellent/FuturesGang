//
//  InformationScrollView.m
//  xbiao
//
//  Created by zhuangzhe on 15/7/15.
//  Copyright (c) 2015年 腕表之家. All rights reserved.
//

#import "InformationScrollView.h"


@interface InformationScrollView ()



@end
@implementation InformationScrollView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self.layer setMasksToBounds:NO];
    }

    return self;
}
- (void)loadView
{
    if (self.viewArray.count <5) {
        [self.delegate setViewsDataSource];
        [self.delegate changeViewWith:0];
    }
    
    if (self.scrollView == nil) {
        [self creatScrollView];
    }
    if (self.navView == nil) {
        [self creatNavView];
    }
}
- (void)creatNavView
{
    if (_naviArray.count>0) {
        _navView = [[InformationNavView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 36) andNaviArr:_naviArray];
    }
    else
    {
        _navView = [[InformationNavView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 36)];
    }
    
    _navView.backgroundColor =[UIColor whiteColor];
    _navView.delegate = self;
    [self addSubview:_navView];
}
- (void)setInfoViewFrame:(CGRect)frame hiddenNavView:(BOOL)hideNav
{
    [self setFrame:frame];
    CGFloat orginY= 36;
    if (hideNav) {
        orginY = 0;
    }
    [_scrollView setFrame:CGRectMake(0, orginY, self.frame.size.width, self.frame.size.height -orginY)];
    [_navView setFrame:CGRectMake(0, 0, self.frame.size.width, 36)];
    [_navView setHidden:hideNav];
}
- (void)creatScrollView
{
    CGFloat w = self.frame.size.width;
    CGFloat h =self.frame.size.height - 36;
    //设置scrollview
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 36, w, h)];
    _scrollView.backgroundColor = self.backgroundColor;
    _scrollView.contentSize = CGSizeMake(self.viewArray.count*w, 0);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    [_scrollView setScrollsToTop:NO];
    [_scrollView.layer setMasksToBounds:NO];
    _scrollView.delegate = self;
    for (int i = 0; i<self.viewArray.count; i++) {
        [[self.viewArray objectAtIndex:i] setFrame:CGRectMake(i*w, 0, w, h)];
        [_scrollView addSubview:[self.viewArray objectAtIndex:i]];
    }
    [self addSubview:_scrollView];
    
}

//滑动标题点击事件代理
- (void)navViewButtonClick:(NSInteger)tag
{
    //    NSLog(@"点击了第%ld个按钮",tag-100);
    CGPoint contentOffset = self.scrollView.contentOffset;
    [self.scrollView setContentOffset:CGPointMake((tag -100)*self.frame.size.width, contentOffset.y ) animated:NO];
    NSInteger orignX = self.scrollView.contentOffset.x/self.scrollView.frame.size.width;
    [self.delegate changeViewWith:orignX];
}



#pragma mark scrollViewDelegate
//滚动时
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_navView PageScrollViewDidScroll:scrollView];
    
}
//停止滚动后
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [_navView PageScrollViewDidEndDecelerating:scrollView];
    NSInteger orignX = scrollView.contentOffset.x/scrollView.frame.size.width;
    [self.delegate changeViewWith:orignX];
}
@end
