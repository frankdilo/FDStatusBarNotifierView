//
//  FDStatusBarNotifier.m
//  Example
//
//  Created by Francesco Di Lorenzo on 06/08/14.
//  Copyright (c) 2014 Francesco Di Lorenzo. All rights reserved.
//

#import "FDStatusBarNotifier.h"
#import "FDStatusBarNotifierView.h"

@interface FDStatusBarNotifier()
@property (nonatomic) FDStatusBarNotifierView *messageView;
@property (nonatomic) UIWindow *messageViewWindow;
@end

@implementation FDStatusBarNotifier

- (id)init;
{
    return [self initWithMessage:nil delegate:nil];
}

- (id)initWithMessage:(NSString *)message;
{
    return [self initWithMessage:message delegate:nil];
}

- (id)initWithMessage:(NSString *)message delegate:(id <FDStatusBarNotifierDelegate>)delegate;
{
    self = [super init];
    if (self) {
        self.messageViewWindow = [self _messageViewWindow];
        self.messageView = [self _messageView];
        self.messageView.messageLabel.text = message;
        [self.messageViewWindow addSubview:self.messageView];
    }
    return self;
}

#pragma mark - Core functionality

- (void)show {
    [self.messageViewWindow makeKeyAndVisible];
}

#pragma mark - Private methods

- (UIWindow*)_messageViewWindow {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    window.windowLevel = UIWindowLevelStatusBar;
    return window;
}

- (FDStatusBarNotifierView *)_messageView {
    FDStatusBarNotifierView *messageView = [[FDStatusBarNotifierView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 20)];
    return messageView;
}

#pragma mark - Utility

- (UIViewController *)topViewController {
    return [self topViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (UIViewController *)topViewController:(UIViewController *)rootViewController
{
    if (rootViewController.presentedViewController == nil) {
        return rootViewController;
    }
    
    if ([rootViewController.presentedViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        return [self topViewController:navigationController.topViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self topViewController:presentedViewController];
}

@end
