//
//  Scene_Page_6.m
//  dashan
//
//  Created by Liu Yang on 11-12-22.
//  Copyright 2011年 Jiangsu  Zhongka  Educational  Science and   Technology  Co.，Ltd. All rights reserved.
//

#import "Scene_Page_6.h"
#import "SimpleAudioEngine.h"
#import "SceneManager.h"
@implementation Scene_Page_6
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

-(id) init
{
    if( (self=[super init])) {
        bol1 = YES;
        [[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
        cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache addSpriteFramesWithFile:@"p6_bk.plist" textureFile:@"p6_bk.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"p6_me.plist" textureFile:@"p6_me.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"transitionNumber.plist" textureFile:@"transitionNumber.pvr.ccz"];
        CCSprite *bk = [CCSprite spriteWithSpriteFrameName:@"p6-bk.png"];
        bk.position = ccp(512, 384);
        [self addChild:bk];
        
        CCSprite *transition_ = [CCSprite spriteWithSpriteFrameName:@"10001.png"];
        transition_.position = ccp(980, 48);
        [self addChild:transition_ z:5 tag:300];
        [self transitionNumberAnimation:@"forever"];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"6" fontName:@"KaiTi_GB2312" fontSize:28];
        label.color = ccc3(30, 45, 79);
        label.position = ccp(980, 30);
        [self addChild:label z:5];
        
        CCSprite *bk1 = [CCSprite spriteWithSpriteFrameName:@"mz.png"];
        bk1.position = ccp(725, 410);
        bk1.tag = 1;
        [self addChild:bk1];
        
        CCSprite *bk2 = [CCSprite spriteWithSpriteFrameName:@"yf.png"];
        bk2.anchorPoint = CGPointMake(0.8f, 1.f);
        bk2.position = ccp(796, 375);
        bk2.tag = 2;
        [self addChild:bk2];
        
        CCSprite *bk3 = [CCSprite spriteWithSpriteFrameName:@"ge-01.png"];
        bk3.position = ccp(258, 400);
        bk3.tag = 3;
        [self addChild:bk3];

        CCSprite *bk4 = [CCSprite spriteWithSpriteFrameName:@"me-01.png"];
        bk4.position = ccp(205, 365);
        bk4.tag = 4;
        [self addChild:bk4];
        
        CCSprite *bk5 = [CCSprite spriteWithSpriteFrameName:@"q.png"];
        bk5.position = ccp(225, 58);
        bk5.tag = 5;
        [self addChild:bk5];
        
        CCSprite *bk6 = [CCSprite spriteWithSpriteFrameName:@"wn-01.png"];
        bk6.position = ccp(838, 168);
        bk6.tag = 6;
        [self addChild:bk6];
        
        CCSprite *bk7 = [CCSprite spriteWithFile:@"y.png"];
        bk7.position = ccp(470, 465);
        bk7.scale = 0.7;
        bk7.tag = 7;
        [self addChild:bk7];
        
        id act = [CCMoveTo actionWithDuration:2.f position:ccp(505, 600)];
        id act2 = [CCScaleTo actionWithDuration:2.f scale:1.2];
        id spa  = [CCSpawn actions:act,act2, nil];
        id act1 = [CCMoveTo actionWithDuration:0.f position:ccp(470, 465)];
        [bk7 runAction:[CCRepeatForever actionWithAction:[CCSequence actions:[CCSpawn actions:[CCFadeOut actionWithDuration:2.f],spa, nil],[CCDelayTime actionWithDuration:0.5f],[CCScaleTo actionWithDuration:0.f scale:0.7],act1,[CCShow action], nil]]];
        
        CCSprite *bk8 = [CCSprite spriteWithFile:@"sy.png"];
        bk8.position = ccp(682, 515);
        bk8.tag = 8;
        bk8.visible = NO;
        [self addChild:bk8];
        
        CCSprite *bk9 = [CCSprite spriteWithFile:@"sy.png"];
        bk9.position = ccp(806, 470);
        bk9.tag = 9;
        bk9.visible = NO;
        [self addChild:bk9];
        
        CCSprite *bk10 = [CCSprite spriteWithFile:@"sy.png"];
        bk10.position = ccp(896, 340);
        bk10.tag = 10;
        bk10.visible = NO;
        [self addChild:bk10];
        [self textAdd];
//        NSString *tmp1 = [NSString stringWithFormat:@"\"Not me, ”said the Goose.                       \"Not me,either,\"said the Duck. "];
//        Text *text = [Text initWithString:tmp1 isChinese:NO wordNumberOfLine:23 wordPosition:ccp(846, 638)];
//        [self addChild:text z:1 tag:101];
    }
    return self;
}
-(void)shengying{
        [[SimpleAudioEngine sharedEngine] playEffect:@"shush.mp3"];
}
-(void)quanzhi{
    bol1 =YES;
}
-(void)ying{
    [self playSoundEffect:@"6-2-yin.wav" playOrStop:YES];
}
-(void)ying1{
    [self playSoundEffect:@"6-2-zhong.wav" playOrStop:YES];
}
-(void)yazi2{
    CCSprite *sprite3 =  (CCSprite *)[self getChildByTag:3];
    CCSprite *sprite7 =  (CCSprite *)[self getChildByTag:7];
    [sprite3 setDisplayFrame:[cache spriteFrameByName:@"ge-01.png"]];
    sprite7.visible = YES;
    [sprite7 resumeSchedulerAndActions];
}
-(void)yazi1{
    CCSprite *sprite3 =  (CCSprite *)[self getChildByTag:3];
    [sprite3 setDisplayFrame:[cache spriteFrameByName:@"ge-03.png"]];
}
-(void)yazi{
    CCSprite *sprite7 =  (CCSprite *)[self getChildByTag:7];
    CCSprite *sprite3 =  (CCSprite *)[self getChildByTag:3];
    [sprite3 setDisplayFrame:[cache spriteFrameByName:@"ge-02.png"]];
    sprite7.visible = NO;
    [sprite7 pauseSchedulerAndActions];
}
- (void)textAdd{
    [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundBk];
    language = [SceneManager CheckLanguage];
    Text *text;
    if (!language) {
        NSString *tmp1 = [NSString stringWithFormat:@"\"Not me, ”said the Goose.                     \"Not me,either,\"said the Duck. "];
        text = [Text initWithString:tmp1 isChinese:NO wordNumberOfLine:23 wordPosition:ccp(846, 638)];
        [self playSoundEffect:@"6-1-yin.wav" playOrStop:YES];
       [self performSelector:@selector(ying)  withObject:self afterDelay:5.4f];
    }
    else {
        NSString *tmp1 = [NSString stringWithFormat:@"“我不去。”鹅说。    “我也不去。”鸭子说。"];
        text = [Text initWithString:tmp1 isChinese:YES wordNumberOfLine:13 wordPosition:ccp(804, 640)];
        [self playSoundEffect:@"6-1-zhong.wav" playOrStop:YES];
        [self performSelector:@selector(ying1)  withObject:self afterDelay:3.f];
    }
    text.text_delegate = self;
    [self addChild:text z:1 tag:101];
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
        [self cleanup];
            [self playSoundEffect:@"6-1-zhong.wav" playOrStop:NO];
            [self playSoundEffect:@"6-1-yin.wav" playOrStop:NO];
            [self playSoundEffect:@"6-2-yin.wav" playOrStop:NO];
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(shengying) object:self];
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(quanzhi) object:self];
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(ying) object:self];
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(ying1) object:self];
        if (translation.x < 0) {
            [SceneManager pagingOfIndex:6 back:TransitionFadeBL];
            
        }
        else {
            [SceneManager pagingOfIndex:6 back:TransitionFadeTR];
        }
    }

} 
- (void)delegateTextAdd{
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(ying) object:self];
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(ying1) object:self];
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(yazi) object:self];
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(yazi1) object:self];
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(yazi2) object:self];
    [self textAdd];
}
-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
        CGPoint location = [touch locationInView:[touch view]];
        location = [[CCDirector sharedDirector] convertToGL:location];  
        CCLOG(@"{%f,%f},",location.x,location.y );
    CCSprite *sprite1 = (CCSprite *)[self getChildByTag:1];
    CCSprite *sprite2 = (CCSprite *)[self getChildByTag:2];
