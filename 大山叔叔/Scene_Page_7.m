//
//  Scene_Page_7.m
//  dashan
//
//  Created by Liu Yang on 11-12-23.
//  Copyright 2011年 Jiangsu  Zhongka  Educational  Science and   Technology  Co.，Ltd. All rights reserved.
//

#import "Scene_Page_7.h"
#import "SimpleAudioEngine.h"
#import "SceneManager.h"
@implementation Scene_Page_7
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
        bo = YES;
        [[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
        cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache addSpriteFramesWithFile:@"p7_bk.plist" textureFile:@"p7_bk.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"p7_mz.plist" textureFile:@"p7_mz.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"p7_jj.plist" textureFile:@"p7_jj.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"transitionNumber.plist" textureFile:@"transitionNumber.pvr.ccz"];
        CCSprite *bk = [CCSprite spriteWithSpriteFrameName:@"p7-bk.png"];
        bk.position = ccp(512, 384);
        [self addChild:bk];
        
        CCSprite *transition_ = [CCSprite spriteWithSpriteFrameName:@"10001.png"];
        transition_.position = ccp(980, 48);
        [self addChild:transition_ z:5 tag:300];
        [self transitionNumberAnimation:@"forever"];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"7" fontName:@"KaiTi_GB2312" fontSize:28];
        label.color = ccc3(30, 45, 79);
        label.position = ccp(980, 30);
        [self addChild:label z:5];
        
        CCSprite *bk1 = [CCSprite spriteWithSpriteFrameName:@"fz.png"];
        bk1.position = ccp(335, 380);
        bk1.tag = 1;
        [self addChild:bk1 z:2];
        
        CCSprite *bk2 = [CCSprite spriteWithSpriteFrameName:@"p7_001.png"];
        bk2.position = ccp(738, 498);
        bk2.tag = 2;
        [self addChild:bk2 z:1];
        
        CCSprite *bk3 = [CCSprite spriteWithSpriteFrameName:@"mz001.png"];
        bk3.position = ccp(250, 415);
        bk3.tag = 3;
        [self addChild:bk3 z:4];
        
        CCSprite *bk4 = [CCSprite spriteWithSpriteFrameName:@"gz.png"];
        bk4.position = ccp(150, 245);
        bk4.tag = 4;
        [self addChild:bk4 z:3];
        
        CCSprite *bk5 = [CCSprite spriteWithSpriteFrameName:@"mzs.png"];
        bk5.position = ccp(154, 495);
        bk5.tag = 5;
        [self addChild:bk5 z:2];
        
        CCSprite *bk6 = [CCSprite spriteWithSpriteFrameName:@"mjt1.png"];
        bk6.position = ccp(160, 550);
        bk6.tag = 6;
        [self addChild:bk6 z:5];
        
        CCSprite *bk7 = [CCSprite spriteWithSpriteFrameName:@"mfzd-01.png"];
        bk7.position = ccp(225, 115);
        bk7.tag = 7;
        [self addChild:bk7 z:2];
        
        CCSprite *bk8 = [CCSprite spriteWithSpriteFrameName:@"gzlxdm.png"];
        bk8.position = ccp(205, 125);
        bk8.visible = NO;
        bk8.tag = 8;
        [self addChild:bk8 z:2];
        
        CCSprite *bk9 = [CCSprite spriteWithSpriteFrameName:@"xj1.png"];
        bk9.position = ccp(100, 328);
        bk9.tag = 9;
        [self addChild:bk9 z:4];
        
        CCSprite *bk10 = [CCSprite spriteWithSpriteFrameName:@"p7_004.png"];
        bk10.position = ccp(475, 325);
        bk10.tag = 10;
        [self addChild:bk10 z:5];
        
        CCSprite *bk11 = [CCSprite spriteWithSpriteFrameName:@"jj_002.png"];
        bk11.position = ccp(288, 205);
        bk11.tag = 11;
        [self addChild:bk11 z:6];
        
        CCSprite *bk12 = [CCSprite spriteWithSpriteFrameName:@"jj_001.png"];
        bk12.position = ccp(48, 120);
        bk12.tag = 12;
        [self addChild:bk12 z:2];
        
        [self textAdd];
    }
    return self;
}
-(void)ying{
    [self playSoundEffect:@"7_ying2.wav" playOrStop:YES];
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
       [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(ying) object:self];
       [self playSoundEffect:@"7-zhong.wav" playOrStop:NO];
       [self playSoundEffect:@"7-ying.wav" playOrStop:NO];
       [self playSoundEffect:@"7_ying2.wav" playOrStop:NO];
        if (translation.x < 0) {
            [SceneManager pagingOfIndex:7 back:TransitionFadeBL];
        }
        else {
            [SceneManager pagingOfIndex:7 back:TransitionFadeTR];
        }
    }
    
} 
- (void)textAdd{
    [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundBk];
    language = [SceneManager CheckLanguage];
    Text *text;
    if (!language) {
         NSString *tmp1 = [NSString stringWithFormat:@"\"Then I will do it myself, ”said the Little Red Hen. She harvested the wheat   and ground it into white flour. "];
        text = [Text initWithString:tmp1 isChinese:NO wordNumberOfLine:27 wordPosition:ccp(832, 152)];
        [self playSoundEffect:@"7-ying.wav" playOrStop:YES];
        [self performSelector:@selector(ying)  withObject:self afterDelay:5.8f];
    }
    else {
        NSString *tmp1 = [NSString stringWithFormat:@"“那么我自己收。”小红母鸡说。她把麦子割下来，然后又把它们磨成了雪白的面粉。"];
        text = [Text initWithString:tmp1 isChinese:YES wordNumberOfLine:11 wordPosition:ccp(832, 152)];
        [self playSoundEffect:@"7-zhong.wav" playOrStop:YES];
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
    CCSprite *sprite2 = (CCSprite *)[self getChildByTag:2];
    CCSprite *sprite3 = (CCSprite *)[self getChildByTag:3];
    CCSprite *sprite6 = (CCSprite *)[self getChildByTag:6];
    CCSprite *sprite7 = (CCSprite *)[self getChildByTag:7];
    CCSprite *sprite8 = (CCSprite *)[self getChildByTag:8];
    CCSprite *sprite9 = (CCSprite *)[self getChildByTag:9];
    CCSprite *sprite10 = (CCSprite *)[self getChildByTag:10];
    CCSprite *sprite11 = (CCSprite *)[self getChildByTag:11];
    CCSprite *sprite12 = (CCSprite *)[self getChildByTag:12];
    CCSprite *sprite300 = (CCSprite *)[self getChildByTag:300];
    

    if (CGRectContainsPoint(sprite2.boundingBox,location)) {
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
        sound = @"p7_mf.wav";
        soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];

        if (bo == YES) {
            sprite8.visible = YES;
            NSMutableArray *animFrames_b1 = [NSMutableArray array];
        for(int i = 1; i < 4; i++) {
            // Obtain frames by alias name
            CCSpriteFrame *frame1 = [cache spriteFrameByName:[NSString stringWithFormat:@"p7_00%d.png",i]];
            [animFrames_b1 addObject:frame1];
        }
        CCAnimation *animation_b1 = [CCAnimation animationWithFrames:animFrames_b1];
        [sprite2 runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithDuration:0.6f animation:animation_b1 restoreOriginalFrame:YES]]];
        
            NSMutableArray *animFrames = [NSMutableArray array];
            for(int i = 4; i < 7; i++) {
                // Obtain frames by alias name
                CCSpriteFrame *frame = [cache spriteFrameByName:[NSString stringWithFormat:@"p7_00%d.png",i]];
                [animFrames addObject:frame];
            }
            CCAnimation *animation = [CCAnimation animationWithFrames:animFrames];
            [sprite10 runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithDuration:0.6f animation:animation restoreOriginalFrame:YES]]]; 
            
            NSMutableArray *animFrames_b = [NSMutableArray array];
            for(int i = 1; i < 10; i++) {
                // Obtain frames by alias name
                CCSpriteFrame *frame2 = [cache spriteFrameByName:[NSString stringWithFormat:@"mz00%d.png",i]];
                [animFrames_b addObject:frame2];
            }
            CCAnimation *animation_b = [CCAnimation animationWithFrames:animFrames_b];
            [sprite3 runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithDuration:0.7f animation:animation_b restoreOriginalFrame:YES]]]; 
            
            NSMutableArray *animFrames_b11 = [NSMutableArray array];
            for(int i = 1; i < 3; i++) {
                // Obtain frames by alias name
                CCSpriteFrame *frame11 = [cache spriteFrameByName:[NSString stringWithFormat:@"mjt%d.png",i]];
                [animFrames_b11 addObject:frame11];
            }
            CCAnimation *animation_b11 = [CCAnimation animationWithFrames:animFrames_b11];
            [sprite6 runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithDuration:0.7f animation:animation_b11 restoreOriginalFrame:YES]]]; 
            
            NSMutableArray *animFrames_b12 = [NSMutableArray array];
            for(int i = 1; i < 5; i++) {
                // Obtain frames by alias name
                CCSpriteFrame *frame12 = [cache spriteFrameByName:[NSString stringWithFormat:@"mfzd-0%d.png",i]];
                [animFrames_b12 addObject:frame12];
            }
            CCAnimation *animation_b12 = [CCAnimation animationWithFrames:animFrames_b12];
            [sprite7 runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithDuration:1.6f animation:animation_b12 restoreOriginalFrame:NO]]];
            bo=NO;
        }
       else if (bo==NO) {
           sprite8.visible = NO;
            [sprite2 stopAllActions];
            [sprite3 stopAllActions];
            [sprite6 stopAllActions];
            [sprite7 stopAllActions];
            [sprite10 stopAllActions];
            bo= YES;
        }
    }
  
        
    else if (CGRectContainsPoint(sprite6.boundingBox, location)) {
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
        sound = @"p7_mj.wav";
        soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
    }
    else if (CGRectContainsPoint(sprite9.boundingBox, location)) {
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
        sound = @"p7_xj.mp3";
        soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
    }
    else if (CGRectContainsPoint(sprite11.boundingBox, location)) {
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
        sound = @"p7_xj.mp3";
        soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
    }
    else if (CGRectContainsPoint(sprite12.boundingBox, location)) {
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
        sound = @"p7_xj.mp3";
        soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
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
