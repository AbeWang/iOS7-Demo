#import "AWGravityCollisionViewController.h"

@implementation AWGravityCollisionViewController
{
    UIDynamicAnimator *animator;
    UIGravityBehavior *gravityBehavior;
    UICollisionBehavior *collisionBehavior;
}

- (void)loadView
{
    [super loadView];
    self.title = @"Gravity Collision";
    
    UIButton *button1 = [self createRectButtonWithPosition:CGPointMake(50.0, -200.0)];
    [self.view addSubview:button1];
    
    UIButton *button2 = [self createRectButtonWithPosition:CGPointMake(90.0, -90.0)];
    [self.view addSubview:button2];
    
    UIButton *button3 = [self createRectButtonWithPosition:CGPointMake(150.0, 0.0)];
    [self.view addSubview:button3];

    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[button1, button2, button3]];
    [gravityBehavior setXComponent:0.0 yComponent:0.6];
    [animator addBehavior:gravityBehavior];
    
    collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[button1, button2, button3]];
    collisionBehavior.collisionMode = UICollisionBehaviorModeEverything;
    [collisionBehavior addBoundaryWithIdentifier:@"CollisionIdentifier" forPath:[UIBezierPath bezierPathWithRect:CGRectMake(0.0, -200.0, self.view.bounds.size.width, self.view.bounds.size.height + 200.0)]];
    [animator addBehavior:collisionBehavior];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)tap:(UITapGestureRecognizer *)gr
{
    if ([gr state] == UIGestureRecognizerStateEnded) {
        CGPoint point = [gr locationInView:self.view];
        UIButton *button = [collisionBehavior.items lastObject];
        button.frame = CGRectMake(point.x, point.y, 80.0, 80.0);
        [collisionBehavior removeItem:button];
        [gravityBehavior removeItem:button];
        [collisionBehavior addItem:button];
        [gravityBehavior addItem:button];
    }
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
