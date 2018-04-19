# JHCountdownButton
A button for countdown

Logs & 更新日志

1.upload. (2018-4-19)

.h
```
@interface JHCountdownButton : UIButton
/// Prefix.
@property (nonatomic,    copy) NSString *prefixTitle;
/// Countdown number.
@property (nonatomic,  assign) NSUInteger countdownNumber;
/// Subfix.
@property (nonatomic,    copy) NSString *subfixTitle;
/// Defult is ‘重新发送’.
@property (nonatomic,    copy) NSString *countdownFinishTitle;

- (void)fireTimer;
- (void)reFireTimer;
- (void)invalidateTimer;

@end

```

![image](https://github.com/xjh093/JHCountdownButton/blob/master/img/01.png)

![image](https://github.com/xjh093/JHCountdownButton/blob/master/img/02.png)
