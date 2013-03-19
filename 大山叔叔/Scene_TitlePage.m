//
//  Scene_TitlePage.m
//  大山叔叔
//
//  Created by Hua Chen on 11-12-22.
//  Copyright 2011年 - -. All rights reserved.
//

#import "Scene_TitlePage.h"
#define pageIndex -1

@implementation Scene_TitlePage
-(id) init
{
	if( (self=[super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];

        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];
        CCSprite *bk = [CCSprite spriteWithFile:@"title_bk.pvr.ccz"];
        bk.position = ccp(size.width/2, size.height/2);
        [self addChild:bk];
        
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache addSpriteFramesWithFile:@"foxandchicken.plist" textureFile:@"foxandchicken.pvr.ccz"];
        
        NSMutableArray *foxFrame = [NSMutableArray array];
        for (int i = 0; i<= 15; i++) {
            [foxFrame addObject:[cache spriteFrameByName:[NSString stringWithFormat:@"fox_run%03d.png",i]]];
        }
        
        CCSprite *foxRun = [CCSprite spriteWithSpriteFrameName:@"fox_run000.png"];
        foxRun.position = ccp(142,160);
        [self addChild:foxRun];
        [foxRun runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:foxFrame delay:1.f/10]]]];
        
        
        
        NSMutableArray *chickenFrame = [NSMutableArray array];
        for (int i = 0; i<= 11; i++) {
            [chickenFrame addObject:[cache spriteFrameByName:[NSString stringWithFormat:@"chicken_run%03d.png",i]]];
        }
        
        CCSprite *chickenRun = [CCSprite spriteWithSpriteFrameName:@"chicken_run000.png"];
        chickenRun.position = ccp(850,125);
        [self addChild:chickenRun];
        [chickenRun runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:chickenFrame delay:1.f/10]]]];

        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];


        
    }
    return self;
}


- (void)onEnter {
    
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    self.isTouchEnabled = YES;
    [super onEnter];
    
}

- (void)onExit{
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [super onExit];
}

#pragma mark -
#pragma mark touch事件
-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
    return YES;
    
}
- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    CCLOG(@"x:%f   y:%f",translation.x,translation.y );
    CCLOG(@"%d",abs(translation.x ));
    if (abs(translation.x)>25&& CGRectContainsPoint(slide_rect, touchLocation)) {
        [self cleanup];
        if (translation.x < 0) {
            [SceneManager pagingOfIndex:pageIndex back:TransitionFadeBL];
        }
        else {
            [SceneManager pagingOfIndex:pageIndex back:TransitionFadeTR];
        }
    }
    
}
- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [touch locationInView:[touch view]];
	touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    CCLOG(@"x:%f    Y:%f",touchLocation.x,touchLocation.y );    
}




@end