//    CCSprite *sprite3 = (CCSprite *)[self getChildByTag:3];
    CCSprite *sprite4 = (CCSprite *)[self getChildByTag:4];
    CCSprite *sprite5 = (CCSprite *)[self getChildByTag:5];
    CCSprite *sprite6 = (CCSprite *)[self getChildByTag:6];
    CCSprite *sprite8 = (CCSprite *)[self getChildByTag:8];
    CCSprite *sprite9 = (CCSprite *)[self getChildByTag:9];
    CCSprite *sprite10 = (CCSprite *)[self getChildByTag:10];
    CCSprite *sprite300 = (CCSprite *)[self getChildByTag:300];
    id act = [CCRotateBy actionWithDuration:0.3f angle:350];
    id act1 = [CCMoveTo actionWithDuration:0.4f position:ccp(602, 55)];
    id act10 = [CCMoveTo actionWithDuration:0.4f position:ccp(815, 290)];
    id act2 = [CCMoveTo actionWithDuration:0.8f position:ccp(438, 605)];
    id act3 = [CCMoveTo actionWithDuration:0.4f position:ccp(614, 682)];
    id act4 = [CCRotateTo actionWithDuration:0.2f angle:20];
    id act5 = [CCRotateTo actionWithDuration:0.2f angle:0];
    id act6 = [CCRotateTo actionWithDuration:0.3f angle:20];
    id act7 = [CCRotateTo actionWithDuration:0.3f angle:0];
    id seq1 = [CCSequence actions:act4,act5, nil];
    id seq2 = [CCSequence actions:act6,act7, nil];
    id seq  = [CCSequence actions:act1,act10,act2,act3,[CCHide action],[CCDelayTime actionWithDuration:0.5f],[CCMoveTo actionWithDuration:0.f position:ccp(225, 58)],[CCShow action], nil];
    id act8 = [CCMoveTo actionWithDuration:0.4f position:ccp(825, 20)];
    id act9 = [CCMoveTo actionWithDuration:1.4f position:ccp(838, 168)];
    id act11 = [CCRotateTo actionWithDuration:1.5f angle:120];
    id act12 = [CCRotateTo actionWithDuration:1.5f angle:0];
    id act13 = [CCMoveTo actionWithDuration:3.f   position:ccp(570, -50)];
    id seq3 =[CCSequence actions:act11,act12, nil];
    
    id act14 = [CCRotateTo actionWithDuration:1.5f angle:190];
    id act15 = [CCRotateTo actionWithDuration:1.5f angle:30];
    id act16 = [CCMoveTo actionWithDuration:3.f   position:ccp(855, -50)];
    id seq4 =[CCSequence actions:act14,act15, nil];
    
    id act17 = [CCRotateTo actionWithDuration:1.5f angle:190];
    id act18 = [CCRotateTo actionWithDuration:1.5f angle:-10];
    id act19 = [CCMoveTo actionWithDuration:3.f   position:ccp(677, -50)];
    id seq5 =[CCSequence actions:act17,act18, nil];
    
    if (CGRectContainsPoint(CGRectMake(2, 68, 350, 550), location)) {
//        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
//        sound = @"6-2-zhong.wav";
//        soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
        if (bol1 == YES) {
            NSMutableArray *animFrames_b1 = [NSMutableArray array];
            for(int i = 1; i < 6; i++) {
                // Obtain frames by alias name
                CCSpriteFrame *frame1 = [cache spriteFrameByName:[NSString stringWithFormat:@"me-0%d.png",i]];
                [animFrames_b1 addObject:frame1];
            }
            CCAnimation *animation_b1 = [CCAnimation animationWithFrames:animFrames_b1];
            [sprite4 runAction:[CCAnimate actionWithDuration:0.3f animation:animation_b1 restoreOriginalFrame:YES]];
            [sprite5 runAction:[CCSpawn actions:seq,[CCRepeat actionWithAction:act times:7],nil]];
            [sprite1 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.9f],[CCRepeat actionWithAction:seq1 times:2], nil]];
            [sprite2 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.9f],[CCRepeat actionWithAction:seq2 times:1], nil]];
            [[SimpleAudioEngine sharedEngine] playEffect:@"grf1.mp3"];
            
            NSMutableArray *animFrames_b = [NSMutableArray array];
            for(int i = 1; i < 3; i++) {
                // Obtain frames by alias name
                CCSpriteFrame *frame = [cache spriteFrameByName:[NSString stringWithFormat:@"wn-0%d.png",i]];
                [animFrames_b addObject:frame];
            }
            CCAnimation *animation_b = [CCAnimation animationWithFrames:animFrames_b];
            id action = [CCAnimate actionWithDuration:0.6f animation:animation_b restoreOriginalFrame:YES];
            [sprite6 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.9f],act8,[CCDelayTime actionWithDuration:0.4f],[CCSpawn actions:[CCRepeat actionWithAction:action times:2],act9, nil], nil]];
            [sprite8 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.8f],[CCShow action],[CCSpawn actions:seq3,act13,nil],[CCDelayTime actionWithDuration:0.8f],[CCHide action],[CCMoveTo actionWithDuration:0.f position:ccp(682, 515)], nil]];
            [sprite9 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.8f],[CCShow action],[CCSpawn actions:seq4,act16,nil],[CCDelayTime actionWithDuration:0.8f],[CCHide action],[CCMoveTo actionWithDuration:0.f position:ccp(806, 470)], nil]];
            [sprite10 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.8f],[CCShow action],[CCSpawn actions:seq5,act19,nil],[CCDelayTime actionWithDuration:0.8f],[CCHide action],[CCMoveTo actionWithDuration:0.f position:ccp(896, 340)], nil]];

            [self   performSelector:@selector(yazi) withObject:self afterDelay:1.3f];
            [self   performSelector:@selector(yazi1) withObject:self afterDelay:1.3f+0.2f];
            [self   performSelector:@selector(yazi2) withObject:self afterDelay:1.3f+3.f];
            [self   performSelector:@selector(shengying) withObject:self afterDelay:0.8f];
            bol1 = NO;
            [self   performSelector:@selector(quanzhi) withObject:self afterDelay:4.f];
        }
            }
        else if (CGRectContainsPoint(sprite300.boundingBox, location)){
        [self transitionNumberAnimation:@"One"];
    }
}
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
