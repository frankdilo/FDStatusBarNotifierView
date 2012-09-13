**FDStatusBarNotifier** is a UIView subclass that let you display notifications using the space in which the status bar resides.

It’s as easy to use as `UIAlertView`, here is an example:

	// from a view controller
	FDStatusBarNotifierView *notifierView = [[FDStatusBarNotifierView alloc] initWithMessage:@"Hi"];
	notifierView.timeOnScreen = 3.0;
	[notifierView showInWindow:self.view.window];


When you call `showInWindow:` the status bar disappear and the notifier view takes its place with a smooth animation.

![](http://github.com/frankdilo/FDStatusBarNotifierView/raw/master/Screenshot.png)

# How to use it

To use it just drag and drop `FDStatusBarNotifierView.h` and `FDStatusBarNotifierView.m` in your project, import the `.h` file in your view controller implementation and use the code shown in the example above.

## Optional delegate methods

I've also created some handy *self-explanatory* delegate methods, if you need them.

	- (void)willPresentNotifierView:(FDStatusBarNotifierView *)notifierView;  // before animation and showing view
	- (void)didPresentNotifierView:(FDStatusBarNotifierView *)notifierView;   // after animation
	- (void)willHideNotifierView:(FDStatusBarNotifierView *)notifierView;     // before hiding animation
	- (void)didHideNotifierView:(FDStatusBarNotifierView *)notifierView;      // after animation
	- (void)notifierViewTapped:(FDStatusBarNotifierView *)notifierView;       // user tap the status bar message

# Contribute

Feel free to help out by sending pull requests or by creating new issues.

## TO DO 

- Add support for multiple orientations (currently only portrait is supported).

# License

## MIT License

Copyright (c) 2012 Francesco Di Lorenzo

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.