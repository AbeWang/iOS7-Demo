#import "AWBlurredBackgroundViewController.h"
#import "AWTransitionBackgroundView.h"
#import "UIImage+ImageEffects.h"

@implementation AWBlurredBackgroundViewController
{
    UIImageView *imageView;
}

- (void)loadView
{
    [super loadView];
    self.title = @"Blurred Background";
    
    AWTransitionBackgroundView *bgView = [[AWTransitionBackgroundView alloc] initWithFrame:self.view.bounds color:[UIColor yellowColor]];
    self.view = bgView;
    
    UIButton *goButton = [UIButton buttonWithType:UIButtonTypeSystem];
    goButton.frame = CGRectMake(0.0, 64.0, 320.0, 60.0);
    [goButton setTitle:@"Present Blurred Background" forState:UIControlStateNormal];
    goButton.titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
    goButton.backgroundColor = [UIColor blackColor];
    [goButton addTarget:self action:@selector(presentBlurredBackground) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goButton];
    
    imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(20.0, 140.0, 280.0, 340.0);
    imageView.layer.borderColor = [UIColor redColor].CGColor;
    imageView.layer.borderWidth = 1.0;
    [self.view addSubview:imageView];
}

- (void)presentBlurredBackground
{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, [UIScreen mainScreen].scale);
    [self.view drawViewHierarchyInRect:self.view.bounds];
    UIImage *blurImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    imageView.image = [blurImage applyLightEffect];
}

@end
