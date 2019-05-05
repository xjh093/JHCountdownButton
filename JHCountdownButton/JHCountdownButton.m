//
//  JHCountdownButton.m
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

#import "JHCountdownButton.h"

@interface JHCountdownButton()
@property (nonatomic,  strong) NSTimer *timer;
@property (nonatomic,  assign) NSUInteger  count;
@property (nonatomic,  assign) NSUInteger  initCount;
@property (nonatomic,  strong) UIColor *normalBackgroundColor;
@end

@implementation JHCountdownButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType{
    JHCountdownButton *button = [super buttonWithType:buttonType];
    [button setup];
    return button;
}

- (void)setup{
    _defaultTitle = @"获取验证码";
    _countdownFinishTitle = @"重新发送";
    _defaultTitleColor = [UIColor blackColor];
    _countdownTitleColor = [UIColor blackColor];
    _countdownFinishTitleColor = [UIColor blackColor];
    if (!self.currentTitle) {
        [self setTitle:_defaultTitle forState:0];
    }
    if (!self.currentTitleColor) {
        [self setTitleColor:_defaultTitleColor forState:0];
    }
}

- (void)setCountdownNumber:(NSUInteger)countdownNumber{
    _count = _initCount =_countdownNumber = countdownNumber;
}

- (void)setCountdownFinishTitle:(NSString *)countdownFinishTitle{
    _countdownFinishTitle = countdownFinishTitle;
}

- (void)setDefaultTitle:(NSString *)defaultTitle{
    _defaultTitle = defaultTitle;
    [self setTitle:_defaultTitle forState:0];
}

- (void)setDefaultTitleColor:(UIColor *)defaultTitleColor{
    _defaultTitleColor = defaultTitleColor;
    [self setTitleColor:_defaultTitleColor forState:0];
}

- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(jh_coundDown) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)jh_setTitle{
    NSString *title = [NSString stringWithFormat:@"%@%@%@",_prefixTitle?:@"",@(_count),_subfixTitle?:@""];
    [self setTitle:title forState:0];
}

- (void)jh_coundDown{
    _count--;
    if (_count > 0) {
        [self jh_setTitle];
    }else{
        _count = _initCount;
        [self invalidateTimer];
        self.userInteractionEnabled = YES;
        [self setTitle:_countdownFinishTitle forState:0];
        [self setTitleColor:_countdownFinishTitleColor forState:0];
        self.backgroundColor = _normalBackgroundColor;
    }
}

- (void)fireTimer{
    if (_count == 0) {
        return;
    }
    [self jh_setTitle];
    self.userInteractionEnabled = NO;
    [self setTitleColor:_countdownTitleColor forState:0];
    if (_countdownBackgroundColor) {
        _normalBackgroundColor = self.backgroundColor;
        self.backgroundColor = _countdownBackgroundColor;
    }
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)reFireTimer{
    _count = _initCount;
    [self invalidateTimer];
    [self fireTimer];
}

- (void)invalidateTimer{
    [_timer invalidate];
    _timer = nil;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    if (!newSuperview) {
        [self invalidateTimer];
    }
}

@end
