//
//  PHCircleFadeView.m
//  PHLoadingViews
//
//  Created by Peter Hare on 29/08/2013.
//

#import "PHCircleFadeView.h"

#define kDefaultSize CGSizeMake(30., 30.)
#define kDefaultCircleCount 9
#define kDefaultCircleWidth 6.
#define kDefaultPeriod 0.8

@interface PHCircleView : UIView
@end

@implementation PHCircleView

- (id)initWithFrame:(CGRect)frame;
{
  self = [super initWithFrame:frame];
  if (self) {
    [self setBackgroundColor:[UIColor clearColor]];
  }
  return self;
}

- (void)drawRect:(CGRect)rect;
{
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextFillEllipseInRect(context, rect);
}

@end


@interface PHCircleFadeView ()

@property NSArray *circles;

@end

@implementation PHCircleFadeView

- (id)initWithCoder:(NSCoder *)aDecoder;
{
  self = [super initWithCoder:aDecoder];
  if (self)
  {
    [self setup];
  }
  return self;
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    [self setup];
  }
  return self;
}

- (void)setup;
{
  [self setCircleCount:kDefaultCircleCount];
  [self setCircleWidth:kDefaultCircleWidth];
  [self setPeriod:kDefaultPeriod];

  [self setBackgroundColor:[UIColor clearColor]];

  NSMutableArray *circles = [[NSMutableArray alloc] init];
  for (int i = 0; i < [self circleCount]; i++) {

    PHCircleView *circle = [[PHCircleView alloc] initWithFrame:CGRectZero];
    [self addSubview:circle];

    [UIView animateWithDuration:[self period] delay:(1. * i * [self period]/[self circleCount]) options:UIViewAnimationOptionRepeat animations:^{
      [circle setAlpha:0.];
    } completion:nil];

    [circles addObject:circle];
  }
  [self setCircles:circles];
}

- (void)layoutSubviews;
{
  [super layoutSubviews];

  CGRect bounds = [self bounds];
  CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
  CGFloat radius = (MIN(bounds.size.width, bounds.size.height)) / 2. - [self circleWidth]/2.;

  [[self circles] enumerateObjectsUsingBlock:^(PHCircleView *circle, NSUInteger i, BOOL *stop) {

    CGFloat angle = (1. * i / [self circleCount]) * (2. * M_PI);
    CGRect circleRect = CGRectMake(center.x - radius * sinf(angle) - [self circleWidth]/2., center.y + radius * cosf(angle) - [self circleWidth]/2., [self circleWidth], [self circleWidth]);

    [circle setFrame:circleRect];
  }];
}

- (CGSize)sizeThatFits:(CGSize)size;
{
  return kDefaultSize;
}

- (CGSize)intrinsicContentSize;
{
  return kDefaultSize;
}

@end
