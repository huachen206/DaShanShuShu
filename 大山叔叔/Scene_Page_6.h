//
//  Scene_Page_6.h
//  dashan
//
//  Created by Liu Yang on 11-12-22.
//  Copyright 2011年 Jiangsu  Zhongka  Educational  Science and   Technology  Co.，Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Text.h"
@interface Scene_Page_6 : CCLayer<text_touchedDelegate> {
    CCSpriteFrameCache *cache;
    NSString *sound;
    NSNumber *soundId;
    NSNumber *soundBk;
    BOOL language;
    BOOL bol1;
}
- (void)textAdd;
@end
