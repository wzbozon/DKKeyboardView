//
//  DKAppDelegate.h
//  DKKeyboardView
//
//  Created by Denis Kutlubaev on 28.08.12.
//  Copyright (c) 2012 Denis Kutlubaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DKViewController;

@interface DKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DKViewController *viewController;

@end
