//
//  PHSwiftNeedData.h
//  PresidentHelper
//
//  Created by 666GPS on 2017/3/27.
//  Copyright © 2017年 张俊辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PHSwiftNeedData : NSObject
//获取缓存值
+(NSString *)getCache;
//清理缓存值
+(void)cleanCacheSuccess:(void(^)(id successed))seccess Fail:(void(^)(id failed))fail;
@end
