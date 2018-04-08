//
//  SRNetworkTool.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/8.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRNetworkTool : NSObject

@property(nonatomic,copy)NSString* message;
@property(nonatomic,strong)NSError * SRNetworkToolerror;

-(void)SRInitWithUrl:(NSString *)url;
-(void)SRClose;


+(void)getSRMessageWithUrl:(NSString*)url success:(void (^)(id dict))success fail:(void (^)(NSError *error))fail;



@end
