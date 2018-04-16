//
//  URLSets.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/16.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#ifndef URLSets_h
#define URLSets_h


//主地址
#define MainUrl   @"http://www.deloittechinatmt.com/index"



//完整的URL1
#define ADDRESS_IP1(Url)              \
[NSString stringWithFormat:@"%@%@",MainUrl,Url]

//登录 参数:手机号 phone 密码:password   方式 post
#define URL_loginuser   ADDRESS_IP1(@"/Register/loginuser")

//注册 传入参数:手机号 phone 密码:password 短信验证码：messagecode 推广码：code 方式 post
#define URL_addUser   ADDRESS_IP1(@"/Register/addUser")

//获取验证码  传入参数:手机号 phone 方式 post
#define  URL_smsverify   ADDRESS_IP1(@"/Register/smsverify")



#endif /* URLSets_h */
