#import "AWColorMotionEffect.h"

@implementation AWColorMotionEffect

- (NSDictionary *)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)viewerOffset
{
	UIColor *color = [UIColor whiteColor];

    if (viewerOffset.horizontal > 0 && viewerOffset.vertical > 0) {
		color = [UIColor greenColor];
    }
    else if (viewerOffset.horizontal < 0 && viewerOffset.vertical < 0){
        color = [UIColor yellowColor];
    }
	else if (viewerOffset.horizontal > 0 && viewerOffset.vertical < 0) {
		color = [UIColor purpleColor];
	}
    else if (viewerOffset.horizontal < 0 && viewerOffset.vertical > 0) {
        color = [UIColor blueColor];
    }

	NSDictionary *dictionary = @{ @"backgroundColor" : (id)color,
								  @"center.x" : @(viewerOffset.horizontal * 30.0),
								  @"center.y" : @(viewerOffset.vertical * 30.0)};
	return dictionary;
}

@end
