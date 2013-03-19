//
//  Scene_Page_3.h
//  大山叔叔
//
//  Created by Hua Chen on 11-12-23.
//  Copyright 2011年 - -. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"

@interface Scene_Page_3 : CCLayer <text_touchedDelegate>{
    BOOL tomGooseFlg;
    BOOL henGooseFlg;
    
    CCSprite *tomGoose;
    CCSprite *henGoose;
    CCSprite *umbrella;
    NSMutableArray *umbrella_frame;
    
    CCSprite *boom_tom;
    CCSprite *boom_hen;

    CCSprite *smoke1;
    
    BOOL unbrellaIsClosed;
    NSString *soundName;
    Text *text;

}

-(void)burntE;
@end
