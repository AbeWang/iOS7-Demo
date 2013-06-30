#import "AWDynamicItemViewController.h"

@implementation AWDynamicItemViewController
{
    UIDynamicAnimator *animator;
    UIGravityBehavior *gravityBehavior;
    UICollisionBehavior *collisionBehavior;
    UIDynamicItemBehavior *dynamicItemBehavior;
}

- (void)loadView
{
    [super loadView];
    self.title = @"Dynamic Item";
    
    UIButton *button1 = [self createRectButtonWithPosition:CGPointMake(30.0, 0.0)];
    [self.view addSubview:button1];
    
    UIButton *button2 = [self createRectButtonWithPosition:CGPointMake(200.0, 0.0)];
    [self.view addSubview:button2];
    
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[button1, button2]];
    collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[button1, button2]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    dynamicItemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[button2]];
    dynamicItemBehavior.elasticity = 0.8;
    dynamicItemBehavior.friction = 0.5;
    
    [animator addBehavior:gravityBehavior];
    [animator addBehavior:collisionBehavior];
    [animator addBehavior:dynamicItemBehavior];
}

- (UIButton *)createRectButtonWithPosition:(CGPoint)inPosition
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(inPosition.x, inPosition.y, 80.0, 80.0);
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"I'm button" forState:UIControlStateNormal];
    [button setTitle:@"Click" forState:UIControlStateHighlighted];
    [button setTitle:@"Click" forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 1.0;
    button.backgroundColor = [UIColor greenColor];
    return button;
}

@end
