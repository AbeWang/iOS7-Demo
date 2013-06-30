#import "AWMotionEffectsViewController.h"
#import "AWColorMotionEffectsViewController.h"

@implementation AWMotionEffectsViewController
{
    UIImageView *imageView;
}

- (void)loadView
{
    [super loadView];
    self.title = @"Motion Effects";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Color Effect" style:UIBarButtonItemStyleBordered target:self action:@selector(colorEffectAction)];
    self.navigationItem.rightBarButtonItem = item;
    
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"demoMotionEffects.jpg"]];
    imageView.frame = CGRectMake(0.0, 64.0, 320.0, self.view.bounds.size.height - 64.0);
    [self .view addSubview:imageView];
    
    // X Axis
    UIInterpolatingMotionEffect *xAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    xAxis.minimumRelativeValue = [NSNumber numberWithFloat:-10.0];
    xAxis.maximumRelativeValue = [NSNumber numberWithFloat:10.0];
    
    // Y Axis
    UIInterpolatingMotionEffect *yAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    yAxis.minimumRelativeValue = [NSNumber numberWithFloat:-10.0];
    yAxis.maximumRelativeValue = [NSNumber numberWithFloat:10.0];
    
    UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
    group.motionEffects = @[xAxis, yAxis];
    [imageView addMotionEffect:group];
}

- (void)colorEffectAction
{
    AWColorMotionEffectsViewController *controller = [[AWColorMotionEffectsViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
