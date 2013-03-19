//
//  Scene_Page_14.m
//  daShan
//
//  Created by edwardair on 11-12-23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Scene_Page_14.h"
#import "SceneManager.h"
static BOOL gongEClickEd,muEClickEd;
static BOOL chicken1,chicken2,chicken3,chicken4;
@implementation Scene_Page_14
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
    if (self == [super init]) {
        gongEClickEd = NO;
        muEClickEd = NO;
        chicken1 = chicken2 = chicken3 = chicken4 = YES;
        CGSize size = [[CCDirector sharedDirector] winSize];
        CGPoint p = ccp(size.width/2, size.height/2);

        CCSprite *bk = [CCSprite spriteWithFile:@"p14_bk.pvr.ccz"];
        bk.position = p;
        [self addChild:bk];
        
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache removeUnusedSpriteFrames];
        [cache addSpriteFramesWithFile:@"p14_sp.plist" textureFile:@"p14_sp.pvr.ccz"];
        
        for (int i = 1; i < 9;i++) {
            CCSprite *chicken = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"chi_%d.png",i]];
            switch (i) {
                case 1:
                    chicken.position = ccp(576, 466);
                    break;
                case 2:
                    chicken.position = ccp(761, 629);
                    chicken.visible = NO;
                    break;
                case 3:
                    chicken.position = ccp(702, 438);
                    break;
                case 4:
                    chicken.position = ccp(642, 539);
                    chicken.visible = NO;
                    break;
                case 5:
                    chicken.position = ccp(818, 424);
                    break;
                case 6:
                    chicken.position = ccp(966, 593);
                    chicken.visible = NO;
                    break;
                case 7:
                    chicken.position = ccp(928, 368);
                    break;
                case 8:
                    chicken.position = ccp(958, 470);
                    chicken.visible = NO;
                    break;
                default:
                    break;
            }

            [self addChild:chicken z:0 tag:i];
        }
        
        CCSprite *gongE = [CCSprite spriteWithSpriteFrameName:@"gongE.png"];
        CCSprite *muE = [CCSprite spriteWithSpriteFrameName:@"muE.png"];
        gongE.position = ccp(772, 0);//226
        muE.position = ccp(150, 130);//284
        [self addChild:muE z:0 tag:10];
        [self addChild:gongE z:0 tag:9];
        
        [cache addSpriteFramesWithFile:@"transitionNumber.plist" textureFile:@"transitionNumber.pvr.ccz"];

        CCSprite *transition_ = [CCSprite spriteWithSpriteFrameName:@"10001.png"];
        transition_.position = ccp(980, 48);
        [self addChild:transition_ z:5 tag:300];
        [self transitionNumberAnimation:@"forever"];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"14" fontName:@"KaiTi_GB2312" fontSize:28];
        label.color = ccc3(30, 45, 79);
        label.position = ccp(980, 30);
        [self addChild:label z:5];

        [self textAdd];
        self.isTouchEnabled = YES;
    }
    return self;
}
- (void)textAdd{
    [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundBk];
    
    language = [SceneManager CheckLanguage];
    Text *text;
    if (!language) {
        NSString *tmp1 = [NSString stringWithFormat:@"\"No, you won't, \"said the Little Red Hen, \"I will leave this bread for    my own little chicks. Cluck, cluck, cluck...? And she called her baby    chicks to come. "];
        text = [Text initWithString:tmp1 isChinese:NO wordNumberOfLine:38 wordPosition:ccp(260, 630)];
        [self playSoundEffect:@"p14_soundE.wav" playOrStop:YES];
    }
    else {
        NSString *tmp1 = [NSString stringWithFormat:@"“不，你们才不想吃呢！”小红母鸡说，“我还是把这些面包留给我的孩子们吧。咯咯咯，咯咯咯……”然后，小红母鸡就叫来了她的小鸡们。"];
        text = [Text initWithString:tmp1 isChinese:YES wordNumberOfLine:11 wordPosition:ccp(260, 630)];
        [self playSoundEffect:@"p14_soundC.wav" playOrStop:YES];
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

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{ 
    CGPoint touchLocation = [touch locationInView:[touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation]; 

    CCSprite *gongE = (CCSprite *)[self getChildByTag:9];
    CCSprite *muE = (CCSprite *)[self getChildByTag:10];
    CCSprite *chi1 = (CCSprite *)[self getChildByTag:1];
    CCSprite *chi2 = (CCSprite *)[self getChildByTag:3];
    CCSprite *chi3 = (CCSprite *)[self getChildByTag:5];
    CCSprite *chi4 = (CCSprite *)[self getChildByTag:7];

    if (CGRectContainsPoint(chi1.boundingBox, touchLocation) && (chicken1)) {
        chicken1 = NO;
        CCSprite *chi_2 = (CCSprite *)[self getChildByTag:2];
        [chi1 runAction:[CCMoveTo actionWithDuration:.5 position:ccp(761, 629)]];
        [chi1 runAction:[CCRepeatForever actionWithAction:[CCSequence actions:[CCDelayTime actionWithDuration:.5], [CCHide action], [CCDelayTime actionWithDuration:.2], [CCShow action], [CCDelayTime actionWithDuration:.2], nil]]];
        [chi_2 runAction:[CCRepeatForever actionWithAction:[CCSequence actions:[CCDelayTime actionWithDuration:.5], [CCShow action], [CCDelayTime actionWithDuration:.2], [CCHide action], [CCDelayTime actionWithDuration:.2], nil]]];
    }
    else if (CGRectContainsPoint(chi2.boundingBox, touchLocation) && (chicken2)) {
        chicken2 = NO;
        CCSprite *chi_2 = (CCSprite *)[self getChildByTag:4];
        [chi2 runAction:[CCMoveTo actionWithDuration:.5 position:ccp(642, 539)]];
        [chi2 runAction:[CCRepeatForever actionWithAction:[CCSequence actions:[CCDelayTime actionWithDuration:.5], [CCHide action], [CCDelayTime actionWithDuration:.2], [CCShow action], [CCDelayTime actionWithDuration:.2], nil]]];
        [chi_2 runAction:[CCRepeatForever actionWithAction:[CCSequence actions:[CCDelayTime actionWithDuration:.5], [CCShow action], [CCDelayTime actionWithDuration:.2], [CCHide action], [CCDelayTime actionWithDuration:.2], nil]]];
    }
    else if (CGRectContainsPoint(chi3.boundingBox, touchLocation) && (chicken3)) {
        chicken3 = NO;
        CCSprite *chi_2 = (CCSprite *)[self getChildByTag:6];
        [chi3 runAction:[CCMoveTo actionWithDuration:.5 position:ccp(966, 593)]];
        [chi3 runAction:[CCRepeatForever actionWithAction:[CCSequence actions:[CCDelayTime actionWithDuration:.5], [CCHide action], [CCDelayTime actionWithDuration:.2], [CCShow action], [CCDelayTime actionWithDuration:.2], nil]]];
        [chi_2 runAction:[CCRepeatForever actionWithAction:[CCSequence actions:[CCDelayTime actionWithDuration:.5], [CCShow action], [CCDelayTime actionWithDuration:.2], [CCHide action], [CCDelayTime actionWithDuration:.2], nil]]];
    }
    else if (CGRectContainsPoint(chi4.boundingBox, touchLocation) && (chicken4)) {
        chicken4 = NO;
        CCSprite *chi_2 = (CCSprite *)[self getChildByTag:8];
        [chi4 runAction:[CCMoveTo actionWithDuration:.5 position:ccp(958, 470)]];
        [chi4 runAction:[CCRepeatForever actionWithAction:[CCSequence actions:[CCDelayTime actionWithDuration:.5], [CCHide action], [CCDelayTime actionWithDuration:.2], [CCShow action], [CCDelayTime actionWithDuration:.2], nil]]];
        [chi_2 runAction:[CCRepeatForever actionWithAction:[CCSequence actions:[CCDelayTime actionWithDuration:.5], [CCShow action], [CCDelayTime actionWithDuration:.2], [CCHide action], [CCDelayTime actionWithDuration:.2], nil]]];
    }
    else  if (CGRectContainsPoint(gongE.boundingBox, touchLocation)) {
        gongEClickEd = YES;
    }
    else if (CGRectContainsPoint(muE.boundingBox, touchLocation)){
        muEClickEd = YES;
    }

    return YES;
}
-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    CCSprite *gongE = (CCSprite *)[self getChildByTag:9];
    CCSprite *muE = (CCSprite *)[self getChildByTag:10];

    if (abs(translation.x)>25&& CGRectContainsPoint(slide_rect, touchLocation) && !gongEClickEd && !muEClickEd) {
        [self cleanup];
        if (language) {
            [self playSoundEffect:@"p14_soundC.wav" playOrStop:NO];
        }
        else {
            [self playSoundEffect:@"p14_soundE.wav" playOrStop:NO];
        }
        
        if (translation.x < 0) {
            [SceneManager call_Page_Over:TransitionFadeBL];
            
        }
        else {
            [SceneManager call_Page_13:TransitionFadeTR];
            
        }
    }

    if (gongEClickEd) {
        gongE.position = ccp(gongE.position.x+.3*(translation.y), gongE.position.y+translation.y);
        if (gongE.position.y >= 226) {
            gongE.position = ccp(824.8, 176);
        }
        if (gongE.position.y <= 0){
            gongE.position = ccp(772, 0);
        }
    }
    else if (muEClickEd){
        muE.position = ccp(muE.position.x+2*(translation.y), muE.position.y+translation.y);
        CCLOG(@"%f,%f",muE.position.x,muE.position.y);
        if (muE.position.y >= 300) {
            muE.position = ccp(390, 250);
        }
        if (muE.position.x <= 0){
            muE.position = ccp(0, 55);
        }

    }

//    CCSprite *test = (CCSprite *)[self getChildByTag:10];
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
    if (CGRectContainsPoint(transition_.boundingBox, touchLocation)){
        [self transitionNumberAnimation:@"One"];
    }

    gongEClickEd = NO;
    muEClickEd = NO;
}
- (void)dealloc{
    [super dealloc];
}
@end
