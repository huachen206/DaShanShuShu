//
//  Scene_Page_12.h
//  daShan
//
//  Created by edwardair on 11-12-23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Text.h"
@interface Scene_Page_12 : CCLayer <text_touchedDelegate>{
    int clickState;
    BOOL language;
    NSNumber *soundHen,*soundCat,*soundBk;
}
- (void)textAdd;

@end
