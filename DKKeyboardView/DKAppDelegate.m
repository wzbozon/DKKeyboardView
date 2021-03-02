//
//  DKAppDelegate.m
//  DKKeyboardView
//
//  Created by Denis Kutlubaev on 28.08.12.
//  Copyright (c) 2012 Denis Kutlubaev. All rights reserved.
//

#import "DKAppDelegate.h"
#import "DKViewController.h"

@implementation DKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[DKViewController alloc] initWithNibName:@"DKViewController" bundle:nil];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
