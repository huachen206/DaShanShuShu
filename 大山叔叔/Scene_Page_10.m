//
//  Scene_Page_10.m
//  daShan
//
//  Created by edwardair on 11-12-19.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Scene_Page_10.h"
#import "SceneManager.h"

static BOOL birdClick;
//static BOOL breadMaked;
@implementation Scene_Page_10
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
    if ((self = [super init])) {
        birdClick = NO;
//        breadMaked = NO;
        breadNumber = 0;
        breadScaleState = 0;
        
        CGSize size = [CCDirector sharedDirector].winSize;
        p = ccp(size.width/2, size.height/2);
        
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache addSpriteFramesWithFile:@"p10_sp.plist" textureFile:@"p10_sp.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"transitionNumber.plist" textureFile:@"transitionNumber.pvr.ccz"];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];
        CCSprite *bk = [CCSprite spriteWithFile:@"p10_bk.pvr.ccz"];
        bk.position = p;
        [self addChild:bk z:0];

        CCSprite *shengZi = [CCSprite spriteWithSpriteFrameName:@"shengzi.png"];
        shengZi.position = ccp(560, 480);
        [self addChild:shengZi z:1 tag:2];

        CCSprite *bird = [CCSprite spriteWithSpriteFrameName:@"dj.png"];
        bird.position = ccp(565, 405);
        [self addChild:bird z:1 tag:1];
        
        CCSprite *lunPan = [CCSprite spriteWithSpriteFrameName:@"fs.png"];
        lunPan.position = ccp(586, 518);
        [self addChild:lunPan z:1 tag:3];
        
        CCSprite *hand1 = [CCSprite spriteWithFile:@"s1.png"];
        CCSprite *hand2 = [CCSprite spriteWithFile:@"s2.png"];
        hand1.position = ccp(697.5, 338);
        hand2.position = ccp(700, 334);
        hand2.visible = NO;
        [self addChild:hand1 z:1 tag:4];
        [self addChild:hand2 z:1 tag:5];
        
        CCSprite *mb = [CCSprite spriteWithSpriteFrameName:@"mb.png"];
        mb.position = ccp(716, 144);
        [self addChild:mb z:1];
        
        int k = 0;//655,191     707,196       655,161
//        CCSprite *bread = [CCSprite spriteWithSpriteFrameName:@"MT0015.png"];
//        bread.position = ccp(654 +(i*8.9) + 54 * j, 191 + (4.4 * j) - 30 * i);
//        [self addChild:bread z:1 tag:(6 + k)];
        for (int i = 0; i < 3; i++) {//654,191//708,198//760,200// 665,161//720,165// 770,169  
            for (int j = 0; j < 3; j++,k++) {
                CCSprite *bread = [CCSprite spriteWithSpriteFrameName:@"MT0015.png"];
                bread.position = ccp(655 + (10 * i)  + 52 * j, 191 + (4.8 * j) - 31.5 * i);
                bread.scale = 0;
                [self addChild:bread z:1 tag:(6 + k)];
            }
        }
        
        CCSprite *yan = [CCSprite spriteWithFile:@"y.png"];
        CCSprite *yan1 = [CCSprite spriteWithFile:@"y.png"];
        yan.position = ccp(320, 696);
        yan1.position = ccp(212, 710);
        yan1.scale = 1.3;
        [self addChild:yan z:1 tag:20];
        [self addChild:yan1 z:1 tag:21];
        
        CCSprite *transition_ = [CCSprite spriteWithSpriteFrameName:@"10001.png"];
        transition_.position = ccp(980, 48);
        [self addChild:transition_ z:5 tag:300];
        [self transitionNumberAnimation:@"forever"];
            
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"10" fontName:@"KaiTi_GB2312" fontSize:28];
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
        NSString *tmp1 = [NSString stringWithFormat:@"\"Then I will do it myself, \"said the Little Red Hen. "];
        text = [Text initWithString:tmp1 isChinese:NO wordNumberOfLine:19 wordPosition:ccp(180, 540)];
        [self playSoundEffect:@"p10_soundE.wav" playOrStop:YES];
    }
    else {
        NSString *tmp1 = [NSString stringWithFormat:@"“那么我自己来做。”小红母鸡说。"];
        text = [Text initWithString:tmp1 isChinese:YES wordNumberOfLine:7 wordPosition:ccp(180, 540)];
        [self playSoundEffect:@"p10_soundC.wav" playOrStop:YES];
    }
    text.text_delegate = self;
    [self addChild:text z:1 tag:101];
}
- (void)onEnter {
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:1 swallowsTouches:YES];
    self.isTouchEnabled = YES;
    [super onEnter];
}

