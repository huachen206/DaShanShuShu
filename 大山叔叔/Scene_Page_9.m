//
//  Scene_Page_9.m
//  dashan
//
//  Created by Liu Yang on 11-12-24.
//  Copyright 2011年 Jiangsu  Zhongka  Educational  Science and   Technology  Co.，Ltd. All rights reserved.
//

#import "Scene_Page_9.h"
#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "Text.h"
@implementation Scene_Page_9
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
        bol2 = YES;
        [[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
        cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache addSpriteFramesWithFile:@"p9_bk.plist" textureFile:@"p9_bk.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"transitionNumber.plist" textureFile:@"transitionNumber.pvr.ccz"];
        CCSprite *bk = [CCSprite spriteWithSpriteFrameName:@"p9_bk.png"];
        bk.position = ccp(512, 384);
        [self addChild:bk];
        
        CCSprite *transition_ = [CCSprite spriteWithSpriteFrameName:@"10001.png"];
        transition_.position = ccp(980, 48);
        [self addChild:transition_ z:5 tag:300];
        [self transitionNumberAnimation:@"forever"];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"9" fontName:@"KaiTi_GB2312" fontSize:28];
        label.color = ccc3(30, 45, 79);
        label.position = ccp(980, 30);
        [self addChild:label z:5];
        
        CCSprite *bk1 = [CCSprite spriteWithSpriteFrameName:@"sjde.png"];
        bk1.position = ccp(655, 470);
        bk1.tag = 1;
        [self addChild:bk1 z:2];
        
        CCSprite *bk2 = [CCSprite spriteWithSpriteFrameName:@"sjme.png"];
        bk2.position = ccp(510, 242);
        bk2.tag =2;
        [self addChild:bk2 z:1];
        
        CCSprite *bk3 = [CCSprite spriteWithSpriteFrameName:@"qw.png"];
        bk3.position = ccp(682, 686);
        bk3.tag = 3;
        [self addChild:bk3 ];

        [self textAdd];
//        NSString *tmp1 = [NSString stringWithFormat:@"\"Not me,\"said the Goose.        \"Not me.either,\"said the Duck. "];
//        Text *text = [Text initWithString:tmp1 isChinese:NO wordNumberOfLine:18 wordPosition:ccp(168, 172)];
//        [self addChild:text z:1 tag:101];
    }
    return self;
}
-(void)ying{
    [self playSoundEffect:@"ying_2.wav" playOrStop:YES];
}
-(void)ying1{
    [self playSoundEffect:@"zhong_2.wav" playOrStop:YES];
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
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(ying1) object:self];
        [self playSoundEffect:@"zhong_1.wav" playOrStop:NO];
        [self playSoundEffect:@"zhong_2.wav" playOrStop:NO];
        [self playSoundEffect:@"ying_1.wav" playOrStop:NO];
        [self playSoundEffect:@"ying_2.wav" playOrStop:NO];
        if (translation.x < 0) {
            [SceneManager pagingOfIndex:9 back:TransitionFadeBL];
        }
        else {
            [SceneManager pagingOfIndex:9 back:TransitionFadeTR];
        }
    }
//    CCSprite *sprite1 = (CCSprite *)[self getChildByTag:1];
//    CCSprite *sprite2 = (CCSprite *)[self getChildByTag:2];
//    if (CGRectContainsPoint(sprite1.boundingBox, touchLocation)) {
//            sprite1.position = ccpAdd(sprite1.position, translation);
//        bol1 = NO;
//        }
//    else if (CGRectContainsPoint(sprite2.boundingBox, touchLocation)) {
//           sprite2.position = ccpAdd(sprite2.position, translation);
//        bol2 = NO;
//    }
} 
- (void)textAdd{
    [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundBk];
    language = [SceneManager CheckLanguage];
    Text *text;
    if (!language) {
        NSString *tmp1 = [NSString stringWithFormat:@"\"Not me, ”said the Goose.                     \"Not me,either,\"said the Duck. "];
        text = [Text initWithString:tmp1 isChinese:NO wordNumberOfLine:23 wordPosition:ccp(168, 160)];
        [self playSoundEffect:@"ying_1.wav" playOrStop:YES];
        [self performSelector:@selector(ying)  withObject:self afterDelay:5.4f];
    }
    else {
        NSString *tmp1 = [NSString stringWithFormat:@"“我不去。”鹅说。    “我也不去。”鸭子说。"];
        text = [Text initWithString:tmp1 isChinese:YES wordNumberOfLine:13 wordPosition:ccp(168, 102)];
        [self playSoundEffect:@"zhong_1.wav" playOrStop:YES];
        [self performSelector:@selector(ying1)  withObject:self afterDelay:2.8f];
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
    CCSprite *sprite3 = (CCSprite *)[self getChildByTag:3];
    CCSprite *sprite1 = (CCSprite *)[self getChildByTag:1];
    CCSprite *sprite2 = (CCSprite *)[self getChildByTag:2];
    CCSprite *sprite300 = (CCSprite *)[self getChildByTag:300];
    id act = [CCMoveTo actionWithDuration:0.5f position:ccp(510, 242)];
    id act1 = [CCMoveTo actionWithDuration:0.5f position:ccp(655, 470)];
    if (CGRectContainsPoint(sprite1.boundingBox, location)) {
    if (bol1 == NO) {
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
        sound = @"e.mp3";
        soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
            [sprite1 runAction:[CCEaseBounceOut actionWithAction:act1]];
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
        sound = @"yz.mp3";
        soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
        [sprite2 runAction:[CCEaseBounceOut actionWithAction:act]];
        bol1 = YES;
        bol2 = YES;
    }
      else  if (bol1 == YES) {
          [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
          sound = @"e.mp3";
          soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
          [sprite1 runAction:[CCEaseBounceOut actionWithAction:act]];
          [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
          sound = @"yz.mp3";
          soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
          [sprite2 runAction:[CCEaseBounceOut actionWithAction:act1]];
          bol1 = NO;
          bol2 = NO;
        }
    }
   else if (CGRectContainsPoint(sprite2.boundingBox, location)) {
      if (bol2 == NO) {
          [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
          sound = @"e.mp3";
          soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
          [sprite1 runAction:[CCEaseBounceOut actionWithAction:act1]];
          [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
          sound = @"yz.mp3";
          soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
            [sprite2 runAction:[CCEaseBounceOut actionWithAction:act]];
          bol2 = YES;
          bol1 = YES;
      }
      else if (bol2 == YES) {
          [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
          sound = @"e.mp3";
          soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
          [sprite1 runAction:[CCEaseBounceOut actionWithAction:act]];
           [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
           sound = @"yz.mp3";
           soundId =(NSNumber*)[[SimpleAudioEngine sharedEngine] playEffect:sound];
           [sprite2 runAction:[CCEaseBounceOut actionWithAction:act]];
          bol2 = NO;
          bol2 = NO;
       }
   }
    else  if (CGRectContainsPoint(sprite3.boundingBox, location)) {
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
        sound = @"qw.wav";
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
