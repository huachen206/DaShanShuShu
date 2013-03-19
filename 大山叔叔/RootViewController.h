//
//  RootViewController.h
//  大山叔叔
//
//  Created by Hua Chen on 11-12-22.
//  Copyright - - 2011年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface RootViewController : UIViewController <MFMailComposeViewControllerDelegate>{

}
-(void)displayComposer;
-(void)launchMailAppOnDevice;

@end
