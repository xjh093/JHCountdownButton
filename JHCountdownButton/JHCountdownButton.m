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
@end

@implementation JHCountdownButton

- (void)setCountdownNumber:(NSUInteger)countdownNumber{
    _count = _initCount =_countdownNumber = countdownNumber;
    [self setTitle:_countdownFinishTitle?:@"重新发送" forState:0];
}

- (void)setCountdownFinishTitle:(NSString *)countdownFinishTitle{
    _countdownFinishTitle = countdownFinishTitle;
    [self setTitle:_countdownFinishTitle?:@"重新发送" forState:0];
}

- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(jh_coundDown) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)jh_setTitle
{
    NSString *title = [NSString stringWithFormat:@"%@%@%@",_prefixTitle?:@"",@(_count),_subfixTitle?:@""];
    [self setTitle:title forState:0];
}

- (void)jh_coundDown
{
    _count--;
    if (_count > 0) {
        [self jh_setTitle];
    }else{
        [self invalidateTimer];
        self.userInteractionEnabled = YES;
        [self setTitle:_countdownFinishTitle?:@"重新发送" forState:0];
    }
}

- (void)fireTimer{
    if (_count == 0) {
        return;
    }
    [self jh_setTitle];
    self.userInteractionEnabled = NO;
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)reFireTimer{
    _count = _initCount;
    [self fireTimer];
}

- (void)invalidateTimer{
    [_timer invalidate];
    _timer = nil;
}

@end
