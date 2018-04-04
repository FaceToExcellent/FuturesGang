//
//  MycenterHeadView.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/3.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MycenterHeadViewDelegate <NSObject>

-(void)czButtonpushToDetail;
-(void)txButtonpushToDetail;
@end



@interface MycenterHeadView : UIView
@property(nonatomic,strong)UILabel * zjlabel;
@property(nonatomic,strong)UILabel * rzjLabel;
@property(nonatomic,strong)UIButton * czButton;
@property(nonatomic,strong)UIButton * txButton;

@property(nonatomic,weak) id<MycenterHeadViewDelegate> delegate;
@end
