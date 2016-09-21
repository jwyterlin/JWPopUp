# JWPopUp
A popup style view to use as a showcase in iOS

If you want to only use JWPopUpView from a static library, just do the following steps:

- Clean the project with 'Cmd + Option + Shift + K', and select 'Clean'.
- Build with the target JWPopUp selected.
- Clicking the right button on libJWPopUp.a that is in the 'Products' folder and select 'Show in Finder'.
- To implement the library in your project, just copy the 'include' folder and the libJWPopUp.a file to your project.

This library is already universally adapted for all architectures, including applications to run in the iOS Simulator.

To make it easier, you can create a framework: 

- Compile the project with the target 'Framework' selected.
- As an addendum, a copy of the framework will be created on your desktop, so you can already copy it and paste it in
your project.

## Public Classes

The public classes are:

- JWPopUpView

## Examples

You can use this way:

```
CGFloat x = 50.0f;
CGFloat y = 100.0f;
CGFloat width = 100.0f;
CGFloat height = 90.0f;
    
CGRect framePopUpView = CGRectMake(x, y, width, height);

NSString *message = @"YOUR_MESSAGE_HERE";
    
PopUpView *popUpView = [[PopUpView alloc] initWithFrame:framePopUpView message:message];
popUpView.popUpViewArrow = PopUpViewArrowTop;
[self.view addSubview:popUpView];
```

You can either custom the color:

```
PopUpView *popUpView = [[PopUpView alloc] initWithFrame:framePopUpView color:[UIColor greenColor] message:message];
```

Or choose different kind of arrows:

```
popUpView.popUpViewArrow = PopUpViewArrowTop; // Arrow to Top

popUpView.popUpViewArrow = PopUpViewArrowBottom; // Arrow to Bottom

popUpView.popUpViewArrow = PopUpViewArrowLeft; // Arrow to Left

popUpView.popUpViewArrow = PopUpViewArrowRight; // Arrow to Right

popUpView.popUpViewArrow = PopUpViewArrowNone; // None arrow will appear
```
