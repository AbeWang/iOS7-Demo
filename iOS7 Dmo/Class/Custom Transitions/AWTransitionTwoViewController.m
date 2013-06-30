#import "AWTransitionTwoViewController.h"
#import "AWTransitionBackgroundView.h"

@implementation AWTransitionTwoViewController

- (void)loadView
{
    [super loadView];
    
    AWTransitionBackgroundView *backgroundView = [[AWTransitionBackgroundView alloc] initWithFrame:self.view.bounds color:[UIColor blackColor]];
    self.view = backgroundView;
    
    UIButton *goButton = [UIButton buttonWithType:UIButtonTypeSystem];
    goButton.frame = CGRectMake(0.0, 200.0, 320.0, 60.0);
    [goButton setTitle:@"Dismiss View Controller" forState:UIControlStateNormal];
    goButton.backgroundColor = [UIColor yellowColor];
    goButton.titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
    [goButton addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goButton];
}

- (void)dismissVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
