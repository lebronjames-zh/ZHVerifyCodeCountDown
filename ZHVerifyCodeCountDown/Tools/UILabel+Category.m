//
//  UILabel+Category.m
//  ShengXianSearch
//
//  Created by 曾浩 on 2017/1/19.
//  Copyright © 2017年 曾浩. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

/**
 创建一个label
 
 @param title 文字
 @param textColor 文字颜色
 @param fontSize 文字大小
 @return UILabel
 */
+ (UILabel *)createLabelWithTitle:(NSString *)title
                        textColor:(UIColor *)textColor
                         fontSize:(CGFloat )fontSize
{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = textColor;
    label.font = FONT(fontSize);
    
    return label;
}

+ (UILabel *)createLabelWithTitle:(NSString *)title
                        textColor:(UIColor *)textColor
                         fontSize:(CGFloat )fontSize
                     cornerRadius:(CGFloat )cornerRadius
                      borderColor:(UIColor *)borderColor
                      borderWidth:(CGFloat )borderWidth


{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = textColor;
    label.font = FONT(fontSize);
    label.layer.cornerRadius  = cornerRadius;
    label.layer.masksToBounds = YES;
    label.layer.borderColor = borderColor.CGColor;
    label.layer.borderWidth = borderWidth;
    return label;
}

@end
