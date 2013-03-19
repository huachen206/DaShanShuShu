//
//  Scene_Page_1.h
//  大山叔叔
//
//  Created by Hua Chen on 11-12-22.
//  Copyright 2011年 - -. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"
#import "LittleChicken.h"

@interface Scene_Page_1 : CCLayer <text_touchedDelegate>{

    CCSprite *oldChicken;
    //    CCSprite *littleChicken;
    bool oldFlg;
    NSString *soundName;
    Text *text;
    
    NSUserDefaults *page;
//    NSString *str_ch;
//    NSString *str_en;

}

//-(void)loadText:(NSString *)text isChinese:(BOOL )ischinese wordNumberOfLine:(int )num firstWordPosition:(CGPoint )pos; 
//-(void)languageChange;

@end
