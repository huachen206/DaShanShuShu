//
//  Scene_Page_10.h
//  daShan
//
//  Created by edwardair on 11-12-19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Text.h"
@interface Scene_Page_10 : CCLayer <text_touchedDelegate>{
    CGPoint p;
    int breadNumber;
    int breadScaleState;
    BOOL language;
    NSNumber *soundBk;
}
- (void)textAdd;
@end
