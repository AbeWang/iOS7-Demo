#import "AWObjCToJSViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@implementation AWObjCToJSViewController

- (void)loadView
{
	[super loadView];
	self.title = @"ObjC -> JS";

	UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
	label.textColor = [UIColor blackColor];
	label.numberOfLines = 0;
	label.font = [UIFont systemFontOfSize:12.0];
	[self.view addSubview:label];

	NSMutableString *text = [[NSMutableString alloc] init];
	JSContext *context = [[JSContext alloc] init];

	// Evaluate a string of JavaScript code.
	[text appendString:@"Evaluate a string of JavaScript code.\n"];
	JSValue *result = [context evaluateScript:@"2 + 8"];
	[text appendString:[NSString stringWithFormat:@"2 + 8 = %d\n\n", [result toInt32]]];

	// Calling JavaScript Functions.
	[text appendString:@"Calling JavaScript Functions.\n"];
	NSString *factorialScript = [self loadFactorialScript];
	[context evaluateScript:factorialScript];
	JSValue *function = context[@"factorial"];
	JSValue *value = [function callWithArguments:@[@5]];
	[text appendString:[NSString stringWithFormat:@"Factorial(5) = %d\n\n", [value toInt32]]];

	// Create a JavaScript value from an Objective-C primitive type.
	[text appendString:@"Create a JavaScript value from an Objective-C primitive type.\n"];
	JSValue *boolValue = [JSValue valueWithBool:YES inContext:context];
	[text appendString:[NSString stringWithFormat:@"YES -> %@\n", boolValue]];
	JSValue *doubleValue = [JSValue valueWithDouble:10.0 inContext:context];
	[text appendString:[NSString stringWithFormat:@"10.0 -> %@\n\n", doubleValue]];

	// Create a JavaScript value in this context.
	[text appendString:@"Create a JavaScript value in this context.\n"];
	JSValue *nullValue = [JSValue valueWithNullInContext:context];
	[text appendString:[NSString stringWithFormat:@"NULL -> %@\n", nullValue]];
	JSValue *undefinedValue = [JSValue valueWithUndefinedInContext:context];
	[text appendString:[NSString stringWithFormat:@"Undefined -> %@\n", undefinedValue]];
	JSValue *objectValue = [JSValue valueWithNewObjectInContext:context];
	[text appendString:[NSString stringWithFormat:@"NewObject -> %@\n", objectValue]];
	JSValue *arrayValue = [JSValue valueWithNewArrayInContext:context];
	[text appendString:[NSString stringWithFormat:@"NewArray -> %@\n", arrayValue]];
	JSValue *regularExpressionValue = [JSValue valueWithNewRegularExpressionFromPattern:@"hello_(.+)" flags:@"" inContext:context];
	[text appendString:[NSString stringWithFormat:@"NewRegularExpression -> %@\n", regularExpressionValue]];
	JSValue *errorValue = [JSValue valueWithNewErrorFromMessage:@"Error!" inContext:context];
	[text appendString:[NSString stringWithFormat:@"NewError -> %@\n\n", errorValue]];

	// Create a JSValue by converting an Objective-C object.
	[text appendString:@"Create a JSValue by converting an Objective-C object.\n"];
	JSValue *myObjValue = [JSValue valueWithObject:label inContext:context];
	[text appendString:[NSString stringWithFormat:@"UILabel obj -> %@", [myObjValue toObject]]];

	label.text = text;
}

- (NSString *)loadFactorialScript
{
	/*
	 var factorial = function(n) {
	 if (n < 0)
	 return;
	 if (n === 0)
	 return 1;
	 return n * factorial(n - 1)
	 };
	 */
	return @"var factorial=function(n){if(n<0)return;if(n===0)return 1;return n*factorial(n-1)};";
}

@end