- (void)onExit{
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [super onExit];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{    
    CGPoint touchLocation = [touch locationInView:[touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation]; 

    CCSprite *bird = (CCSprite *)[self getChildByTag:1];
    if (CGRectContainsPoint(bird.boundingBox, touchLocation)) {
        birdClick = YES;
    }
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    
    CCSprite *bird = (CCSprite *)[self getChildByTag:1];
    CCSprite *shengZi = (CCSprite *)[self getChildByTag:2];
    CCSprite *lunPan = (CCSprite *)[self getChildByTag:3];

    if (birdClick) {
            bird.position = ccp(bird.position.x, bird.position.y+translation.y);
        if (bird.position.y >= 405) bird.position = ccp(bird.position.x, 405);
        else if (bird.position.y <= 40) bird.position = ccp(bird.position.x, 40);
            shengZi.scaleY = ((405 - bird.position.y)+78)/78.0;
            shengZi.position = ccp(shengZi.position.x, (480 - (405 - bird.position.y)/2));
//                    [lunPan runAction:[CCRotateBy actionWithDuration:0 angle:10]];
            lunPan.rotation = (bird.position.y - 405);
            CCLOG(@"%f",shengZi.scaleY);
    }
    else if (abs(translation.x)>25&& CGRectContainsPoint(slide_rect, touchLocation)) {
        [self cleanup];
        if (language) {
            [self playSoundEffect:@"p10_soundC.wav" playOrStop:NO];
        }
        else {
            [self playSoundEffect:@"p10_soundE.wav" playOrStop:NO];
        }

        if (translation.x < 0) {
            [SceneManager pagingOfIndex:10 back:TransitionFadeBL];
        }
        else {
            [SceneManager pagingOfIndex:10 back:TransitionFadeTR];
        }
    }

//    CCSprite *test = (CCSprite *)[self getChildByTag:20];
//    test.position = ccp(test.position.x+translation.x, test.position.y+translation.y);
//    CCLOG(@"test:::::%f,%f",test.position.x,test.position.y);
    
}
- (void)delegateTextAdd{
    [self textAdd];
}
-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [touch locationInView:[touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation]; 
    CCLOG(@"%f,%f",touchLocation.x,touchLocation.y);
    birdClick = NO;
    CCSprite *hand1 = (CCSprite *)[self getChildByTag:5];
    CCSprite *hand2 = (CCSprite *)[self getChildByTag:4];
    CCSprite *bird = (CCSprite *)[self getChildByTag:1];
    CCSprite *shengZi = (CCSprite *)[self getChildByTag:2];
    CCSprite *lunPan = (CCSprite *)[self getChildByTag:3];
    CCSprite *transition_ = (CCSprite *)[self getChildByTag:300];
    if (CGRectContainsPoint(CGRectMake(700, 343, 140, 110), touchLocation)) {
        CCSprite *bread = (CCSprite *)[self getChildByTag:(breadNumber+6)];
        breadScaleState = breadScaleState % 5 + 1;
        bread.scale = bread.scale + 0.2;
        CCLOG(@"%f",bread.scale);

        hand1.visible = !hand1.visible;
        hand2.visible = !hand2.visible;

        if (breadScaleState == 5) breadNumber++;
    }
   else if (bird.position.y != 405) {
        [bird runAction:[CCEaseSineIn actionWithAction:[CCMoveTo actionWithDuration:.2 position:ccp(bird.position.x,405)]]];
        [shengZi runAction:[CCSpawn actions:[CCEaseSineIn actionWithAction:[CCMoveTo actionWithDuration:.2 position:ccp(560, 480)]], 
                                            [CCEaseSineIn actionWithAction:[CCScaleTo actionWithDuration:.2 scale:1]],
                                            nil]];
        [lunPan runAction:[CCRotateBy actionWithDuration:.5 angle:2.5 * (405 - bird.position.y)]];
    }
   else if (CGRectContainsPoint(transition_.boundingBox, touchLocation)){
       [self transitionNumberAnimation:@"One"];
   }
    
//    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"mailto:yoyokko@gmail.com"]];
}

- (void)dealloc{
    [super dealloc];
}

@end
