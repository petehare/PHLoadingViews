//
//  PHRootViewController.m
//  PHLoadingViews
//
//  Created by Peter Hare on 29/08/2013.
//

#import "PHRootViewController.h"

#import "PHCircleFadeView.h"
#import "PHCircleRotateView.h"

@implementation PHRootViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  PHCircleFadeView *fadeView1 = [[PHCircleFadeView alloc] initWithFrame:CGRectMake(100., 100., 40., 40.)];
  [fadeView1 setCircleWidth:8.];
  [[self view] addSubview:fadeView1];

  PHCircleFadeView *fadeView2 = [[PHCircleFadeView alloc] initWithFrame:CGRectMake(180., 100., 40., 40.)];
  [fadeView2 setCircleCount:6.];
  [fadeView2 setCircleWidth:12.];
  [[self view] addSubview:fadeView2];

  PHCircleRotateView *rotateView1 = [[PHCircleRotateView alloc] initWithFrame:CGRectMake(145., 200., 30., 30.)];
  [[self view] addSubview:rotateView1];

  PHCircleRotateView *rotateView2 = [[PHCircleRotateView alloc] initWithFrame:CGRectMake(130., 280., 60., 60.)];
  [[self view] addSubview:rotateView2];
}

@end
