//
//  Scene_Page_8.m
//  dashan
//
//  Created by Liu Yang on 11-12-23.
//  Copyright 2011年 Jiangsu  Zhongka  Educational  Science and   Technology  Co.，Ltd. All rights reserved.
//

#import "Scene_Page_8.h"
#import "SimpleAudioEngine.h"
#import "SceneManager.h"
@implementation Scene_Page_8
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
        num = 0;
        
        bol1 = YES;
        bol2 = YES;
        bol3 = NO;
        bol4 = NO;
        bol5 = NO;
        bol6 = NO;
        [[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
        cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache addSpriteFramesWithFile:@"p8_bk.plist" textureFile:@"p8_bk.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"p8_xj.plist" textureFile:@"p8_xj.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"transitionNumber.plist" textureFile:@"transitionNumber.pvr.ccz"];
        CCSprite *bk = [CCSprite spriteWithSpriteFrameName:@"p8_bk.png"];
        bk.position = ccp(512, 384);
        [self addChild:bk ];
        
        CCSprite *transition_ = [CCSprite spriteWithSpriteFrameName:@"10001.png"];
        transition_.position = ccp(980, 48);
        [self addChild:transition_ z:5 tag:300];
        [self transitionNumberAnimation:@"forever"];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"8" fontName:@"KaiTi_GB2312" fontSize:28];
        label.color = ccc3(30, 45, 79);
        label.position = ccp(980, 30);
        [self addChild:label z:5];

        
        CCSprite *bk1 = [CCSprite spriteWithSpriteFrameName:@"mlp.png"];
        bk1.anchorPoint = CGPointMake(0.8f, 0.1f);
        bk1.position = ccp(905, 155);
        bk1.tag = 1;
        [self addChild:bk1 z:1];
        id act = [CCRotateTo actionWithDuration:1.9f angle:-10];
        id act1 = [CCRotateTo actionWithDuration:1.9f angle:0];
        id seq = [CCSequence actions:act,act1, nil];
        [bk1 runAction:[CCRepeatForever actionWithAction:seq]];
        
        CCSprite *bk2 = [CCSprite spriteWithSpriteFrameName:@"xiaoj_1.png"];
        bk2.position = ccp(430, 392);
        bk2.tag = 2;
        [bk1 addChild:bk2 z:2];
        NSMutableArray *animFrames = [NSMutableArray array];
        for(int i = 1; i < 3; i++) {
            // Obtain frames by alias name
            CCSpriteFrame *frame = [cache spriteFrameByName:[NSString stringWithFormat:@"xiaoj_%d.png",i]];
            [animFrames addObject:frame];
        }
        CCAnimation *animation = [CCAnimation animationWithFrames:animFrames];
        [bk2 runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithDuration:1.0f animation:animation restoreOriginalFrame:YES]]]; 
        
        CCSprite *bk3 = [CCSprite spriteWithSpriteFrameName:@"p8_xj_1.png"];
        bk3.position = ccp(295, 92);
        bk3.tag =3;
        [self addChild:bk3 z:2];
        NSMutableArray *animFrames_b1 = [NSMutableArray array];
        for(int i = 1; i < 3; i++) {
            // Obtain frames by alias name
            CCSpriteFrame *frame1 = [cache spriteFrameByName:[NSString stringWithFormat:@"p8_xj_%d.png",i]];
            [animFrames_b1 addObject:frame1];
        }
        CCAnimation *animation_b1 = [CCAnimation animationWithFrames:animFrames_b1];
        [bk3 runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithDuration:0.8f animation:animation_b1 restoreOriginalFrame:YES]]]; 
        
        CCSprite *bk4 = [CCSprite spriteWithSpriteFrameName:@"mj.png"];
        bk4.anchorPoint = CGPointMake(0.8f, 0.1f);
        bk4.position = ccp(905, 155);
        bk4.tag = 4;
        bk4.visible = NO;
        [self addChild:bk4 z:1];
        id act2 = [CCRotateTo actionWithDuration:1.9f angle:-10];
        id act3 = [CCRotateTo actionWithDuration:1.9f angle:0];
        id seq1 = [CCSequence actions:act2,act3, nil];
        [bk4 runAction:[CCRepeatForever actionWithAction:seq1]];
        
        CCSprite *bk5 = [CCSprite spriteWithSpriteFrameName:@"pz.png"];
        bk5.position = ccp(645, 250);
        bk5.tag = 5; 
        bk5.visible = NO;
        [self addChild:bk5 z:2];
        
        CCSprite *bk6 = [CCSprite spriteWithFile:@"mf.png"];
        bk6.position = ccp(262, 600);
        bk6.tag = 6;
        bk6.visible = NO;
        [self addChild:bk6 z:5];
        
        CCSprite *bk7 = [CCSprite spriteWithFile:@"mf.png"];
        bk7.position = ccp(765, 600);
        bk7.tag = 7;
        bk7.visible = NO;
        [self addChild:bk7 z:5];
        
        CCSprite *bk8 = [CCSprite spriteWithFile:@"mf.png"];
        bk8.position = ccp(248, 190);
        bk8.tag = 8;
        bk8.visible = NO;
        [self addChild:bk8 z:5];
        
        CCSprite *bk9 = [CCSprite spriteWithFile:@"mf.png"];
        bk9.position = ccp(790, 190);
        bk9.tag = 9;
        bk9.visible = NO;
        [self addChild:bk9 z:5];
        
        CCSprite *bk10 = [CCSprite spriteWithFile:@"mf.png"];
        bk10.position = ccp(505, 405);
        bk10.tag = 10;
        bk10.visible = NO;
        [self addChild:bk10 z:5];
        
        [self textAdd];
