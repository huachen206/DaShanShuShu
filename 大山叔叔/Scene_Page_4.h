//
//  Scene_Page_4.h
//  大山叔叔
//
//  Created by Hua Chen on 11-12-23.
//  Copyright 2011年 - -. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"

@interface Scene_Page_4 : CCLayer <text_touchedDelegate>{
    
    CCSprite *face;
    BOOL face_flg;
    
    CCSprite *oldChicken;
    NSMutableArray *oldChikcenFrame;
//    BOOL oldChickenFlg;
    
    NSMutableArray *oldChickenWalkFrame;
    
    NSString *soundName;
    Text *text;

}

@end
