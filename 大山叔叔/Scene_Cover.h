//
//  Scene_Cover.h
//  大山叔叔
//
//  Created by Hua Chen on 11-12-22.
//  Copyright 2011年 - -. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"

@interface Scene_Cover : CCLayer {
    CCSprite *bk_01;
    CCSprite *bk_02;
    
    CCSprite *title_Ch;
    CCSprite *title_En;
    
    CCSprite *begainRead;
    CCSprite *sleepMode;
    
    CCMenuItem *item_Ch;
    CCMenuItem *item_En;
    
    NSUserDefaults *page;
    BOOL language;

    CCSprite *redCicle;
    BOOL touchAllow;
    
    NSNumber *soundId;
    NSString *sound;
    NSArray *soundNamesC;
    NSArray *soundNamesE;
}
-(void)languageChange;
//-(void)languageChanged;
-(void)title;
- (void)playMusic;
@end
