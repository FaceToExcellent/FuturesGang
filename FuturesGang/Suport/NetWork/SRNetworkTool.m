//
//  SRNetworkTool.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/8.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "SRNetworkTool.h"
#import "SocketRocketUtility.h"


@implementation SRNetworkTool


- (instancetype)init
{
    self = [super init];
    if (self) {
       
    }
    
    return  self;
    
}

+(void)getSRMessageWithUrl:(NSString*)url success:(void (^)(id dict))success fail:(void (^)(NSError *error))fail{
    
    
    SRNetworkTool * NetworkTool =[[SRNetworkTool alloc]init];
    
    [NetworkTool SRInitWithUrl:url];
    
    if (NetworkTool.message.length >0) {
        success(NetworkTool.message);
    }
    
    if (NetworkTool.SRNetworkToolerror) {
        fail(NetworkTool.SRNetworkToolerror);
    }
    

}

-(void)SRInitWithUrl:(NSString *)url{
    
    [[SocketRocketUtility instance] SRWebSocketOpenWithURLString:url];
    self.SRNetworkToolerror = [[SocketRocketUtility instance]returnError];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SRWebSocketDidOpen) name:kWebSocketDidOpenNote object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SRWebSocketDidReceiveMsg:) name:kWebSocketDidCloseNote object:nil];
    
    
}

-(void)SRClose{
     [[SocketRocketUtility instance] SRWebSocketClose]; //在需要得地方 关闭socket
}

- (void)SRWebSocketDidOpen {
    NSLog(@"开启成功");
    //在成功后需要做的操作。。。
    
}

- (void)SRWebSocketDidReceiveMsg:(NSNotification *)note {
    //收到服务端发送过来的消息
    NSString * message = note.object;
    NSLog(@"%@",message);
    self.message = message;
   
}




@end
