# JHCountdownButton
A button for countdown
- 倒计时按钮

---

# What
![image](https://github.com/xjh093/JHCountdownButton/blob/master/img/01.png)

![image](https://github.com/xjh093/JHCountdownButton/blob/master/img/02.png)

---

# Logs

### 3.add property 'countdownBackgroundColor'.(2018-7-5)

### 2.update. (2018-5-8)

### 1.upload. (2018-4-19)

.h
```
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

```


