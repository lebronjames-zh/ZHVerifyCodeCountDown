//
//  UITextField+Category.h
//  FoodTraceabilityProject
//
//  Created by 曾浩 on 2017/5/22.
//  Copyright © 2017年 曾浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Category)

+ (UITextField *)creatTextFieldWithFontSize:(CGFloat)size
                                placeholder:(NSString *)placeholder
                               keyboardType:(UIKeyboardType)keyboardType
                              returnKeyType:(UIReturnKeyType)returnKeyType
                            secureTextEntry:(BOOL)secureTextEntry
                            clearButtonMode:(UITextFieldViewMode)clearButtonMode;

@end
