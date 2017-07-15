//
//  ZHTools.h
//  FoodTraceabilityProject
//
//  Created by 曾浩 on 2017/5/25.
//  Copyright © 2017年 曾浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZHTools : NSObject

+ (NSInteger)OSVersion;

/**
 获取当前app版本号
 
 @return return value
 */
+ (NSString *)getCurrentAppVerison;

/**
 获取当前app--build版本号
 
 @return return value
 */
+ (NSString *)getCurrentAppBuildVersion;

/**
 是否存在路径文件
 
 @param path path
 @return return value
 */
+ (BOOL)fileExistsAtPath:(NSString *)path;

/**
 删除径路下文件
 
 @param path path
 @return return value
 */
+ (BOOL)deleteFileAtPath:(NSString *)path;

/**
 获取字符串size
 
 @param text 文字
 @param size 限制大小
 @param font 字体大小
 @return return size
 */
+ (CGSize)getStringSizeWithText:(NSString *)text limitSize:(CGSize)size textFont:(CGFloat)font;

/**
 验证电话号码是否合法
 
 @param str str
 @return return value
 */
+ (BOOL)checkTel:(NSString *)str;

/**
 改变手机号显示 138****8888
 
 @param phone phone
 @return return value
 */
+ (NSString *)makePhoneNumberMagic:(NSString *)phone;

/**
 验证邮箱地址
 
 @param email email
 @return return value
 */
+ (BOOL)validateEmail:(NSString *)email;

/**
 验证身份证
 
 @param identityCard identityCard
 @return return value
 */
+ (BOOL)validateIdentityCard:(NSString *)identityCard;

/**
 是否是空字符串
 
 @param string string
 @return return value
 */
+ (BOOL)checkEmptyText:(NSString *)string;

/**
 验证字符串是否为nil、@“”、NULL
 
 @param string string
 @return return value
 */
+ (BOOL)isBlankString:(NSString *)string;

@end
