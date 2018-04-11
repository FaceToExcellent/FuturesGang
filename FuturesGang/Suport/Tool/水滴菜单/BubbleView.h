//
//  BubbleView.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/10.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BubbleViewDelegate <NSObject>

-(void)BubbleViewDelegatePushWithTag:(NSInteger)tag ;
@end


@interface BubbleView : UIImageView
@property(nonatomic,weak)id <BubbleViewDelegate>delegate;
@end
