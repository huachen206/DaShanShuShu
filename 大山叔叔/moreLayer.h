//
//  moreLayer.h
//  XiMenBao
//
//  Created by Wei Haoyu on 11-8-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"
@interface moreLayer : CCLayer {
	CCSprite *bk;
	NSUserDefaults *page;
	NSNumber *soundId;
}	

// returns a CCScene that contains the HelloWorldLayer as the only child

-(void)menu_init;
@end //moreLayer
