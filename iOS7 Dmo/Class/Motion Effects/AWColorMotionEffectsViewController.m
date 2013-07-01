#import "AWColorMotionEffectsViewController.h"
#import "AWColorMotionEffect.h"

@implementation AWColorMotionEffectsViewController

- (void)loadView
{
    [super loadView];
    self.title = @"Color Motion Effect";

	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30.0, 160.0, 260.0, 300.0)];
	label.layer.borderColor = [UIColor redColor].CGColor;
	label.layer.borderWidth = 1.0;
	label.text = @"Hello world!";
	label.textAlignment = NSTextAlignmentCenter;
	label.font = [UIFont boldSystemFontOfSize:26.0];
	label.textColor = [UIColor blackColor];
	[self.view addSubview:label];

	AWColorMotionEffect *effect = [[AWColorMotionEffect alloc] init];
	[label addMotionEffect:effect];
}

@end
