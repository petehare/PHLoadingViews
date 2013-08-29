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

  PHCircleFadeView *fadeView = [[PHCircleFadeView alloc] initWithFrame:CGRectMake(140., 120., 40., 40.)];
  [fadeView setCircleWidth:8.];
  [[self view] addSubview:fadeView];

  PHCircleRotateView *rotateView = [[PHCircleRotateView alloc] initWithFrame:CGRectMake(145., 220., 30., 30.)];
  [[self view] addSubview:rotateView];
}

@end
