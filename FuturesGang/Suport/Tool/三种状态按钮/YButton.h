//
//  YButton.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/13.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Ybuttonstate) {
    YbuttonstateDefult = 0,
    YbuttonstateUpselected = 1,
    YbuttonstateDownselected = 2,

};


@interface YButton : UIButton

@property(nonatomic) Ybuttonstate  Ystate;


-(void)setYstate:(Ybuttonstate )Ystate;
-(void)setYBackimage:(NSString*)image forYstate:(Ybuttonstate)Ystate;
@end
