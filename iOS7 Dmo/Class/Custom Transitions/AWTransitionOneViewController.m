#import "AWTransitionOneViewController.h"
#import "AWTransitionTwoViewController.h"
#import "AWTransitionBackgroundView.h"
#import "AWPresentAnimator.h"
#import "AWDismissAnimator.h"

@implementation AWTransitionOneViewController

- (void)loadView
{
    [super loadView];
    self.title = @"Custom Transitions";
    
    AWTransitionBackgroundView *bgView = [[AWTransitionBackgroundView alloc] initWithFrame:self.view.bounds color:[UIColor yellowColor]];
    self.view = bgView;
    
    UIButton *goButton = [UIButton buttonWithType:UIButtonTypeSystem];
    goButton.frame = CGRectMake(0.0, 200.0, 320.0, 60.0);
    [goButton setTitle:@"Present View Controller" forState:UIControlStateNormal];
    goButton.titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
    goButton.backgroundColor = [UIColor blackColor];
    [goButton addTarget:self action:@selector(presentVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goButton];
}

- (void)presentVC
{
    AWTransitionTwoViewController *controller = [[AWTransitionTwoViewController alloc] init];
    controller.transitioningDelegate = self;
    controller.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;
{
    AWPresentAnimator *animator = [[AWPresentAnimator alloc] init];
    return animator;
}
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    AWDismissAnimator *animator = [[AWDismissAnimator alloc] init];
    return animator;
}

@end
