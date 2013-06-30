#import "AWTransitionBackgroundView.h"

@implementation AWTransitionBackgroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.color = [UIColor blackColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame color:(UIColor *)inColor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.color = inColor;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    [[UIColor whiteColor] set];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    [path fill];
    
    CGFloat viewHeight = self.bounds.size.height;
    CGFloat viewWidth = self.bounds.size.width;
    NSInteger rectWidth = 20;
    
    [self.color set];
    
    for (NSInteger heightOffset = 0; heightOffset < viewHeight; heightOffset += rectWidth) {
        for (NSInteger widthOffset = (heightOffset % (rectWidth * 2)) ? 0 : rectWidth; widthOffset < viewWidth; widthOffset += rectWidth * 2) {
            UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:CGRectMake(widthOffset, heightOffset, rectWidth, rectWidth)];
            [rectPath fill];
        }
    }
}

@end
