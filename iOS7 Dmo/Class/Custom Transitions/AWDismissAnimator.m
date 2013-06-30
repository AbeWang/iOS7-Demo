#import "AWDismissAnimator.h"
#import "AWTransitionOneViewController.h"
#import "AWTransitionTwoViewController.h"

@implementation AWDismissAnimator

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    AWTransitionTwoViewController *fromVC = (AWTransitionTwoViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    AWTransitionOneViewController *toVC = (AWTransitionOneViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [fromVC view];
    UIView *toView = [toVC view];
    
    [[transitionContext containerView] insertSubview:toView belowSubview:fromView];
    [toView setHidden:NO];
    toView.alpha = 0.0;
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 6];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = [self transitionDuration:transitionContext] - 0.3;
    animationGroup.animations = @[rotationAnimation, scaleAnimation];
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    [fromView.layer addAnimation:animationGroup forKey:nil];
    
    double delayInSeconds = [self transitionDuration:transitionContext];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [fromView setHidden:YES];
        [UIView animateWithDuration:0.3 animations:^{
            toView.alpha = 1.0;
        }completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    });
}

@end
