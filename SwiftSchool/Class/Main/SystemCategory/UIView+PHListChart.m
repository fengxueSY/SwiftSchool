//
//  UIView+PHListChart.m
//  PresidentHelper
//
//  Created by 叶杨 on 2017/2/25.
//  Copyright © 2017年 张俊辉. All rights reserved.
//

#import "UIView+PHListChart.h"

#define ListWidth   80 
#define ListHeight  50
#define HeaderHeight 40
@implementation UIView (PHListChart)

+ (UIView *)viewWithBorder:(BOOL)b andLableNumers:(NSInteger)num{
    
    UIView *view = [[self alloc] initWithFrame:CGRectMake(0, 0, ListWidth *(num -1) + 2 *ListWidth, ListHeight)];
    for (int i = 0; i < num; i++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(ListWidth * i, 0, ListWidth, ListHeight)];
        label.tag = i;
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        if (b) {
        
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(ListWidth*(i + 1) - 1 ,0, 1, ListHeight)];
            line.backgroundColor = [UIColor lightGrayColor];
            [view addSubview:line];
            
            UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(ListWidth * i, ListHeight - 1, ListWidth, 1)];
            bottomLine.backgroundColor = [UIColor lightGrayColor];
            [view addSubview:bottomLine];
        }
    }
    return view;
}


+ (UIView *)viewWithBorder:(BOOL)b andLableWidths:(NSArray *)array{
    
    CGFloat totalWidth = 0.0;
    //1,根据宽度数组算总的宽度
    for (NSNumber *num in array) {
        
        totalWidth += [num floatValue];
    }
    UIView *view = [[self alloc] initWithFrame:CGRectMake(0, 0, totalWidth,(b ? ListHeight : HeaderHeight))];
    
    //2,记录每次的宽度值，用来计算内部label的frame
    CGFloat tempWidth = 0.0;
    
    for (int i = 0; i < array.count; i++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(tempWidth, 0, [array[i] floatValue], (b ? ListHeight : HeaderHeight))];
    
        label.numberOfLines = 0;
        tempWidth = tempWidth + [array[i] floatValue];
        label.tag = i;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = UIColorFromRGB(0x333333);
        [view addSubview:label];
        if (b) {
            
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(tempWidth - 1 ,0, 1, (b ? ListHeight : HeaderHeight))];
            line.backgroundColor = [UIColor lightGrayColor];
            line.tag = -i - 1;
            [view addSubview:line];
            
            UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(tempWidth - [array[i] floatValue], (b ? ListHeight : HeaderHeight) - 1, [array[i] floatValue], 1)];
            bottomLine.backgroundColor = [UIColor lightGrayColor];
            bottomLine.tag = -i - 1000;
            [view addSubview:bottomLine];
        }
    }
    
    return view;
}


@end
