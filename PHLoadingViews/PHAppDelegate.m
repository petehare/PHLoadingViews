//
//  PHAppDelegate.m
//  PHLoadingViews
//
//  Created by Peter Hare on 29/08/2013.
//

#import "PHAppDelegate.h"
#import "PHRootViewController.h"

@implementation PHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
  [[self window] setRootViewController:[[PHRootViewController alloc] init]];
  [[self window] setBackgroundColor:[UIColor whiteColor]];
  [[self window] makeKeyAndVisible];
  return YES;
}

@end
