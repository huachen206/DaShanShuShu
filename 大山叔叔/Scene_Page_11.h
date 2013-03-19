//
//  Scene_Page_11.h
//  daShan
//
//  Created by edwardair on 11-12-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Text.h"
@interface Scene_Page_11 : CCLayer <text_touchedDelegate>{
    NSArray *animalSounds;
    NSNumber *soundId;
    BOOL language;
    NSNumber *soundBk;
}
- (void)textAdd;

@end
