#import "AWAttachmentViewController.h"

@implementation AWAttachmentViewController
{
    UIDynamicAnimator *animator;
    UIAttachmentBehavior *attachmentBehavior;
    UIView *redView;
}

- (void)loadView
{
    [super loadView];
    self.title = @"Attachment";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
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
    
    redView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 70.0, 10.0, 10.0)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:button point:CGPointMake(-25.0, -25.0) attachedToAnchor:CGPointMake(button.center.x, button.center.y - 100.0)];
    
    redView.center = attachmentBehavior.anchorPoint;
//    attachmentBehavior.frequency = 0.2;
//    attachmentBehavior.damping = 0.2;
    [animator addBehavior:attachmentBehavior];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void)pan:(UIPanGestureRecognizer *)gr
{
    [attachmentBehavior setAnchorPoint:[gr locationInView:self.view]];
    redView.center = attachmentBehavior.anchorPoint;
}

@end
