//
//  Scene_Page_7.h
//  dashan
//
//  Created by Liu Yang on 11-12-23.
//  Copyright 2011年 Jiangsu  Zhongka  Educational  Science and   Technology  Co.，Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Text.h"
@interface Scene_Page_7 : CCLayer<text_touchedDelegate> {
    CCSpriteFrameCache *cache;
    NSString *sound;
    NSNumber *soundId;
    NSNumber *soundBk;
    BOOL language;
    BOOL bo;
    int laAng;
}
- (void)textAdd;
@end
