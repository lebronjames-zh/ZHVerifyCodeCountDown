//
//  UIButton+Category.m
//  ShengXianSearch
//
//  Created by 曾浩 on 2017/1/17.
//  Copyright © 2017年 曾浩. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)

+ (UIButton *)creatButtonWithImageName:(NSString *)imageName
{
    UIButton * button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    return button;
}

+ (UIButton *)creatButtonWithImageName:(NSString *)imageName
                                 title:(NSString *)title
                            titleColor:(UIColor *)titleColor
                              fontSize:(CGFloat)fontSize
{
    UIButton * button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    return button;
}


+ (UIButton *)creatButtonWithTitle:(NSString *)title
                   backgroundColor:(UIColor *)backgroundColor
                        titleColor:(UIColor *)titleColor
                          fontSize:(CGFloat)fontSize
{
    UIColor *backColor = [UIColor whiteColor];
    if (backgroundColor) backColor = backgroundColor;
    
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    button.backgroundColor = backColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    return button;
}

/**
 发送验证码GCD实现
 
 @param time 起始时间
 @param countDownTitle 计时显示title
 */
- (void)startTime:(NSInteger)time countDownTitle:(NSString *)countDownTitle;
{
    __block NSInteger timeout = time; // 倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); // 每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0) { // 倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                // 设置界面的按钮显示
                [self setTitle:@"获取验证码" forState:UIControlStateNormal];
                [self setTitleColor:COLOR_GREEN forState:UIControlStateNormal];
                self.enabled = YES;
                self.layer.borderColor = COLOR_GREEN.CGColor;
            });
        } else {
            NSInteger seconds = timeout;
            NSString *strTime = [NSString stringWithFormat:@"%2ld", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:@"%@ %@s",countDownTitle,strTime] forState:UIControlStateNormal];
                self.enabled = NO;
                [self setTitleColor:Color_Assist_one forState:UIControlStateNormal];
                self.layer.borderColor = Color_Assist_one.CGColor;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

@end
