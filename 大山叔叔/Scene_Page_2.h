//
//  Scene_Page_2.h
//  大山叔叔
//
//  Created by Hua Chen on 11-12-23.
//  Copyright 2011年 - -. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"

@interface Scene_Page_2 : CCLayer <text_touchedDelegate>{
    CCSprite *oldChicken;
    CCSprite *bulldozer;
    
    NSString *soundName;
    NSMutableArray *wheat_animationFrame;

    Text *text;

}
-(void)loadVoice:(NSString *)str;

@end