//        NSString *tmp1 = [NSString stringWithFormat:@"When the flour was ready she asked,\"Who will help me make some bread with this flour?\" "];
//        Text *text = [Text initWithString:tmp1 isChinese:NO wordNumberOfLine:40 wordPosition:ccp(288, 588)];
//        [self addChild:text z:1 tag:101];
    }
    return self;
}
-(void)zhuanzhi{
    CCSprite *sprite1 = (CCSprite *)[self getChildByTag:1];
    CCSprite *sprite4 = (CCSprite *)[self getChildByTag:4];
    CCSprite *sprite6 = (CCSprite *)[self getChildByTag:6];
    CCSprite *sprite7 = (CCSprite *)[self getChildByTag:7];
    CCSprite *sprite8 = (CCSprite *)[self getChildByTag:8];
    CCSprite *sprite9 = (CCSprite *)[self getChildByTag:9];
    CCSprite *sprite10 = (CCSprite *)[self getChildByTag:10];
    sprite1.visible = YES;
    sprite4.visible = NO;
    sprite6.visible = YES;
    sprite7.visible = YES;
    sprite8.visible = YES;
    sprite9.visible = YES;
    sprite10.visible = YES;
    
}
-(void)zhuanzhi1{
    bol1 = YES;
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
    
    CCSprite *sprite6 = (CCSprite *)[self getChildByTag:6];
    CCSprite *sprite7 = (CCSprite *)[self getChildByTag:7];
    CCSprite *sprite8 = (CCSprite *)[self getChildByTag:8];
    CCSprite *sprite9 = (CCSprite *)[self getChildByTag:9];
    CCSprite *sprite10 = (CCSprite *)[self getChildByTag:10];
    
    if (abs(translation.x) >30) {
        num++;
    }
    if (num == 3) {
        if (bol2 == YES) {
            sprite6.visible = NO;
            num = 0;
            bol2 = NO;
            bol3 = YES;
        }
    }
     if (num == 3) {
         if (bol3 == YES) {
             sprite7.visible = NO;
             num = 0;
             bol3 = NO;
             bol4 = YES;
         }
    }
     if (num == 3) {
         if (bol4 == YES) {
             sprite8.visible = NO;
             num = 0;
             bol4 = NO;
             bol5 = YES;
         }
    }
     if (num == 3) {
         if (bol5 == YES) {
             sprite9.visible = NO;
             num = 0;
             bol5 = NO;
             bol6 = YES;
         }
    }
     if (num == 3) {
         if (bol6 == YES) {
             sprite10.visible = NO;
             num = 0;
             bol6 = NO;
             bol2 = YES;
             [self   performSelector:@selector(zhuanzhi1) withObject:self afterDelay:2.f];
         }
    }
   else if (abs(translation.x)>25&& CGRectContainsPoint(slide_rect, touchLocation)) {
        [self cleanup];
       [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(zhuanzhi) object:self];
       [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(zhuanzhi1) object:self];
       [self playSoundEffect:@"zhong_8.wav" playOrStop:NO];
       [self playSoundEffect:@"ying_8.wav" playOrStop:NO];

        if (translation.x < 0) {
            [SceneManager pagingOfIndex:8 back:TransitionFadeBL];
        }
        else {
            [SceneManager pagingOfIndex:8 back:TransitionFadeTR];
        }
    }
} 
- (void)textAdd{
    [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundBk];
    language = [SceneManager CheckLanguage];
    Text *text;
    if (!language) {
       NSString *tmp1 = [NSString stringWithFormat:@"When the flour was ready she asked, \"Who will help me make some bread with this flour?\" "];
        text = [Text initWithString:tmp1 isChinese:NO wordNumberOfLine:48 wordPosition:ccp(348, 648)];
        [self playSoundEffect:@"ying_8.wav" playOrStop:YES];
    }
    else {
        NSString *tmp1 = [NSString stringWithFormat:@"面粉磨好之后，小红母鸡又问：“谁来帮我用这些面粉做些面包啊？”"];
        text = [Text initWithString:tmp1 isChinese:YES wordNumberOfLine:18 wordPosition:ccp(358, 638)];
        [self playSoundEffect:@"zhong_8.wav" playOrStop:YES];
    }
    text.text_delegate = self;
    [self addChild:text z:1 tag:101];
}
- (void)delegateTextAdd{
    [self textAdd];
}
-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];  
    CCLOG(@"{%f,%f},",location.x,location.y );
    CCSprite *sprite1 = (CCSprite *)[self getChildByTag:1];
    CCSprite *sprite3 = (CCSprite *)[self getChildByTag:3];
    CCSprite *sprite4 = (CCSprite *)[self getChildByTag:4];
    CCSprite *sprite5 = (CCSprite *)[self getChildByTag:5];
    CCSprite *sprite300 = (CCSprite *)[self getChildByTag:300];
    id act = [CCMoveTo actionWithDuration:1.f position:ccp(408, 480)];
    id act1 = [CCScaleTo actionWithDuration:1.f scale:2.4];
    id spa = [CCSpawn actions:act,act1, nil];
    if (bol1 == YES) {
        if (CGRectContainsPoint(sprite1.boundingBox, location)) {
            sprite1.visible = NO;
            sprite4.visible = YES;
            [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
            sound = @"p7_mj.wav";
            soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
            [sprite5 runAction:[CCSequence actions:[CCShow action],spa,[CCHide action],[CCMoveTo actionWithDuration:0.f position:ccp(645, 250)],[CCScaleTo actionWithDuration:0.f scale:1], nil]];
            [self   performSelector:@selector(zhuanzhi) withObject:self afterDelay:1.f];
        }
        else if(CGRectContainsPoint(sprite3.boundingBox, location)){
            [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
            sound = @"p7_xj.mp3";
            soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
        }
        bol1 = NO;
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
