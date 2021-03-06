//
//  JHCountdownButton.h
//  JHKit
//
//  Created by HaoCold on 2018/4/18.
//  Copyright © 2018年 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2018 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import <UIKit/UIKit.h>

@interface JHCountdownButton : UIButton
/// Prefix.
@property (nonatomic,    copy) NSString *prefixTitle;
/// Countdown number.
@property (nonatomic,  assign) NSUInteger countdownNumber;
/// Subfix.
@property (nonatomic,    copy) NSString *subfixTitle;
/// Default is 'blackColor'
@property (nonatomic,  strong) UIColor *countdownTitleColor;
/// Default is nil.
@property (nonatomic,  strong) UIColor *countdownBackgroundColor;
/// Default is '获取验证码'
@property (nonatomic,    copy) NSString *defaultTitle;
/// Default is 'blackColor'
@property (nonatomic,  strong) UIColor *defaultTitleColor;
/// Default is ‘重新发送’.
@property (nonatomic,    copy) NSString *countdownFinishTitle;
/// Default is 'blackColor'
@property (nonatomic,  strong) UIColor *countdownFinishTitleColor;

- (void)fireTimer;
- (void)reFireTimer;

@end
