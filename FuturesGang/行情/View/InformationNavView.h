//
//  InformationNavView.h
//  xbiao
//
//  Created by zhuangzhe on 15/6/3.
//  Copyright (c) 2015年 腕表之家. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NavViewDelegate;
@interface InformationNavView : UIView<UIScrollViewDelegate>

@property(nonatomic, weak) id<NavViewDelegate>delegate;

@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) UIView *leftLayerView;
@property(nonatomic,strong) UIView *rightLayerView;
@property(nonatomic,strong) UIView *navFootView;

- (id)initWithFrame:(CGRect)frame andNaviArr:(NSArray *)naviArr;
- (void)setAnimation:(UIView *)view;
- (void) setBtnTitleFont;
- (void)PageScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)PageScrollViewDidEndDecelerating:(UIScrollView *)scrollView;
@end
@protocol NavViewDelegate<NSObject>

@required

- (void)navViewButtonClick:(NSInteger)tag;

@optional
@end