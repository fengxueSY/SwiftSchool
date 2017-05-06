//
//  PHSetButtonRightImage.m
//  PresidentHelper
//
//  Created by 666GPS on 2017/2/22.
//  Copyright © 2017年 张俊辉. All rights reserved.
//

#import "PHSetButtonRightImage.h"

@implementation PHSetButtonRightImage

- (void)layoutSubviews {
    [super layoutSubviews];
    // 设置图片在文字的右边
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, - self.imageView.image.size.width, 0, self.imageView.image.size.width)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleLabel.bounds.size.width + 10, 0, - self.titleLabel.bounds.size.width)];
}

@end
