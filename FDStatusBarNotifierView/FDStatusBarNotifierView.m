//
//  StatusBarNotifierView.m
//  StatusBarNotifier
//
//  Created by Francesco Di Lorenzo on 05/09/12.
//  Copyright (c) 2012 Francesco Di Lorenzo. All rights reserved.
//

#import "FDStatusBarNotifierView.h"

@interface FDStatusBarNotifierView ()

@property (strong) UILabel *messageLabel;

@end

@implementation FDStatusBarNotifierView

#define kNotifierViewInitialFramePortrait   CGRectMake(0, 20, 320, 20)
#define kNotifierViewFinalFramePortrait     CGRectMake(0, 0, 320, 20)
//#define kNotifierViewInitialFrameLandscape  CGRectMake(0, 20, 480, 20)
//#define kNotifierViewFinalFrameLandscape    CGRectMake(0, 0, 480, 20)

#define kMessageLabelInitialFramePortrait   CGRectMake(10, 0, 300, 20)
#define kMessageLabelInitialFrameLandscape  CGRectMake(10, 0, 460, 20)

- (id)init {
    self = [super init];
    if (self) {
        self.frame = kNotifierViewInitialFramePortrait;
        
        self.messageLabel = [[UILabel alloc] initWithFrame:kMessageLabelInitialFramePortrait];
        self.messageLabel.textColor = [UIColor whiteColor];
        self.messageLabel.backgroundColor = [UIColor blackColor];
        self.messageLabel.textAlignment = UITextAlignmentCenter;
        self.messageLabel.font = [UIFont boldSystemFontOfSize:12];
        [self addSubview:self.messageLabel];
        
        self.timeOnScreen = 2.0;
    }
    return self;
}

- (id)initWithMessage:(NSString *)message {
    self = [super init];
    if (self) {
        self.frame = kNotifierViewInitialFramePortrait;
        self.message = message;
        self.backgroundColor = [UIColor blackColor];
        
        self.messageLabel = [[UILabel alloc] initWithFrame:kMessageLabelInitialFramePortrait];
        self.messageLabel.textColor = [UIColor whiteColor];
        self.messageLabel.text = message;
        self.messageLabel.backgroundColor = [UIColor blackColor];
        self.messageLabel.textAlignment = UITextAlignmentCenter;
        self.messageLabel.font = [UIFont boldSystemFontOfSize:12];
        [self addSubview:self.messageLabel];
        
        self.timeOnScreen = 2.0;
    }
    return self;

}

- (id)initWithMessage:(NSString *)message delegate:(id /*<StatusBarNotifierViewDelegate>*/)delegate {
    self = [super init];
    if (self) {
        self.frame = kNotifierViewInitialFramePortrait;
        self.delegate = delegate;
        self.message = message;
        self.backgroundColor = [UIColor blackColor];
        
        self.messageLabel = [[UILabel alloc] initWithFrame:kMessageLabelInitialFramePortrait];
        self.messageLabel.textColor = [UIColor whiteColor];
        self.messageLabel.text = message;
        self.messageLabel.backgroundColor = [UIColor blackColor];
        self.messageLabel.textAlignment = UITextAlignmentCenter;
        self.messageLabel.font = [UIFont boldSystemFontOfSize:12];
        [self addSubview:self.messageLabel];
        
        self.timeOnScreen = 2.0;
    }
    return self;
}

- (void)showInWindow:(UIWindow *)window {
    if (self.delegate && [self.delegate respondsToSelector:@selector(willPresentNotifierView:)])
        [self.delegate willPresentNotifierView:self];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    [window insertSubview:self atIndex:0];
    //----------------scroll text------------
    CGFloat textWith = [self.message sizeWithFont:self.messageLabel.font
                                constrainedToSize:CGSizeMake(MAXFLOAT, 20)
                                    lineBreakMode:self.messageLabel.lineBreakMode].width;
    if (textWith < kMessageLabelInitialFramePortrait.size.width) {
        [UIView animateWithDuration:.4 animations:^{
            self.frame = kNotifierViewFinalFramePortrait;
        } completion:^(BOOL finished){
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(didPresentNotifierView:)])
                [self.delegate didPresentNotifierView:self];
            
            [NSTimer scheduledTimerWithTimeInterval:self.timeOnScreen target:self selector:@selector(hide) userInfo:nil repeats:NO];
            
        }];
    }else {
        CGRect frame = kMessageLabelInitialFramePortrait;
        CGFloat exceed = textWith - frame.size.width;
        frame.size.width = textWith;
        self.messageLabel.frame = frame;
        NSTimeInterval timeExceed = exceed / 80;
        [UIView animateWithDuration:.4 animations:^{
            self.frame = kNotifierViewFinalFramePortrait;
        } completion:^(BOOL finished){
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(didPresentNotifierView:)])
                [self.delegate didPresentNotifierView:self];
            
            
            [self performSelector:@selector(hide)
                       withObject:nil
                       afterDelay:self.timeOnScreen + timeExceed];
            
            [self performSelector:@selector(doTextScrollAnimation:)
                       withObject:[NSNumber numberWithFloat:timeExceed]
                       afterDelay:self.timeOnScreen / 2];
            
        }];
    }
    //----------------end scroll text--------
    
}

//----------------scroll text------------
- (void)doTextScrollAnimation:(NSNumber*)timeInterval
{
    __block CGRect frame = self.messageLabel.frame;
    [UIView transitionWithView:self.messageLabel
                      duration:timeInterval.floatValue
                       options:UIViewAnimationCurveLinear
                    animations:^{
                        frame.origin.x = kMessageLabelInitialFramePortrait.size.width - frame.size.width + kMessageLabelInitialFramePortrait.origin.x;
                        self.messageLabel.frame = frame;
                    } completion:nil];
}
//----------------end scroll text--------

- (void)hide {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(willHideNotifierView:)])
        [self.delegate willHideNotifierView:self];
    
    [UIView animateWithDuration:.4 animations:^{
        self.frame = kNotifierViewInitialFramePortrait;
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    } completion:^(BOOL finished){
        if (finished) {
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(didHideNotifierView:)])
                [self.delegate didHideNotifierView:self];
            
            [self removeFromSuperview];
        }
    }];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.delegate notifierViewTapped:self];
}

- (void)setMessage:(NSString *)message {
    _message = message;
    self.messageLabel.text = message;
}

@end
