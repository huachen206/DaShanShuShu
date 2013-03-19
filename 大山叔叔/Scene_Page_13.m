//
//  Scene_Page_12.m
//  daShan
//
//  Created by edwardair on 11-12-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Scene_Page_13.h"
#import "SceneManager.h"

@implementation Scene_Page_13
- (void)playSoundEffect:(NSString *)string playOrStop:(BOOL)pS{
    if (soundEffectEnabled) {
        if (pS) {
            soundBk = (NSNumber *)[[SimpleAudioEngine sharedEngine] playEffect:string];
        }
        else {
            [[SimpleAudioEngine sharedEngine] unloadEffect:string];
        }
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
        clickEnabledNumber = 0;
        soundEffectEnabled = YES;
        CGSize size = [[CCDirector sharedDirector] winSize];
        CGPoint p = ccp(size.width/2, size.height/2);
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];
        CCSprite *bk = [CCSprite spriteWithFile:@"p12_bk.pvr.ccz"];
        bk.position = p;
        [self addChild:bk];
        
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache removeUnusedSpriteFrames];
        [cache addSpriteFramesWithFile:@"p12_sp.plist" textureFile:@"p12_sp.pvr.ccz"];
        
        CCSprite *hen_1 = [CCSprite spriteWithSpriteFrameName:@"hen_1.png"];
        CCSprite *hen_2 = [CCSprite spriteWithSpriteFrameName:@"hen_2.png"];
        hen_1.position = ccp(230, 536);
        hen_2.position = ccp(230, 536);
        hen_1.tag = 100;
        hen_2.tag = 101;
        hen_2.visible = NO;
        [self addChild:hen_1];
        [self addChild:hen_2];

        array = [[NSArray alloc] initWithObjects:@"newspaper.png", @"redFlower.png", @"blueFlower.png", @"cup1.png", @"cup2.png", @"cupBotton.png", nil];
        
        [cache addSpriteFramesWithFile:@"transitionNumber.plist" textureFile:@"transitionNumber.pvr.ccz"];

        CCSprite *transition_ = [CCSprite spriteWithSpriteFrameName:@"10001.png"];
        transition_.position = ccp(980, 48);
        [self addChild:transition_ z:5 tag:300];
        [self transitionNumberAnimation:@"forever"];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"13" fontName:@"KaiTi_GB2312" fontSize:28];
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
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(playSoundEffect:playOrStop:) object:self];
    language = [SceneManager CheckLanguage];
    Text *text;
    if (!language) {
        NSString *tmp1 = [NSString stringWithFormat:@"\"Me, me, me! \"said the Goose. \"Me, too! \"said the Duck. "];
        text = [Text initWithString:tmp1 isChinese:NO wordNumberOfLine:33 wordPosition:ccp(260, 100)];
        [self playSoundEffect:@"p13_sound1E.wav" playOrStop:YES];
    }
    else {
        NSString *tmp1 = [NSString stringWithFormat:@"“我，我，我！”鹅说。  “还有我！”鸭子说。"];
        text = [Text initWithString:tmp1 isChinese:YES wordNumberOfLine:13 wordPosition:ccp(180, 100)];
        [self playSoundEffect:@"p13_sound1C.wav" playOrStop:YES];
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
        [self playSoundEffect:@"p13_sound1C.wav" playOrStop:NO];
        [self playSoundEffect:@"p13_sound1E.wav" playOrStop:NO];
        [[SimpleAudioEngine sharedEngine] unloadEffect:@"yz.mp3"];
        [[SimpleAudioEngine sharedEngine] unloadEffect:@"e.mp3"];
        [self playSoundEffect:@"p13_soundDj.wav" playOrStop:NO];

        soundEffectEnabled = NO;
        if (translation.x < 0) {
            [SceneManager pagingOfIndex:13 back:TransitionFadeBL];
        }
        else {
            [SceneManager pagingOfIndex:13 back:TransitionFadeTR];
        }
    }

