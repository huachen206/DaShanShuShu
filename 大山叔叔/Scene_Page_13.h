//
//  Scene_Page_12.h
//  daShan
//
//  Created by edwardair on 11-12-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Text.h"
@interface Scene_Page_13 : CCLayer <text_touchedDelegate>{
    BOOL language;
    NSNumber *soundId,*soundBk;
    NSArray *array;
    int clickEnabledNumber;
    BOOL soundEffectEnabled;
}
- (void)textAdd;

@end
