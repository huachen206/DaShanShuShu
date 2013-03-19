//
//  Scene_Page_11.m
//  daShan
//
//  Created by edwardair on 11-12-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Scene_Page_11.h"
#import "SimpleAudioEngine.h"
#import "SceneManager.h"
@implementation Scene_Page_11
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
        CGSize size = [[CCDirector sharedDirector] winSize];
        CGPoint p = ccp(size.width/2, size.height/2);
        
//        animalSounds = [[NSMutableArray alloc] init];
        animalSounds = [[NSArray alloc] initWithObjects:@"bird.wav", @"cat.wav", @"cow.wav", @"donkey.wav", @"sheep.wav", @"p11_bk_C.wav", @"p11_bk_E.wav", nil];
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];

        CCSprite *bk = [CCSprite spriteWithFile:@"p11_bk.pvr.ccz"];
        bk.position = p;
        [self addChild:bk z:0];
        
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache removeUnusedSpriteFrames];
        [cache addSpriteFramesWithFile:@"p11_sp.plist" textureFile:@"p11_sp.pvr.ccz"];
        
        for (int i = 0; i < 5; i++) {
            NSString *names;
            CCSprite *animal;
            switch (i) {
                case 0:
                    names = @"bird.png";
                    animal = [CCSprite spriteWithSpriteFrameName:names];
                    
                    animal.position = ccp(480, 289);
                    break;
                case 1:
                    names = @"cat.png";
                    animal = [CCSprite spriteWithSpriteFrameName:names];

                    animal.position = ccp(672, 416);
                    break;
                case 2:
                    names = @"cow.png";
                    animal = [CCSprite spriteWithSpriteFrameName:names];

                    animal.position = ccp(149, 537);
                    break;
                case 3:
                    names = @"donkey.png";
                    animal = [CCSprite spriteWithSpriteFrameName:names];
                    
                    animal.position = ccp(274, 219);
                    break;
                case 4:
                    names = @"sheep.png";
                    animal = [CCSprite spriteWithSpriteFrameName:names];

                    animal.position = ccp(496, 533);
                    break;
                default:
                    break;
            }
            [self addChild:animal z:1 tag:i];
        }
        
        [cache addSpriteFramesWithFile:@"transitionNumber.plist" textureFile:@"transitionNumber.pvr.ccz"];

        CCSprite *transition_ = [CCSprite spriteWithSpriteFrameName:@"10001.png"];
        transition_.position = ccp(980, 48);
        [self addChild:transition_ z:5 tag:300];
        [self transitionNumberAnimation:@"forever"];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"11" fontName:@"KaiTi_GB2312" fontSize:28];
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
        NSString *tmp1 = [NSString stringWithFormat:@"Soon, the smell of fresh-baked bread filled the whole farmyard. "];
        text = [Text initWithString:tmp1 isChinese:NO wordNumberOfLine:20 wordPosition:ccp(850, 650)];
        [self playSoundEffect:@"p11_bk_E.wav" playOrStop:YES];
    }
    else {
        NSString *tmp1 = [NSString stringWithFormat:@"不一会儿，新烤好的面包的香味就弥漫了整个农场。"];
        text = [Text initWithString:tmp1 isChinese:YES wordNumberOfLine:14 wordPosition:ccp(780, 650)];
        [self playSoundEffect:@"p11_bk_C.wav" playOrStop:YES];
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
        if (language) {
            [self playSoundEffect:@"p11_bk_C.wav" playOrStop:NO];
        }
        else {
            [self playSoundEffect:@"p11_bk_E.wav" playOrStop:NO];
        }
        for (int i = 0; i < 5; i++) {
            [[SimpleAudioEngine sharedEngine] unloadEffect:[animalSounds objectAtIndex:i]];
        }
        if (translation.x < 0) {
            [SceneManager pagingOfIndex:11 back:TransitionFadeBL];
        }
        else {
            [SceneManager pagingOfIndex:11 back:TransitionFadeTR];
        }
    }

//    CCSprite *test = (CCSprite *)[self getChildByTag:0];
//        test.position = ccp(test.position.x+translation.x, test.position.y+translation.y);
//        CCLOG(@"test:::::%f,%f",test.position.x,test.position.y);
    
}
- (void)delegateTextAdd{
    [self textAdd];
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [touch locationInView:[touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation]; 
    CCSprite *transition_ = (CCSprite *)[self getChildByTag:300];

    for (int i = 0; i < 5; i++) {
        CCSprite *animal = (CCSprite *)[self getChildByTag:i];
        if (CGRectContainsPoint(animal.boundingBox,touchLocation)) {
            [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
            [animal stopAllActions];
            animal.scale = 1;
            [animal runAction:[CCSequence actions:[CCScaleTo actionWithDuration:.5 scale:1.2], [CCScaleTo actionWithDuration:.5 scale:1.0], nil]];
           soundId = (NSNumber *) [[SimpleAudioEngine sharedEngine] playEffect:[animalSounds objectAtIndex:i]];
//            CCLOG(@"%d",[animalSounds retainCount]);
            break;
        }
    }
    if (CGRectContainsPoint(transition_.boundingBox, touchLocation)){
        [self transitionNumberAnimation:@"One"];
    }

}
- (void)dealloc{
    [animalSounds release];
    [super dealloc];
}
@end
