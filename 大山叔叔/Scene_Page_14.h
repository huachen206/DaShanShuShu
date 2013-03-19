//
//  Scene_Page_14.h
//  daShan
//
//  Created by edwardair on 11-12-23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Text.h"
@interface Scene_Page_14 : CCLayer <text_touchedDelegate>{
    BOOL language;
    NSNumber *soundBk;
}
- (void)textAdd;

@end
