//
//  PHCircleRotateView.m
//  PHLoadingViews
//
//  Created by Peter Hare on 29/08/2013.
//

#import "PHCircleRotateView.h"
#import <QuartzCore/QuartzCore.h>

#define kDefaultSize CGSizeMake(30., 30.)
#define kDefaultCircleCount 9
#define kDefaultCircleWidth 6.
#define kDefaultPeriod 0.8

@implementation PHCircleRotateView

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

  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
  animation.duration = [self period];
  animation.repeatCount = CGFLOAT_MAX;
  [animation setFromValue:@0.];
  [animation setToValue:[NSNumber numberWithFloat:2*M_PI]];
  [[self layer] addAnimation:animation forKey:nil];
}

- (void)drawRect:(CGRect)rect;
{
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
  CGFloat radius = (MIN(rect.size.width, rect.size.height)) / 2. - [self circleWidth]/2.;

  for (int i = 0; i < [self circleCount]; i++)
  {
    CGFloat alpha = (1. * i / [self circleCount]);
    CGContextSetFillColorWithColor(context, [[UIColor colorWithWhite:0. alpha:alpha] CGColor]);
    CGFloat angle = (1. * i / [self circleCount]) * (2. * M_PI);
    CGRect circleRect = CGRectMake(center.x - radius * sinf(angle) - [self circleWidth]/2., center.y + radius * cosf(angle) - [self circleWidth]/2., [self circleWidth], [self circleWidth]);
    CGContextFillEllipseInRect(context, circleRect);
  }
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
