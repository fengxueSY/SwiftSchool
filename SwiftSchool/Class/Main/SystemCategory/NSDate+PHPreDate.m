//
//  NSDate+PHPreDate.m
//  PresidentHelper
//
//  Created by 叶杨 on 2017/2/23.
//  Copyright © 2017年 张俊辉. All rights reserved.
//

#import "NSDate+PHPreDate.h"

@implementation NSDate (PHPreDate)

+ (id)getCurrentDayBefore:(NSInteger)days{
    
    
    NSDate*nowDate = [NSDate date];
    NSDate* theDate;
    NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
    //之后的天数
    theDate = [nowDate initWithTimeIntervalSinceNow: days * oneDay ];
    //之前的天数
    theDate = [nowDate initWithTimeIntervalSinceNow: -days * oneDay ];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //用[NSDate date]可以获取系统当前时间
    NSString * currentDateStr = [dateFormatter stringFromDate:theDate];
    NSLog(@"%@",currentDateStr);
    
    return currentDateStr;
}

@end
