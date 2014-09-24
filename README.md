**FDStatusBarNotifierView** is a view that lets you display notifications and messages using the space in which the status bar resides.

![Screenshot](https://github.com/frankdilo/FDStatusBarNotifierView/raw/master/Screenshot.png)

# Usage

It’s as easy to use as `UIAlertView`, here is an example:

	// from a view controller
	FDStatusBarNotifierView *notifierView = [[FDStatusBarNotifierView alloc] initWithMessage:@"Hello!"];
	notifierView.timeOnScreen = 3.0; // by default it's 2 seconds
	[notifierView showInWindow:self.view.window];
	
	// or from a view controller with a navigation bar
	[notifierView showAboveNavigationController:self.navigationController];



When you call `showInWindow:` the status bar disappear and the notifier view takes its place with a smooth animation.

# Installation

The easiest way to install this component is via [CocoaPods](http://cocoapods.org/).

Add the following line to your `podfile`:

	pod 'FDStatusBarNotifierView'

Then run the `pod install` command and import `FDStatusBarNotifierView.h` where you plan to use the notifier view.

You can also install this manually. Just drag `FDStatusBarNotifierView.h` and `FDStatusBarNotifierView.m` in your project and import the `.h` file where you want to use this component.

# Advanced usage

## Manually hide

In some circumstances (e.g. informing the user of network activities), you may want to manually hide the component.

To do so just set the `manuallyHide` property to `YES`. Then hide calling the `hide` method.

    notifierView.manuallyHide = YES;
    
    // do some stuff
    
    [notifierView hide];


## Hide on tap

If you set the `shouldHideOnTap` property to `YES` when the user taps the message it will be hidden.

## Scrolling message

If the message you want to display doesn’t fit in the status bar it will be animated and scroll horizontally to display the full text.

## Delegate methods

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
- Properly manage the animation queue, to avoid unexpected behavior when `showInWindow:` is called multiple times.

## Contributors
- [ZachOrr](https://github.com/ZachOrr): iPad support, hide on tap, better handling of device’s screen sizes.
- [dbsGen](https://github.com/dbsGen): if the message to display doesn’t fit in the status bar, it will scroll horizontally.
- [Luca Bernardi](https://github.com/lukabernardi): CocoaPods support, manual hiding.
- [Stephen Williams](https://github.com/onato): iOS 7 support and more

# License

See the LICENSE file (MIT).
