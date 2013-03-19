//
//  Oi.m
//  大山叔叔
//
//  Created by Hua Chen on 12-1-9.
//  Copyright 2012年 - -. All rights reserved.
//

#import "Oi.h"
#define pageIndex -2


@implementation Oi
-(id) init
{
	if( (self=[super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];

        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
        CCSprite *bk = [CCSprite spriteWithFile:@"操作2.png"];
        bk.position = ccp(size.width/2, size.height/2);
        [self addChild:bk];
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
    if (abs(translation.x)>25 && CGRectContainsPoint(slide_rect, touchLocation)) {
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
