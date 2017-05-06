//
//  NSDate+PHPreDate.h
//  PresidentHelper
//
//  Created by 叶杨 on 2017/2/23.
//  Copyright © 2017年 张俊辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (PHPreDate)
/**
 得到当前日期之前的几天的日期
 
 @param days 前几天
 @return 返回前几天的日期
 */
+ (id)getCurrentDayBefore:(NSInteger)days;

@end
