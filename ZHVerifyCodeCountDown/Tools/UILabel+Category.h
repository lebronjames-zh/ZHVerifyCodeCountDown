//
//  UILabel+Category.h
//  ShengXianSearch
//
//  Created by 曾浩 on 2017/1/19.
//  Copyright © 2017年 曾浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

/**
 创建一个label

 @param title 文字
 @param textColor 文字颜色
 @param fontSize 文字大小
 @return UILabel
 */
+ (UILabel *)createLabelWithTitle:(NSString *)title
                        textColor:(UIColor *)textColor
                         fontSize:(CGFloat )fontSize;

+ (UILabel *)createLabelWithTitle:(NSString *)title
                        textColor:(UIColor *)textColor
                         fontSize:(CGFloat )fontSize
                     cornerRadius:(CGFloat )cornerRadius
                      borderColor:(UIColor *)borderColor
                      borderWidth:(CGFloat )borderWidth;
@end
