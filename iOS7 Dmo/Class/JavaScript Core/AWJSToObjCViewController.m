#import "AWJSToObjCViewController.h"
#import "UIImage+ImageEffects.h"
#import <JavaScriptCore/JavaScriptCore.h>

@implementation AWJSToObjCViewController

- (void)loadView
{
	[super loadView];
	self.title = @"JS -> ObjC";

	JSContext *context = [[JSContext alloc] init];
	context[@"showAlertView"] = ^(NSString *title, NSString *message){
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
		[alertView show];
	};

	UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0.0, 64.0, self.view.bounds.size.width, self.view.bounds.size.height - 64.0)];
	textView.keyboardAppearance = UIKeyboardAppearanceDark;
	textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
	textView.autocorrectionType = UITextAutocorrectionTypeNo;
	textView.editable = NO;
	textView.text = [NSString stringWithFormat:@"JavaScript Code :\n\n%@", [self loadScript]];
	[self.view addSubview:textView];

	// Run script
	[context evaluateScript:[self loadScript]];
	JSValue *function = context[@"sayHello"];
	[function callWithArguments:@[@"Hello World!", @"I'm Abe ^.<"]];
}

- (NSString *)loadScript
{
	return @"var sayHello = function(title, message) { showAlertView(title, message); };";
}

@end
