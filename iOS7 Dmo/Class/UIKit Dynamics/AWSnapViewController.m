#import "AWSnapViewController.h"

@implementation AWSnapViewController
{
    UIDynamicAnimator *animator;
    UISnapBehavior *snapBehavior;
    UIButton *button;
}

- (void)loadView
{
    [super loadView];
    self.title = @"Snap";
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(120.0, 400.0, 80.0, 80.0);
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"I'm button" forState:UIControlStateNormal];
    [button setTitle:@"Click" forState:UIControlStateHighlighted];
    [button setTitle:@"Click" forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 1.0;
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)tap:(UITapGestureRecognizer *)gr
{
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    snapBehavior = [[UISnapBehavior alloc] initWithItem:button snapToPoint:[gr locationInView:self.view]];
    [animator addBehavior:snapBehavior];
}

@end
