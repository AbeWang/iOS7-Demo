#import "AWPresentAnimator.h"
#import "AWTransitionOneViewController.h"
#import "AWTransitionTwoViewController.h"

@implementation AWPresentAnimator

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.7;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    AWTransitionOneViewController *fromVC = (AWTransitionOneViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    AWTransitionTwoViewController *toVC = (AWTransitionTwoViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [fromVC view];
    UIView *toView = [toVC view];
    
    [[transitionContext containerView] insertSubview:toView belowSubview:fromView];
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 6];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = [self transitionDuration:transitionContext];
    animationGroup.animations = @[rotationAnimation, scaleAnimation];
    [fromView.layer addAnimation:animationGroup forKey:nil];
    
    double delayInSeconds = [self transitionDuration:transitionContext];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [fromView setHidden:YES];
        [toView setHidden:NO];
        [transitionContext completeTransition:YES];
    });
}

@end
