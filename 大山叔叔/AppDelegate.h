//
//  AppDelegate.h
//  大山叔叔
//
//  Created by Hua Chen on 11-12-22.
//  Copyright - - 2011年. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;
-(void)sendEmail;

@end
