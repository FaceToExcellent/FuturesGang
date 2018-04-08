//
//  ColorButton.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/8.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "ColorButton.h"

@implementation ColorButton




-(instancetype)init
{
    if (self = [super init]) {
        
        [self makeUI];
    }
    
    return self;
}

-(void)makeUI{
    
    if ([self.stateString isEqualToString:@"1"] ) {
        
        self.backgroundColor = APP_RED;
    }else if ( [self.stateString isEqualToString:@"2"]){
         self.backgroundColor = APP_Gray;
        
    }else if ( [self.stateString isEqualToString:@"2"]){
         self.backgroundColor = APP_Green;
    }
    
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.titleLabel  sizeToFit];
     self.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:3.0];
    
}




@end
