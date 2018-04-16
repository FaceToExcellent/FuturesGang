//
//  AFNetworkTool.h
//  xbiao
//
//  Created by zhuangzhe on 15/5/29.
//  Copyright (c) 2015年 腕表之家. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import "AFNetworking.h"

@interface AFNetworkTool : NSObject

/**检测网路状态**/
+ (void)netWorkStatus;
/**
 *  获取是否高清图的地址
 *
 *  @param url    待处理的URL
 *
 *  @return nil
 */
+ (NSString *)getHdUrl:(NSString *)url;
/**网络类型*/
+ (BOOL)isWifi;
/**获取设备参数*/
+ (void)getDeviceTypeAndScreenSize;
/**获取系统版本*/
+ (float)getIOSVersion;
/**获取设备型号*/
+ (NSString *)getDevicePlatform;


//get
+ (void) getStringDataWithUrl:(NSString *)url   success:(void (^)(id dict))success fail:(void (^)(NSError *error))fail;
//post 
+ (void)postJSONWithUrl:(NSString *)urlStr  parameters:(NSDictionary*)parameters images:(NSMutableArray*)imageArray imageKey:(NSString *)imageKey success:(void (^)(id dict))success fail:(void (^)(NSError *error))fail;


+ (NSString*)dictionaryToJson:(NSDictionary *)dic;



@end
