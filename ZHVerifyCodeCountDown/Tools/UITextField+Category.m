//
//  UITextField+Category.m
//  FoodTraceabilityProject
//
//  Created by 曾浩 on 2017/5/22.
//  Copyright © 2017年 曾浩. All rights reserved.
//

#import "UITextField+Category.h"

@implementation UITextField (Category)

+ (UITextField *)creatTextFieldWithFontSize:(CGFloat)size
                                placeholder:(NSString *)placeholder
                               keyboardType:(UIKeyboardType)keyboardType
                              returnKeyType:(UIReturnKeyType)returnKeyType
                            secureTextEntry:(BOOL)secureTextEntry
                            clearButtonMode:(UITextFieldViewMode)clearButtonMode
                                     //action:(SEL)action

{
    UITextField * textField = [[UITextField alloc] init];
    textField.keyboardType    = keyboardType;
    textField.returnKeyType   = returnKeyType;
    textField.font            = [UIFont systemFontOfSize:size];
    textField.placeholder     = placeholder;
    textField.clearButtonMode = clearButtonMode;
    textField.secureTextEntry = secureTextEntry;
//    [textField addTarget:self action:action forControlEvents:UIControlEventEditingChanged];
    return textField;
}

@end
