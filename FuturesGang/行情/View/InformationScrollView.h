//
//  InformationScrollView.h
//  xbiao
//
//  Created by zhuangzhe on 15/7/15.
//  Copyright (c) 2015年 腕表之家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InformationNavView.h"

@protocol InfoScrollViewDelegate

- (void) setViewsDataSource;
- (void) changeViewWith:(NSInteger)tag;
@end

@interface InformationScrollView : UIView<UIScrollViewDelegate,NavViewDelegate>

@property (nonatomic,strong)InformationNavView *navView;
@property (nonatomic,weak)id <InfoScrollViewDelegate>delegate;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong)NSMutableArray *viewArray;
@property (nonatomic,strong)NSArray *naviArray;

- (void)loadView;
- (void)setInfoViewFrame:(CGRect)frame hiddenNavView:(BOOL)hideNav;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;

@end
