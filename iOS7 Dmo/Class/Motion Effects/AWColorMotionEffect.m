#import "AWColorMotionEffect.h"

@implementation AWColorMotionEffect

- (NSDictionary *)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)viewerOffset
{
    if (viewerOffset.horizontal > 0) {
        
    }
    else {
        
    }
    
    if (viewerOffset.vertical > 0) {
        
    }
    else {
        
    }
    
    UIColor *color = [UIColor yellowColor];
    return @{@"layer.fillcolor" : (id)color.CGColor};
}

@end
