//
//  Scene_Page_5.h
//  dashan
//
//  Created by Liu Yang on 11-12-20.
//  Copyright 2011年 Jiangsu  Zhongka  Educational  Science and   Technology  Co.，Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Text.h"
@interface Scene_Page_5 : CCLayer<text_touchedDelegate> {
    CCSpriteFrameCache *cache;
    NSMutableArray *arry;
    NSNumber *soundBk;
    BOOL language;
    int a;
    int b;
    int c;
    BOOL bol1;
    BOOL bol2;
    BOOL bol3;
    BOOL bol4;
    BOOL bol5;
    BOOL bol6;
    BOOL bol7;
    BOOL bol8;
    BOOL bol9;
}
- (void)textAdd;
@end
