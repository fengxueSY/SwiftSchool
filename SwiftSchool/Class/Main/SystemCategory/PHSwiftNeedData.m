//
//  PHSwiftNeedData.m
//  PresidentHelper
//
//  Created by 666GPS on 2017/3/27.
//  Copyright © 2017年 张俊辉. All rights reserved.
//

#import "PHSwiftNeedData.h"
#import "UIImageView+WebCache.h"

@implementation PHSwiftNeedData
+(NSString *)getCache{
    float c = [[SDImageCache sharedImageCache] getSize];
    NSString * cache = [NSString stringWithFormat:@"%.2fM",c / 1024 / 1024];
    return cache;
}
+(void)cleanCacheSuccess:(void (^)(id))seccess Fail:(void (^)(id))fail{
    [[SDImageCache sharedImageCache]clearDiskOnCompletion:^{
        seccess(@"成功");
    }];
}
@end
