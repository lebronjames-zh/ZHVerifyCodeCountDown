//
//  ViewController.m
//  ZHVerifyCodeCountDown
//
//  Created by 曾浩 on 2017/7/15.
//  Copyright © 2017年 曾浩. All rights reserved.
//



#import "ViewController.h"
#import "ZHTools.h"
#import "SDAutoLayout.h"
#import "UILabel+Category.h"
#import "UIButton+Category.h"
#import "UITextField+Category.h"
#import "ZHVerifyCodeCountDown.pch"

@interface ViewController ()

@property (nonatomic, strong) UITextField *verifyCode;
@property (nonatomic, strong) UIButton *codeBtn;
@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"GCD实现验证码倒计时";
    [self setupView];
}

/**
 页面布局
 */
- (void)setupView
{
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:229.0/255.0 blue:230.0/255.0 alpha:1.0];
    
    [self.view addSubview:header];
    header.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(self.view, 64)
    .heightRatioToView(self.view, 1);
    
    NSString *phoneNumber = [ZHTools makePhoneNumberMagic:@"13888888888"];
    UILabel *phone = [UILabel createLabelWithTitle:[NSString stringWithFormat:@"您的手机号：%@",phoneNumber] textColor:[UIColor lightGrayColor] fontSize:14];
    
    UIView *whiteView = [[UIView alloc] init];
    whiteView.backgroundColor = [UIColor whiteColor];
    
    [header sd_addSubviews:@[phone,
                             whiteView,
                             self.verifyCode,
                             self.codeBtn,
                             self.nextButton]];
    phone.sd_layout
    .leftSpaceToView(header, width(15))
    .topSpaceToView(header, 0)
    .heightIs(44);
    [phone setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH - 50];
    
    whiteView.sd_layout
    .leftEqualToView(header)
    .topSpaceToView(phone, 0)
    .rightEqualToView(header)
    .heightIs(44);
    
    self.verifyCode.sd_layout
    .topEqualToView(whiteView)
    .leftSpaceToView(header, width(15))
    .widthIs(SCREEN_WIDTH/2)
    .heightIs(44);
    
    self.codeBtn.sd_layout
    .rightSpaceToView(header, width(20))
    .centerYEqualToView(whiteView)
    .widthIs(width(78))
    .heightIs(30);
    
    self.nextButton.sd_layout
    .topSpaceToView(whiteView,height(30))
    .leftSpaceToView(header, width(15))
    .rightSpaceToView(header, width(15))
    .heightIs(42);
    
}

#pragma mark -- 内部方法

/**
 下一步
 */
- (void)nextStep
{
}

/**
 获取验证码
 */
- (void)sendCodeClicked:(UIButton *)button
{
    [self.view endEditing:YES];
    [button startTime:60 countDownTitle:@"重新获取"];
}

/**
 请求获取验证码
 */
- (void)requestMessageCode
{
    
}

#pragma mark -- UITextfieldDelegate

- (void)textfieldDidChanged:(UITextField *)textField
{
    int maxLength = 0;
    
    if ([textField isEqual:self.verifyCode])
    {
        maxLength = 8;
    }
    
    if (textField.text.length >= maxLength)
    {
        textField.text = [textField.text substringToIndex:maxLength];
    }
    
    // 1. 判断是否可以进行下一步
    [self judgementIfCanNextStep];
}

/**
 判断是否可以进行下一步
 */
- (void)judgementIfCanNextStep
{
    if ([ZHTools isBlankString:self.verifyCode.text])
    {
        self.nextButton.userInteractionEnabled = NO;
        self.nextButton.backgroundColor = COLOR_DEFAULT;
    }
    else
    {
        self.nextButton.userInteractionEnabled = YES;
        self.nextButton.backgroundColor = COLOR_GREEN;
    }
}


#pragma mark -- 懒加载

- (UIButton *)nextButton
{
    if (!_nextButton) {
        _nextButton = [UIButton creatButtonWithTitle:@"下一步" backgroundColor:COLOR_DEFAULT titleColor:[UIColor whiteColor] fontSize:16];
        _nextButton.layer.cornerRadius  = 5;
        _nextButton.layer.masksToBounds = YES;
        _nextButton.userInteractionEnabled = NO;
        [_nextButton addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}

- (UITextField *)verifyCode
{
    if (!_verifyCode) {
        _verifyCode = [UITextField creatTextFieldWithFontSize:width(17) placeholder:@"请输入验证码" keyboardType:UIKeyboardTypeASCIICapableNumberPad returnKeyType:UIReturnKeyDone secureTextEntry:NO clearButtonMode:UITextFieldViewModeNever];
        [_verifyCode addTarget:self action:@selector(textfieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
        
    }
    return _verifyCode;
}

- (UIButton *)codeBtn
{
    if (!_codeBtn) {
        _codeBtn = [UIButton creatButtonWithTitle:@"获取验证码" backgroundColor:[UIColor whiteColor] titleColor:COLOR_GREEN fontSize:width(11)];
        _codeBtn.layer.cornerRadius = 4;
        //        _codeBtn.layer.borderColor  = COLOR(181, 181, 181).CGColor;
        _codeBtn.layer.borderWidth  = 1;
        _codeBtn.layer.borderColor  = COLOR_GREEN.CGColor;
        [_codeBtn addTarget:self action:@selector(sendCodeClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeBtn;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
