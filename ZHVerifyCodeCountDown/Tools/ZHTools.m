//
//  ZHTools.m
//  FoodTraceabilityProject
//
//  Created by 曾浩 on 2017/5/25.
//  Copyright © 2017年 曾浩. All rights reserved.
//
//#define Color_Assist_one COLOR_Alpha(181, 181, 181, 1.0)

#import "ZHTools.h"
#import "ZHVerifyCodeCountDown.pch"

@implementation ZHTools

+ (NSInteger)OSVersion
{
    static NSUInteger _deviceSystemMajorVersion = -1;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
    });
    return _deviceSystemMajorVersion;
}

+ (NSString *)getCurrentAppVerison
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)getCurrentAppBuildVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (BOOL)fileExistsAtPath:(NSString *)path
{
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (BOOL)deleteFileAtPath:(NSString *)path
{
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

/**
 获取字符串size
 
 @param text 文字
 @param size 限制大小
 @param font 字体大小
 @return return size
 */
+ (CGSize)getStringSizeWithText:(NSString *)text limitSize:(CGSize)size textFont:(CGFloat)font
{
    return [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: FONT(font)} context:nil].size;
}

+ (BOOL)checkTel:(NSString *)str
{
    //1[0-9]{10}
    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    //    NSString *regex = @"[0-9]{11}";
    //NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSString *regex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    if (!isMatch)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入正确的手机号码" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *certainAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [certainAction setValue:COLOR_GREEN forKey:@"_titleTextColor"];
        [alert addAction:certainAction];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
        return NO;
    }
    return YES;
}

/**
 改变手机号显示 138****8888
 
 @param phone phone
 @return return value
 */
+ (NSString *)makePhoneNumberMagic:(NSString *)phone
{
    if (phone.length != 11) return phone;
    NSString *beginNum = [phone substringToIndex:3];
    NSString *lastNum  = [phone substringFromIndex:7];
    return [NSString stringWithFormat:@"%@****%@",beginNum,lastNum];
}

+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)validateIdentityCard:(NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    //    return [identityCardPredicate evaluateWithObject:identityCard];
    
    BOOL isMatch = [identityCardPredicate evaluateWithObject:identityCard];
    if (!isMatch) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的身份证号码" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        return NO;
    }
    return YES;
}

+ (BOOL)checkEmptyText:(NSString *)string
{
    
    if ([string isEqualToString:@""]) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"不能输入空字符" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        return YES;
        
    }
    return NO;
}

+ (BOOL)isBlankString:(NSString *)string
{
    
    if (string == nil) return YES;
    
    if (string == NULL) return YES;
    
    if ([string isKindOfClass:[NSNull class]]) return YES;
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) return YES;
    return NO;
}

@end
