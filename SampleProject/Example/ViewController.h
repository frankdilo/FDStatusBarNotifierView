//
//  ViewController.h
//  Example
//
//  Created by Francesco Di Lorenzo on 06/09/12.
//  Copyright (c) 2012 Francesco Di Lorenzo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDStatusBarNotifierView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *messageField;

- (IBAction)showMessage;

@end
