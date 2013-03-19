//
//  SceneManager.h
//  avcccc test
//
//  Created by Hua Chen on 11-11-8.
//  Copyright 2011年 - -. All rights reserved.
//
#define TransitionCrossFade 0 // 隐去翻页
#define TransitionPageTurnBack 1 // 后翻页
#define TransitionPageTurnFront 2 // 前翻页

#define TransitionFadeTR 3
#define TransitionFadeBL 4


#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"
#import "Text.h"

//按照以下名称命名
#import "Scene_Cover.h"
#import "Oi.h"
#import "moreLayer.h"
#import "Scene_TitlePage.h"
#import "Scene_Preface.h"

#import "Scene_Page_1.h"
#import "Scene_Page_2.h"
#import "Scene_Page_3.h"
#import "Scene_Page_4.h"
#import "Scene_Page_5.h"
#import "Scene_Page_6.h"
#import "Scene_Page_7.h"
#import "Scene_Page_8.h"
#import "Scene_Page_9.h"
#import "Scene_Page_10.h"
#import "Scene_Page_11.h"
#import "Scene_Page_12.h"
#import "Scene_Page_13.h"
#import "Scene_Page_14.h"
#import "overScene.h"
#import "youxi.h"
#define   slide_rect CGRectMake(0, 0, 1024, 205)

//#import "Scene_Over.h"

@interface SceneManager : NSObject {
   

}
+ (void)call_Cover:(int)flg; // 封面
+ (void)call_Oi:(int)flg; // 操作说明
+ (void)call_more:(int)flg;

+ (void)call_TitlePage:(int)flg; // 扉页
+ (void)call_Preface:(int)flg;//前言

+(void)call_game:(int)flg;

+(void)call_Page_1:(int)flg;
+(void)call_Page_2:(int)flg;
+(void)call_Page_3:(int)flg;
+(void)call_Page_4:(int)flg;
+(void)call_Page_5:(int)flg;
+(void)call_Page_6:(int)flg;
+(void)call_Page_7:(int)flg;
+(void)call_Page_8:(int)flg;
+(void)call_Page_9:(int)flg;
+(void)call_Page_10:(int)flg;
+(void)call_Page_11:(int)flg;
+(void)call_Page_12:(int)flg;
+(void)call_Page_13:(int)flg;
+(void)call_Page_14:(int)flg;
+(void)call_Page_Over:(int)flg;

//+(void)call_Over:(int)flg;  //封底-大山叔叔的话

+(BOOL)CheckLanguage;
+(BOOL)CheckGame;
+(void)pagingOfIndex:(int)index back:(int)flg;


@end
