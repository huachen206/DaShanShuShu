//
//  SceneManager.m
//  avcccc test
//
//  Created by Hua Chen on 11-11-8.
//  Copyright 2011年 - -. All rights reserved.
//

#import "SceneManager.h"
#define TransDuration 0.7f
@interface SceneManager()
+ (CCScene *) wrap: (CCLayer *) layer;
+ (void) go:(CCLayer *)layer back:(int)flg;

@end

@implementation SceneManager


+(BOOL)CheckLanguage{
    NSUserDefaults *page;
	page =[NSUserDefaults standardUserDefaults];
    return [page boolForKey:@"language"];
    // YES 中文
    // NO 英文

}
+(BOOL)CheckGame{
    NSUserDefaults *page;
	page =[NSUserDefaults standardUserDefaults];
    int x = [page integerForKey:@"game"];
    return x;
}



+ (void)call_Cover:(int)flg{
	CCLayer *cover = [Scene_Cover node];
	[SceneManager go:cover back:flg];
}

+ (void)call_game:(int)flg{
	CCLayer *game = [youxi node];
	[SceneManager go:game back:flg];
}

+ (void)call_Oi:(int)flg{
	CCLayer *oi = [Oi node];
	[SceneManager go:oi back:flg];
}
+ (void)call_more:(int)flg{
	CCLayer *more = [moreLayer node];
	[SceneManager go:more back:flg];
}

+ (void)call_TitlePage:(int)flg{
    CCLayer *pageLayer = [Scene_TitlePage node];
    [SceneManager go:pageLayer back:flg];

}
+ (void)call_Preface:(int)flg{
    CCLayer *pageLayer = [Scene_Preface node];
    [SceneManager go:pageLayer back:flg];

}
+(void)call_Page_1:(int)flg{
    CCLayer *pageLayer = [Scene_Page_1 node];
    [SceneManager go:pageLayer back:flg];
    
}

+(void)call_Page_2:(int)flg{
    CCLayer *pageLayer = [Scene_Page_2 node];
    [SceneManager go:pageLayer back:flg];
    
}

+(void)call_Page_3:(int)flg{
    CCLayer *pageLayer = [Scene_Page_3 node];
    [SceneManager go:pageLayer back:flg];
    
}
+(void)call_Page_4:(int)flg{
    CCLayer *pageLayer = [Scene_Page_4 node];
    [SceneManager go:pageLayer back:flg];
    
}

+ (void)call_Page_5:(int)flg{
	CCLayer *scene_Page5 = [Scene_Page_5 node];
	[SceneManager go:scene_Page5 back:flg];
}
+ (void)call_Page_6:(int)flg{
	CCLayer *scene_Page6 = [Scene_Page_6 node];
	[SceneManager go:scene_Page6 back:flg];
}
+ (void)call_Page_7:(int)flg{
	CCLayer *scene_Page7 = [Scene_Page_7 node];
	[SceneManager go:scene_Page7 back:flg];
}
+ (void)call_Page_8:(int)flg{
	CCLayer *scene_Page8 = [Scene_Page_8 node];
	[SceneManager go:scene_Page8 back:flg];
}
+ (void)call_Page_9:(int)flg{
	CCLayer *scene_Page9 = [Scene_Page_9 node];
	[SceneManager go:scene_Page9 back:flg];
}
 
+ (void)call_Page_10:(int)flg{
	CCLayer *scene_Page10 = [Scene_Page_10 node];
	[SceneManager go:scene_Page10 back:flg];
}
+ (void)call_Page_11:(int)flg{
	CCLayer *scene_Page11 = [Scene_Page_11 node];
	[SceneManager go:scene_Page11 back:flg];
}
+ (void)call_Page_12:(int)flg{
	CCLayer *scene_Page12 = [Scene_Page_12 node];
	[SceneManager go:scene_Page12 back:flg];
}

+(void)call_Page_13:(int)flg{
    CCLayer *page13Layer = [Scene_Page_13 node];
    [SceneManager go:page13Layer back:flg];
}
+(void)call_Page_14:(int)flg{
    CCLayer *page14Layer = [Scene_Page_14 node];
    [SceneManager go:page14Layer back:flg];
}
+(void)call_Page_Over:(int)flg{
    CCLayer *over = [overScene node];
    [SceneManager go:over back:flg];
}
+(void)pagingOfIndex:(int)index back:(int)flg{
    
    switch (flg) {
        case TransitionFadeTR:
            index = index -1;
            break;
        case TransitionFadeBL:
            index = index +1;

//            if (index ==15) {
//                index = -3;
//            }
            break;
        default:
            break;
    }

    
    switch (index) {
        case -3:
            [SceneManager call_Cover:flg];
            break;
        case -2:
            [SceneManager call_Oi:flg];
            break;

        case -1:
            [SceneManager call_TitlePage:flg];
            break;
        case 0:
            [SceneManager call_Preface:flg];
            break;

        case 1:
            [SceneManager call_Page_1:flg];
            break;
        case 2:
            [SceneManager call_Page_2:flg];
            break;
        case 3:
            [SceneManager call_Page_3:flg];
            break;
        case 4:
            [SceneManager call_Page_4:flg];
            break;
        case 5:
            [SceneManager call_Page_5:flg];
            break;
        case 6:
            [SceneManager call_Page_6:flg];
            break;
        case 7:
            [SceneManager call_Page_7:flg];
            break;
        case 8:
            [SceneManager call_Page_8:flg];
            break;
        case 9:
            [SceneManager call_Page_9:flg];
            break;
        case 10:
            [SceneManager call_Page_10:flg];
            break;
        case 11:
            [SceneManager call_Page_11:flg];
            break;
        case 12:
            [SceneManager call_Page_12:flg];
            break;
        case 13:
            [SceneManager call_Page_13:flg];
            break;
        case 14:
            [SceneManager call_Page_14:flg];
            break;
         case 15:
            [SceneManager call_Page_Over:flg];
            break;
//        case 16:
//            [SceneManager call_Cover:flg];
//            break;

        default:
            break;
    }
    
    




}

+ (void) go:(CCLayer *)layer back:(int)flg{
	CCDirector *director = [CCDirector sharedDirector];
	CCScene *newScene = [SceneManager wrap:layer];
	if ([director runningScene]) {
        if (flg == TransitionCrossFade) {
            [director replaceScene:[CCTransitionCrossFade transitionWithDuration:TransDuration scene:newScene]];
        }
//        else if (flg == TransitionPageTurnBack){
//            [director replaceScene:[CCTransitionPageTurn transitionWithDuration:TransDuration scene:newScene backwards:YES]];
//        }
//        else if (flg == TransitionPageTurnFront){
//            [director replaceScene:[CCTransitionPageTurn transitionWithDuration:TransDuration scene:newScene backwards:NO]];
//        }
       else if (flg == TransitionFadeTR){
            [director replaceScene:[CCTransitionFadeTR transitionWithDuration:TransDuration scene:newScene]];
        }
        else if (flg == TransitionFadeBL){
            [director replaceScene:[CCTransitionFadeBL transitionWithDuration:TransDuration scene:newScene]];
        }


	}
	else {
		[director runWithScene:newScene];
	}
}

+ (CCScene *) wrap: (CCLayer *) layer{
	CCScene *newScene = [CCScene node];
	[newScene addChild: layer];
	return newScene;
}



@end
