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

- (id)init {
    self = [super init];
    if (self) {
        if(UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation]) || [[UIDevice currentDevice] orientation] == UIDeviceOrientationUnknown) {
            NSLog(@"Portrait");
            self.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 20);
            self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ([UIScreen mainScreen].bounds.size.width - 20), 20)];
        }
        else {
            NSLog(@"Landscape");
            self.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.height, 20);
            self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ([UIScreen mainScreen].bounds.size.height - 20), 20)];
        }
        self.messageLabel.textColor = [UIColor whiteColor];
        self.messageLabel.backgroundColor = [UIColor blackColor];
        self.messageLabel.textAlignment = UITextAlignmentCenter;
        self.messageLabel.font = [UIFont boldSystemFontOfSize:12];
        self.shouldHideOnTap = NO;
        [self addSubview:self.messageLabel];
        
        self.timeOnScreen = 2.0;
    }
    return self;
}

- (id)initWithMessage:(NSString *)message {
    self = [super init];
    if (self) {
        if(UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation]) || [[UIDevice currentDevice] orientation] == UIDeviceOrientationUnknown) {
            NSLog(@"Portrait");
            self.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 20);
            self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ([UIScreen mainScreen].bounds.size.width - 20), 20)];
        }
        else {
            NSLog(@"Landscape");
            self.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.height, 20);
            self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ([UIScreen mainScreen].bounds.size.height - 20), 20)];
        }
        self.message = message;
        self.backgroundColor = [UIColor blackColor];
        
        self.messageLabel.textColor = [UIColor whiteColor];
        self.messageLabel.text = message;
        self.messageLabel.backgroundColor = [UIColor blackColor];
        self.messageLabel.textAlignment = UITextAlignmentCenter;
        self.messageLabel.font = [UIFont boldSystemFontOfSize:12];
        self.shouldHideOnTap = NO;
        [self addSubview:self.messageLabel];
        
        self.timeOnScreen = 2.0;
    }
    return self;

}

- (id)initWithMessage:(NSString *)message delegate:(id /*<StatusBarNotifierViewDelegate>*/)delegate {
    self = [super init];
    if (self) {
        if(UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation]) || [[UIDevice currentDevice] orientation] == UIDeviceOrientationUnknown) {
            NSLog(@"Portrait");
            self.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 20);
            self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ([UIScreen mainScreen].bounds.size.width - 20), 20)];
        }
        else {
            NSLog(@"Landscape");
            self.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.height, 20);
            self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ([UIScreen mainScreen].bounds.size.height - 20), 20)];
        }
        self.delegate = delegate;
        self.message = message;
        self.backgroundColor = [UIColor blackColor];
        
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
    
    if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait) {
        [UIView animateWithDuration:.4 animations:^{
            self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
        } completion:^(BOOL finished){
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(didPresentNotifierView:)])
                [self.delegate didPresentNotifierView:self];
            
            [NSTimer scheduledTimerWithTimeInterval:self.timeOnScreen target:self selector:@selector(hide) userInfo:nil repeats:NO];
            
        }];
    }
    else {
        [UIView animateWithDuration:.4 animations:^{
            self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, 20);
        } completion:^(BOOL finished){
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(didPresentNotifierView:)])
                [self.delegate didPresentNotifierView:self];
            
            [NSTimer scheduledTimerWithTimeInterval:self.timeOnScreen target:self selector:@selector(hide) userInfo:nil repeats:NO];
            
        }];
    }
}

- (void)hide {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(willHideNotifierView:)])
        [self.delegate willHideNotifierView:self];
    if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait) {
        [UIView animateWithDuration:.4 animations:^{
            self.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 20);
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
        } completion:^(BOOL finished){
            if (finished) {
                
                if (self.delegate && [self.delegate respondsToSelector:@selector(didHideNotifierView:)])
                    [self.delegate didHideNotifierView:self];
                
                [self removeFromSuperview];
            }
        }];
    }
    else {
        [UIView animateWithDuration:.4 animations:^{
            self.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.height, 20);
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
        } completion:^(BOOL finished){
            if (finished) {
                
                if (self.delegate && [self.delegate respondsToSelector:@selector(didHideNotifierView:)])
                    [self.delegate didHideNotifierView:self];
                
                [self removeFromSuperview];
            }
        }];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(self.shouldHideOnTap == TRUE) {
        [self hide];
    }
    [self.delegate notifierViewTapped:self];
}

- (void)setMessage:(NSString *)message {
    _message = message;
    self.messageLabel.text = message;
}

@end
