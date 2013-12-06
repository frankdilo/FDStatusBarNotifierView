//
//  ViewController.m
//  Example
//
//  Created by Francesco Di Lorenzo on 06/09/12.
//  Copyright (c) 2012 Francesco Di Lorenzo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    FDStatusBarNotifierView *_notifierView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)showMessage
{
    NSString *text = self.messageField.text;
    
    FDStatusBarNotifierView *notifierView = [[FDStatusBarNotifierView alloc] initWithMessage:text];
    notifierView.timeOnScreen = 3.0;
    [notifierView showAboveNavigationController:self.navigationController];
}

- (IBAction)showMessageNoAutohide:(id)sender {
    NSString *text = self.messageField.text;
    
    _notifierView = [[FDStatusBarNotifierView alloc] initWithMessage:text delegate:self];
    _notifierView.manuallyHide = YES;
    [_notifierView showAboveNavigationController:self.navigationController];
}

- (IBAction)hideButtonTapped:(id)sender {
    [_notifierView hide];
}

// **Optional** StatusBarNotifierViewDelegate methods

- (void)willPresentNotifierView:(FDStatusBarNotifierView *)notifierView {
    NSLog(@"willPresentNotifierView");
}

- (void)didPresentNotifierView:(FDStatusBarNotifierView *)notifierView {
    NSLog(@"didPresentNotifierView");
}

- (void)willHideNotifierView:(FDStatusBarNotifierView *)notifierView {
    NSLog(@"willHideNotifierView");
}

- (void)didHideNotifierView:(FDStatusBarNotifierView *)notifierView {
    NSLog(@"didHideNotifierView");
}

- (void)notifierViewTapped:(FDStatusBarNotifierView *)notifierView {
    NSLog(@"notifierViewTapped");
}

@end