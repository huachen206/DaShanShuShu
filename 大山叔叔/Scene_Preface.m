//
//  Scene_Preface.m
//  大山叔叔
//
//  Created by Hua Chen on 11-12-22.
//  Copyright 2011年 - -. All rights reserved.
//

#import "Scene_Preface.h"
#define pageIndex 0


@implementation Scene_Preface
-(id) init
{
	if( (self=[super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];
        CCSprite *bk = [CCSprite spriteWithFile:@"preface_bk.pvr.ccz"];
        bk.position = ccp(size.width/2, size.height/2);
        [self addChild:bk];
        
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache addSpriteFramesWithFile:@"前言2.0.plist" textureFile:@"前言2.0.pvr.ccz"];
        
        wz1 = [CCSprite spriteWithSpriteFrameName:@"前言1.png"];
        wz1.position = ccp(512, 390);
        [self addChild:wz1];
        
        wz2 = [CCSprite spriteWithSpriteFrameName:@"前言2.png"];
        wz2.position = ccp(512, 390);
        [self addChild:wz2];
        wz2.visible = NO;
        
        wz3 = [CCSprite spriteWithSpriteFrameName:@"前言3.png"];
        wz3.position = ccp(512, 390);
        [self addChild:wz3];
        wz3.visible = NO;

        
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
        
        CCSprite *readBook = [CCSprite spriteWithFile:@"小鸡看书.png"];
        readBook.position = ccp(920, 124);
        [self addChild:readBook];
        

        [cache addSpriteFramesWithFile:@"egg_chicken.plist" textureFile:@"egg_chicken.pvr.ccz"];

        eggFrame_1 = [[NSMutableArray alloc] init];
        for (int i = 0; i<= 6; i++) {
            [eggFrame_1 addObject:[cache spriteFrameByName:[NSString stringWithFormat:@"littlechicken_1_%03d.png",i]]];
        }

        eggFrame_2 = [[NSMutableArray alloc] init];
        for (int i = 0; i<= 6; i++) {
            [eggFrame_2 addObject:[cache spriteFrameByName:[NSString stringWithFormat:@"littlechicken_2_%03d.png",i]]];
        }
        eggFrame_3 = [[NSMutableArray alloc] init];
        for (int i = 0; i<= 6; i++) {
            [eggFrame_3 addObject:[cache spriteFrameByName:[NSString stringWithFormat:@"littlechicken_3_%03d.png",i]]];
        }

        egg1 = [CCSprite spriteWithSpriteFrameName:@"littlechicken_1_000.png"];
        egg1.position = ccp(188, 95);
        [self addChild:egg1];
        
        egg2 = [CCSprite spriteWithSpriteFrameName:@"littlechicken_2_000.png"];
        egg2.position = ccp(278, 95);
        [self addChild:egg2];

        egg3 = [CCSprite spriteWithSpriteFrameName:@"littlechicken_3_000.png"];
        egg3.position = ccp(368, 95);
        [self addChild:egg3];


        
        
        

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
    if (CGRectContainsPoint(egg1.boundingBox, touchLocation)) {
        [egg1 stopAllActions];
        [egg2 stopAllActions];
        [egg3 stopAllActions];
        [egg1 setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"littlechicken_1_006.png"]];
        [egg2 setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"littlechicken_2_001.png"]];
        [egg3 setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"littlechicken_3_001.png"]];
        [egg1 runAction:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:eggFrame_1 delay:1.f/12]]];
         wz1.visible = YES;
        wz2.visible = NO;
        wz3.visible = NO;
        
    }
    else if (CGRectContainsPoint(egg2.boundingBox, touchLocation)) {
        [egg1 stopAllActions];
        [egg2 stopAllActions];
        [egg3 stopAllActions];        [egg1 setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"littlechicken_1_001.png"]];
        [egg2 setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"littlechicken_2_006.png"]];
        [egg3 setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"littlechicken_3_001.png"]];       
        [egg2 runAction:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:eggFrame_2 delay:1.f/12]]];
        wz1.visible = NO;
        wz2.visible = YES;
        wz3.visible = NO;

    }
    else if (CGRectContainsPoint(egg3.boundingBox, touchLocation)) {
        [egg1 stopAllActions];
        [egg2 stopAllActions];
        [egg3 stopAllActions];        [egg1 setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"littlechicken_1_001.png"]];
        [egg2 setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"littlechicken_2_001.png"]];
        [egg3 setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"littlechicken_3_006.png"]];           
        [egg3 runAction:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:eggFrame_3 delay:1.f/12]]];

        wz1.visible = NO;
        wz2.visible = NO;
        wz3.visible = YES;
    }

    
    CCLOG(@"x:%f    Y:%f",touchLocation.x,touchLocation.y );    
}
-(void)dealloc{
    [eggFrame_1 release];
    [eggFrame_2 release];
    [eggFrame_3 release];
    
    [super dealloc];
}


@end
