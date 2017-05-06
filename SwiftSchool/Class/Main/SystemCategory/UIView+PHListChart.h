//
//  UIView+PHListChart.h
//  PresidentHelper
//
//  Created by 叶杨 on 2017/2/25.
//  Copyright © 2017年 张俊辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PHListChart)

+ (UIView *)viewWithBorder:(BOOL)b andLableNumers:(NSInteger)num;


/**
 根据数组的个数以及宽度来创建view内部的label

 @param b 是否带边框label
 @param array 宽度数组
 @return 返回自定义的view
 */
+ (UIView *)viewWithBorder:(BOOL)b andLableWidths:(NSArray *)array;
@end
