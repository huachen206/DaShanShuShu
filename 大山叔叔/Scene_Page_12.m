//
//  Scene_Page_12.m
//  daShan
//
//  Created by edwardair on 11-12-23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Scene_Page_12.h"
#import "SceneManager.h"

@implementation Scene_Page_12
- (void)playSoundEffect:(NSString *)string playOrStop:(BOOL)pS{
    if (pS) {
        soundBk = (NSNumber *)[[SimpleAudioEngine sharedEngine] playEffect:string];
    }
    else {
        [[SimpleAudioEngine sharedEngine] unloadEffect:string];
    }
}
- (void)transitionNumberAnimation:(NSString *)foreverOrOne{
    CCSprite *transition_ = (CCSprite *)[self getChildByTag:300];
    NSMutableArray *animFrame = [NSMutableArray array];
    for (int i = 1; i < 17; i++) {
        [animFrame addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"1%04d.png",i]]];
    }
    CCAnimation *animation_trans = [CCAnimation animationWithFrames:animFrame];
    id action = [CCAnimate actionWithDuration:1.f animation:animation_trans restoreOriginalFrame:NO];
    if ([foreverOrOne isEqualToString:@"forever"]) {
        [transition_ runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, [CCDelayTime actionWithDuration:5], nil]]];
    }
    else if ([foreverOrOne isEqualToString:@"One"]){
        [transition_ runAction:action];
    }
}

- (id)init{
    if ((self == [super init])) {
        clickState = 0;
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        CGPoint p = ccp(size.width/2, size.height/2);
        
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache removeUnusedSpriteFrames];
        [cache addSpriteFramesWithFile:@"p13_sp.plist" textureFile:@"p13_sp.pvr.ccz"];
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];
        CCSprite *bk = [CCSprite spriteWithFile:@"p13_bk.pvr.ccz"];
        bk.position = p;
        [self addChild:bk];
        
        CCSprite *windowClose = [CCSprite spriteWithSpriteFrameName:@"windowClose.png"];
        CCSprite *windowOpen = [CCSprite spriteWithSpriteFrameName:@"windowOpen.png"];
        windowClose.tag = 1;
        windowOpen.tag = 2;
        windowClose.position = ccp(744, 433);
        windowOpen.position = ccp(744, 430);
        windowOpen.visible = NO;
        [self addChild:windowClose];
        [self addChild:windowOpen];
        
        CCSprite *hen = [CCSprite spriteWithSpriteFrameName:@"hen.png"];
        hen.position = ccp(727, 457);
        hen.tag = 5;
        hen.scale = 0;
//        hen.visible = NO;
        [self addChild:hen];

        CCSprite *cat0 = [CCSprite spriteWithSpriteFrameName:@"cat0001.png"];
        CCSprite *cat1 = [CCSprite spriteWithSpriteFrameName:@"cat0002.png"];
        cat0.tag = 3;
        cat1.tag = 4;
        cat0.position = ccp(207, 159);
        cat1.position = ccp(203, 201);
        cat1.visible = NO;
        [self addChild:cat0];
        [self addChild:cat1];
        
        [cache addSpriteFramesWithFile:@"transitionNumber.plist" textureFile:@"transitionNumber.pvr.ccz"];

        CCSprite *transition_ = [CCSprite spriteWithSpriteFrameName:@"10001.png"];
        transition_.position = ccp(980, 48);
        [self addChild:transition_ z:5 tag:300];
        [self transitionNumberAnimation:@"forever"];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"12" fontName:@"KaiTi_GB2312" fontSize:28];
        label.color = ccc3(30, 45, 79);
        label.position = ccp(980, 30);
        [self addChild:label z:5];

        [self textAdd];
    }
    return self;
}
- (void)textAdd{
    [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundBk];
    
    language = [SceneManager CheckLanguage];
    Text *text;
    if (!language) {
        NSString *tmp1 = [NSString stringWithFormat:@"When the bread was ready, the Little Red Hen asked. \"Who will help me eat this bread?\" "];
        text = [Text initWithString:tmp1 isChinese:NO wordNumberOfLine:30 wordPosition:ccp(260, 630)];
        [self playSoundEffect:@"p12_soundE.wav" playOrStop:YES];
    }
    else {
        NSString *tmp1 = [NSString stringWithFormat:@"面包做好之后，小红母鸡又问：“谁来帮我吃这些面包啊？”"];
        text = [Text initWithString:tmp1 isChinese:YES wordNumberOfLine:12 wordPosition:ccp(260, 630)];
        [self playSoundEffect:@"p12_soundC.wav" playOrStop:YES];
    }
    text.text_delegate = self;

    [self addChild:text z:1 tag:101];

}
- (void)onEnter {
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    //    self.isTouchEnabled = YES;
    [super onEnter];
}

- (void)onExit{
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [super onExit];
}
- (void)dianJiAction{
    CCSprite *windowClose = (CCSprite *)[self getChildByTag:1];
    CCSprite *windowOpen = (CCSprite *)[self getChildByTag:2];
    CCSprite *cat0 = (CCSprite *)[self getChildByTag:3];
    CCSprite *cat1 = (CCSprite *)[self getChildByTag:4];
    CCSprite *hen = (CCSprite *)[self getChildByTag:5];
    
    windowOpen.visible = !windowOpen.visible;
    windowClose.visible = !windowClose.visible;
    //        [hen stopAllActions];
    cat0.visible = !cat0.visible;
    cat1.visible = !cat1.visible;
    
    if (!clickState) clickState = 1;
    else             clickState = 0;
    [hen runAction:[CCScaleTo actionWithDuration:0 scale:clickState]];

}
- (void)delayAction{
    [self dianJiAction];
}
-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{ 
    return YES;
}
-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    
    if (abs(translation.x)>25&& CGRectContainsPoint(slide_rect, touchLocation)) {
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(dianJiAction) object:self];
        [self cleanup];
        if (language) {
            [self playSoundEffect:@"p12_soundC.wav" playOrStop:NO];
        }
        else {
            [self playSoundEffect:@"p12_soundE.wav" playOrStop:NO];
        }

        if (translation.x < 0) {
            [SceneManager pagingOfIndex:12 back:TransitionFadeBL];
        }
        else {
            [SceneManager pagingOfIndex:12 back:TransitionFadeTR];
        }
    }

//    CCSprite *test = (CCSprite *)[self getChildByTag:5];
//    test.position = ccp(test.position.x+translation.x, test.position.y+translation.y);
//    CCLOG(@"test:::::%f,%f",test.position.x,test.position.y);        
}
- (void)delegateTextAdd{
    [self textAdd];
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [touch locationInView:[touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation]; 
    CCSprite *transition_ = (CCSprite *)[self getChildByTag:300];

    CCSprite *windowClose = (CCSprite *)[self getChildByTag:1];
    if (CGRectContainsPoint(windowClose.boundingBox, touchLocation) && (!clickState)) {
//        clickState = 1;
        [self dianJiAction];
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundHen];
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundCat];
        soundHen = (NSNumber *)[[SimpleAudioEngine sharedEngine] playEffect:@"hen.wav"];
        soundCat = (NSNumber *)[[SimpleAudioEngine sharedEngine] playEffect:@"cat0.wav"];
        [self performSelector:@selector(delayAction) withObject:self afterDelay:5.f];
    }
    else if (CGRectContainsPoint(transition_.boundingBox, touchLocation)){
        [self transitionNumberAnimation:@"One"];
    }


}
- (void)dealloc{
    [super dealloc];
}
@end