//    CCSprite *test = (CCSprite *)[self getChildByTag:0];
//    test.position = ccp(test.position.x+translation.x, test.position.y+translation.y);
//    CCLOG(@"test:::::%f,%f",test.position.x,test.position.y);        
}
- (void)removeElementByTag:(CCSprite *)tagIndex{
    int tagIndex_ = tagIndex.tag;
    for (int i = tagIndex_-5; i <= tagIndex_; i++) {
        [self removeChildByTag:i cleanup:YES];
    }
    clickEnabledNumber--;
}
- (void)delegateTextAdd{
    [self textAdd];
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [touch locationInView:[touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation]; 
    CCSprite *hen1 = (CCSprite *)[self getChildByTag:100];
    CCSprite *hen2 = (CCSprite *)[self getChildByTag:101];
    CCSprite *transition_ = (CCSprite *)[self getChildByTag:300];
    if (CGRectContainsPoint(transition_.boundingBox, touchLocation)){
        [self transitionNumberAnimation:@"One"];
    }

    if (CGRectContainsPoint(hen1.boundingBox, touchLocation)) {
//        hen1.visible = !hen1.visible;
//        hen2.visible = !hen2.visible;
        [hen1 runAction:[CCSequence actions:[CCHide action], [CCDelayTime actionWithDuration:.2], [CCShow action], nil]];
        [hen2 runAction:[CCSequence actions:[CCShow action], [CCDelayTime actionWithDuration:.2], [CCHide action], nil]];
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
        soundId = (NSNumber *)[[SimpleAudioEngine sharedEngine] playEffect:@"hen.wav"];
    }
    else if (CGRectContainsPoint(CGRectMake(610, 270, 160, 110), touchLocation)){
        [[SimpleAudioEngine sharedEngine] playEffect:@"yz.mp3"];
    }
    else if (CGRectContainsPoint(CGRectMake(700, 498, 180, 110), touchLocation)){
        [[SimpleAudioEngine sharedEngine] playEffect:@"e.mp3"];
    }
    else {
        if (clickEnabledNumber < 3) {
            
            [self playSoundEffect:@"p13_soundDj.wav" playOrStop:YES];
            
            float posX,posY;
            int tmp = 50;
            CCSprite *element;
            CCSprite *element0 = (CCSprite *)[self getChildByTag:0];
            CCSprite *element6 = (CCSprite *)[self getChildByTag:6];
            CCSprite *element12 = (CCSprite *)[self getChildByTag:12];

            int tagIndex;
            if (!element0) {
                tagIndex = 0;
            }
            else if (!element6){
                tagIndex = 6;
            }
            else if (!element12){
                tagIndex = 12;
            }

            for (int i = 0; i < [array count]; i++) {
                element = [CCSprite spriteWithSpriteFrameName:[array objectAtIndex:i]];
                element.scale = 0;
                element.anchorPoint = ccp(-0.5, -0.5);
                [self addChild:element z:5 tag:tagIndex + i];

                int tmp_ = arc4random()%3;
                int tmp_1 = arc4random()%4;
                switch (i) {
                    case 0:
                        posX = touchLocation.x - tmp_ * tmp;
                        posY = touchLocation.y + tmp_1*tmp;
                        break;
                    case 1:
                        posX = touchLocation.x - tmp_*tmp;
                        posY = touchLocation.y + tmp_1*tmp;
                        break;
                    case 2:
                        posX = touchLocation.x + tmp_*tmp;
                        posY = touchLocation.y + tmp_1*tmp;
                        break;
                    case 3:
                        posX = touchLocation.x + tmp_ *tmp;
                        posY = touchLocation.y - tmp*tmp_1;
                        break;
                    case 4:
                        posX = touchLocation.x + tmp_*tmp;
                        posY = touchLocation.y - tmp*tmp_1;
                        break;
                    case 5:
                        posX = touchLocation.x -tmp_* tmp;
                        posY = touchLocation.y - tmp_*tmp;
                        break;
                    default:
                        break;
                }
                int duShu;
                for (int i = 0; i < 20; i++) {
                    duShu = arc4random()%6 - 3;
                    if (duShu) {
                        break;
                    }
                }
                element.position = ccp(posX, posY);
                element.scale = 0;
                element.visible = YES;
                [element stopAllActions];
                [element runAction:[CCSpawn actions:[CCRotateBy actionWithDuration:5 angle:360 * duShu], [CCScaleTo actionWithDuration:5 scale:1.5], nil]];
                CCLOG(@"%f,%f",touchLocation.x,touchLocation.y);
            }
//            [self removeElementByTag:element.tag];
//            int elementTag = element.tag;
            [self performSelector:@selector(removeElementByTag:) withObject:element afterDelay:5];
            
            clickEnabledNumber++;
        }
        
    } 
    
}
- (void)dealloc{
    [array release];
    [super dealloc];
}
@end
