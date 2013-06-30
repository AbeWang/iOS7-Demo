#import "AWGravityCollisionSpringViewController.h"

@implementation AWGravityCollisionSpringViewController
{
    UIDynamicAnimator *animator;
    UIGravityBehavior *gravityBehavior;
    UICollisionBehavior *collisionBehavior;
    UIAttachmentBehavior *attachmentBehavior;
    
    UIView *redView;
}

- (void)loadView
{
    [super loadView];
    self.title = @"Gravity Collision Spring";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(120.0, 200.0, 80.0, 80.0);
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
    
    attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:button attachedToAnchor:CGPointMake(button.center.x, button.center.y - 120.0)];
    gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[button]];
    collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[button]];
    
    collisionBehavior.collisionMode = UICollisionBehaviorModeEverything;
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    attachmentBehavior.damping = 0.2;
    attachmentBehavior.frequency = 1.0;
    redView.center = attachmentBehavior.anchorPoint;
    
    [animator addBehavior:attachmentBehavior];
    [animator addBehavior:gravityBehavior];
    [animator addBehavior:collisionBehavior];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void)pan:(UIPanGestureRecognizer *)gr
{
    [attachmentBehavior setAnchorPoint:[gr locationInView:self.view]];
    redView.center = attachmentBehavior.anchorPoint;
}

@end
