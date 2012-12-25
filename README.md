**FDStatusBarNotifier** is a UIView subclass that lets you display notifications using the space in which the status bar resides.

![](http://github.com/frankdilo/FDStatusBarNotifierView/raw/master/Screenshot.png)

# Installation

## Copy File
To use it just drag and drop `FDStatusBarNotifierView.h` and `FDStatusBarNotifierView.m` in your project, import the `.h` file in your view controller implementation and use the code shown in the example above.

## Cocoapods

You can use [CocoaPods](http://cocoapods.org) to manage your dependencies and install *FDStatusBarNotifierView*.
Follow the instructions on the CocoaPods site to [install the gem](https://github.com/CocoaPods/CocoaPods#installation) and add `pod 'FDStatusBarNotifierView', :git => 'https://github.com/frankdilo/FDStatusBarNotifierView.git'` to your *Podfile*.

# Use

It’s as easy to use as `UIAlertView`, here is an example:

	// from a view controller
	FDStatusBarNotifierView *notifierView = [[FDStatusBarNotifierView alloc] initWithMessage:@"Hi"];
	notifierView.timeOnScreen = 3.0;
	[notifierView showInWindow:self.view.window];


When you call `showInWindow:` the status bar disappear and the notifier view takes its place with a smooth animation.

## Manually hide

In some circumstances (e.g., informing the user of network activities), you may want to manually hide the component.

To do so just set the `manuallyHide` property to `YES`. Then hide calling the `hide` method.

    notifierView.manuallyHide = YES;
    
    // do some stuff
    
    [notifierView hide];


## More

- If you set the `shouldHideOnTap` property to `YES` when the user touch the message it will be hidden.
- If the message you want to display doesn’t fit in the status bar it will be animated and scroll horizontally to display the full text.


## Optional delegate methods

I've also created some handy *self-explanatory* delegate methods, if you need them.

	- (void)willPresentNotifierView:(FDStatusBarNotifierView *)notifierView;  // before animation and showing view
	- (void)didPresentNotifierView:(FDStatusBarNotifierView *)notifierView;   // after animation
	- (void)willHideNotifierView:(FDStatusBarNotifierView *)notifierView;     // before hiding animation
	- (void)didHideNotifierView:(FDStatusBarNotifierView *)notifierView;      // after animation
	- (void)notifierViewTapped:(FDStatusBarNotifierView *)notifierView;       // user tap the status bar message

# Contribute

Feel free to help out by sending pull requests or by creating new issues.

## Contributors
- [ZachOrr](https://github.com/ZachOrr): iPad support, hide on tap, better handling of device’s screen sizes.
- [dbsGen](https://github.com/dbsGen): if the message to display doesn’t fit in the status bar, it will scroll horizontally.
- [Luca Bernardi](https://github.com/lukabernardi): CocoaPods support, manual hiding.

## TO DO 

- Add support for multiple orientations (currently only portrait is supported).
- Properly manage the animation queue, to avoid unexpected behavior when `showInWindow:` is called multiple times.

# License

## MIT License

Copyright (c) 2012 Francesco Di Lorenzo

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.