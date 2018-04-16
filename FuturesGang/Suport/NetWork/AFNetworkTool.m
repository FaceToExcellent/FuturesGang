//
//  AFNetworkTool.m
//  xbiao
//
//  Created by zhuangzhe on 15/5/29.
//  Copyright (c) 2015年 腕表之家. All rights reserved.
//

#import "AFNetworkTool.h"
#import "AFAppDotNetAPIClient.h"

#include <sys/sysctl.h>
#include <sys/types.h>
@implementation AFNetworkTool

#pragma mark 检测网路状态
+ (void)netWorkStatus
{

    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSString *netWorkStatus;
        switch (status) {
            case -1:
                netWorkStatus = @"未知网络";
                break;
            case 0:
                netWorkStatus = @"没有网络";
                break;
            case 1:
                netWorkStatus = @"2g/3g/4g网络";
                break;
            case 2:
                netWorkStatus = @"WiFi网络";
                break;
            default:
                break;
        }
        NSLog(@"网络状态:%@", netWorkStatus);
        //存储状态
        NSUserDefaults *def =[NSUserDefaults standardUserDefaults];
        [def setObject:netWorkStatus forKey:@"netWorkStatus"];
        [def synchronize];
    }];
}
+ (BOOL)isWifi
{
    BOOL isWifi= NO;
    NSUserDefaults *def =[NSUserDefaults standardUserDefaults];
    NSString *netWorkStatus = [def objectForKey:@"netWorkStatus"];
    if (![netWorkStatus isEqualToString:@"WiFi网络"]) {
        isWifi = NO;
        
    }else
    {
        isWifi = YES;
    }
    return isWifi;
}
+ (NSString *)getHdUrl:(NSString *)url
{
    NSString *hdUrl;
    NSUserDefaults *def =[NSUserDefaults standardUserDefaults];
    NSString *picQuality = [def objectForKey:@"picQuality"];
    switch ([picQuality integerValue]) {
        case 0://自动
        {
            NSString *netWorkStatus = [def objectForKey:@"netWorkStatus"];
            if (![netWorkStatus isEqualToString:@"WiFi网络"]) {
                hdUrl = [url stringByAppendingString:@"/is_hd/0"];
               
            }else
            {
                hdUrl = [url stringByAppendingString:@"/is_hd/1"];
            }
        }
            break;
        case 1://高质量
        {
            hdUrl = [url stringByAppendingString:@"/is_hd/1"];
        }
            break;
        case 2://低质量
        {
            hdUrl = [url stringByAppendingString:@"/is_hd/0"];
        }
            break;
        default:
            break;
    }
    
    return hdUrl;
}

+ (NSString *)getDevicePlatform
{
    int mib[2];
    size_t len;
    char *machine;
    
    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    return platform;
}
+ (void)getDeviceTypeAndScreenSize
{
    //设备代号
    NSString *platform = [self getDevicePlatform];
    platform = [platform stringByReplacingOccurrencesOfString:@"," withString:@"_"];
    platform = [platform stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    //分辨率
    CGFloat scale_screen = [UIScreen mainScreen].scale;

    
    NSString *deviceType;
    NSString *screenSize;
    
    deviceType = platform;
    screenSize = [NSString stringWithFormat:@"%.0f_%.0f",width*scale_screen,height*scale_screen];
    
    NSUserDefaults *def =[NSUserDefaults standardUserDefaults];
    [def setObject:deviceType forKey:@"DeviceType"];
    [def setObject:screenSize forKey:@"ScreenSize"];
    [def synchronize];
}
+ (float)getIOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

#pragma mark - JSON加密字符串方式获取数据

+ (void) getStringDataWithUrl:(NSString *)url   success:(void (^)(id dict))success fail:(void (^)(NSError *error))fail
{
    //[self checkPublicKeyCookie];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    //
    [[AFAppDotNetAPIClient sharedClient] GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//        NSLog(@"%@",responseObject);
        NSString *dataStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSString *json;
        json =  dataStr;
        NSData* data=[json dataUsingEncoding:NSUTF8StringEncoding];
        if (data) {
            id dict=[NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            if ([dict isKindOfClass:[NSDictionary class]]) {
                success(dict);
            }
            else
            {
//
            }
        }
        else
        {
          
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

        fail(error);
    }];
}

#pragma mark - JSON方式post提交数据


+ (void)postJSONWithUrl:(NSString *)urlStr  parameters:(NSDictionary*)parameters images:(NSMutableArray*)imageArray imageKey:(NSString *)imageKey success:(void (^)(id dict))success fail:(void (^)(NSError *error))fail
{
   // [self checkPublicKeyCookie];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    if (![parameters isKindOfClass:[NSDictionary class]]) {
        NSLog(@"异常");
    }

    [[AFAppDotNetAPIClient sharedClient] POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //
        if (imageArray.count >0) {
            for (NSDictionary *dict in imageArray) {
                NSData *imageData = (NSData *)[dict objectForKey:@"image"];
                NSString *imageName = [dict objectForKey:@"imageName"];
                NSString *imageKeyW = imageKey;
                if (!imageKeyW) {
                    imageKeyW = @"pic[]";
                }
                if (imageData) {
                    [formData appendPartWithFileData:imageData name:imageKeyW fileName:[NSString stringWithFormat:@"%@",imageName] mimeType:@""];
                }
            }
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        //        NSLog(@"%@",responseObject);
        NSString *dataStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSString *json;
        json = dataStr;
        NSData* data=[json dataUsingEncoding:NSUTF8StringEncoding];
        if (data) {
            id dict=[NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            if ([dict isKindOfClass:[NSDictionary class]]) {
                success(dict);
            }
            else
            {
                fail(nil);
            }
        }
        else
        {
            fail (nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        fail(error);
    }];
    
}

+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}




@end
