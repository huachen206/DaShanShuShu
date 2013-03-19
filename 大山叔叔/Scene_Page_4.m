//
//  Scene_Page_4.m
//  大山叔叔
//
//  Created by Hua Chen on 11-12-23.
//  Copyright 2011年 - -. All rights reserved.
//

#import "Scene_Page_4.h"
#define str_ch @"“那么我自己来种。”小红母鸡说。于是，她就把麦粒种到了地里。"
#define str_en @"\"Then I will do it myself, \"said the Little Red Hen. So she planted the grains of wheat into the field. "



@implementation Scene_Page_4
#define pageIndex 4

-(void)loadVoiceTwice{
       soundName = @"p4_en_2.wav"; 
    [[SimpleAudioEngine sharedEngine] playEffect:soundName];

}
-(void)loadTextAndVoice{
    if (soundName) {
        [[SimpleAudioEngine sharedEngine] unloadEffect:soundName];
    }
    
    if ([SceneManager CheckLanguage]) {
        soundName = @"p4_ch.wav";
        text = [Text initWithString:str_ch isChinese:YES wordNumberOfLine:16 wordPosition:ccp(724, 558)];
        text.text_delegate = self;
    }
    else{
        soundName = @"p4_en_1.wav";
        [self performSelector:@selector(loadVoiceTwice) withObject:self afterDelay:6.f];
        text = [Text initWithString:str_en isChinese:NO wordNumberOfLine:38 wordPosition:ccp(724, 558)];
        text.text_delegate = self;
    }
    [self addChild:text];
    [[SimpleAudioEngine sharedEngine] playEffect:soundName];
}

-(void)delegateTextAdd{
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(loadVoiceTwice) object:self];
    [self loadTextAndVoice];
    
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
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache addSpriteFramesWithFile:@"transitionNumber.plist" textureFile:@"transitionNumber.pvr.ccz"];
        
        
        CCSprite *transition_ = [CCSprite spriteWithSpriteFrameName:@"10001.png"];
        transition_.position = ccp(980, 48);
        [self addChild:transition_ z:5 tag:300];
        [self transitionNumberAnimation:@"forever"];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d",pageIndex] fontName:@"KaiTi_GB2312" fontSize:28];
        label.color = ccc3(30, 45, 79);
        label.position = ccp(980, 30);
        [self addChild:label z:5];

        CCSprite *bk = [CCSprite spriteWithFile:@"p4_bk.pvr.ccz"];
        bk.position = ccp(size.width/2, size.height/2);
        [self addChild:bk];
        
        
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
        [cache addSpriteFramesWithFile:@"p4_.plist" textureFile:@"p4_.pvr.ccz"];
        
        CCSprite *jackstraw = [CCSprite spriteWithSpriteFrameName:@"稻草人.png"];
        jackstraw.position = ccp(308, 283);
        jackstraw.tag = 101;
        [self addChild:jackstraw z:11];
        
        
        oldChicken = [CCSprite spriteWithSpriteFrameName:@"MJZL2-001001.png"];
        oldChicken.position = ccp(820, 252);
        [self addChild:oldChicken z:10];
        
        oldChikcenFrame = [[NSMutableArray alloc] init];
        for (int i = 1; i<=13; i++) {
            [oldChikcenFrame addObject:[cache spriteFrameByName:[NSString stringWithFormat:@"MJZM-%03d.png",i]]];
        }
        
        oldChickenWalkFrame = [[NSMutableArray alloc] init];
        for (int i = 1; i<=5; i++) {
            [oldChickenWalkFrame addObject:[cache spriteFrameByName:[NSString stringWithFormat:@"MJZL2-001%03d.png",i]]];
        }
        
        face = [CCSprite spriteWithSpriteFrameName:@"稻草人表情01.png"];
        face.position = ccp(270, 390);
        [self addChild:face  z:12];
        
        
        for (int i = 1; i<=3; i++) {
            NSString *frameName = [NSString string];
            CCSprite *pinkFlower;
            NSMutableArray *animationFrame = [NSMutableArray array];
            switch (i) {
                case 1:
                    frameName = @"粉色";
                    pinkFlower = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"%@001.png",frameName]];
                    pinkFlower.tag = 101+i;
                    pinkFlower.position = ccp(236, 542);
                    pinkFlower.rotation = 30;
                    for (int j = 1; j<=7; j++) {
                        [animationFrame addObject:[cache spriteFrameByName:[NSString stringWithFormat:@"%@%03d.png",frameName,j]]];
                    }
                    [self addChild:pinkFlower z:12];
                    [pinkFlower runAction:[CCRepeatForever actionWithAction:[CCSequence actions:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:animationFrame delay:1.f/7]],[CCDelayTime actionWithDuration:3.f], nil]]];
                     break;
                case 2:
                    frameName = @"橙色";
                    pinkFlower = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"%@001.png",frameName]];
                    pinkFlower.tag = 101+i;
                    pinkFlower.position = ccp(238, 232);
                    pinkFlower.rotation = -30;

                    for (int j = 1; j<=7; j++) {
                        [animationFrame addObject:[cache spriteFrameByName:[NSString stringWithFormat:@"%@%03d.png",frameName,j]]];
                    } 
                    [self addChild:pinkFlower z:12];
                    [pinkFlower runAction:[CCRepeatForever actionWithAction:[CCSequence actions:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:animationFrame delay:1.f/7]],[CCDelayTime actionWithDuration:3.f], nil]]];
                    break;
                case 3:
                    frameName = @"蓝色";
                    pinkFlower = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"%@001.png",frameName]];
                    pinkFlower.tag = 101+i;
                    pinkFlower.position = ccp(368, 294);
                    pinkFlower.rotation = 30;

                    for (int j = 1; j<=7; j++) {
                        [animationFrame addObject:[cache spriteFrameByName:[NSString stringWithFormat:@"%@%03d.png",frameName,j]]];
                    }
                    [self addChild:pinkFlower z:12];
                    [pinkFlower runAction:[CCRepeatForever actionWithAction:[CCSequence actions:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:animationFrame delay:1.f/7]],[CCDelayTime actionWithDuration:3.f], nil]]];
                   break;
                default:
                    break;
            }
        }
        [self performSelector:@selector(loadTextAndVoice) withObject:self afterDelay:.9f];
        
    }
    return self;
}

-(void)dealloc{
    [oldChickenWalkFrame release];
    [oldChikcenFrame release];
    [super dealloc];
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
    
//    if (CGRectContainsPoint(oldChicken.boundingBox, location)) {
//        oldChickenFlg = YES;
//    }
    return YES;
    
}
- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    
    
//    for (int i = 1; i<=4; i++) {
//        
//        CCSprite *tmp = (CCSprite *)[self getChildByTag:101+i];
//        if (CGRectContainsPoint(tmp.boundingBox, touchLocation)) {
//            tmp.position = ccpAdd(tmp.position, translation);
//            CCLOG(@"x:%f    Y:%f",tmp.position.x,tmp.position.y );   
//        }
// 
//    }

    //    CCLOG(@"x:%f   y:%f",translation.x,translation.y );
    //    CCLOG(@"%d",abs(translation.x ));
//    if (!oldChickenFlg) {
        if (abs(translation.x)>25&& CGRectContainsPoint(slide_rect, touchLocation)) {
            [self cleanup];
            if (soundName) {
                [[SimpleAudioEngine sharedEngine] unloadEffect:soundName];
            }
            [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(loadTextAndVoice) object: self];
            [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(loadVoiceTwice) object:self];
            [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(plantWheat) object:self];
            if (translation.x < 0) {
                [SceneManager pagingOfIndex:pageIndex back:TransitionFadeBL];
            }
            else {
                [SceneManager pagingOfIndex:pageIndex back:TransitionFadeTR];
            }
        }
//    }
//    else{
//    
//        oldChicken.position = ccpAdd(oldChicken.position, translation);
//    }
}

-(void)plantWheat{
    CCSprite *wheat = [CCSprite spriteWithSpriteFrameName:@"麦粒.png"];
        wheat.position = ccpAdd(oldChicken.position, ccp( oldChicken.scaleX*50, -45));
    [self addChild:wheat z:9];
}

-(void)stopAction:(CCAction *)action{
    [oldChicken stopAction:action];
    [oldChicken runAction:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:oldChikcenFrame delay:1.f/7]]];

}
- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [touch locationInView:[touch view]];
	touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    
    float oldY = -0.0003*touchLocation.x*touchLocation.x + 0.4771*touchLocation.x + 109.83;
    CCSprite *transition_ = (CCSprite *)[self getChildByTag:300];
    if (CGRectContainsPoint(transition_.boundingBox, touchLocation)){
        [self transitionNumberAnimation:@"One"];
    }

    else if (touchLocation.y<=oldY) {
        [oldChicken stopAllActions];
        if (oldChicken.position.x <= touchLocation.x) {
            oldChicken.scaleX = 1;
        }
        else {
            oldChicken.scaleX = -1;
        }
        float length = sqrtf((touchLocation.x - oldChicken.position.x)*(touchLocation.x - oldChicken.position.x)+(touchLocation.y - oldChicken.position.y)*(touchLocation.y - oldChicken.position.y));
        float duration = length/200;

        id walk = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:oldChickenWalkFrame delay:1.f/7]]];
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(plantWheat) object:self];
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(stopAction:) object:walk];

        [oldChicken runAction:walk];
        [oldChicken runAction:[CCMoveTo actionWithDuration:duration position:touchLocation]];
        [self performSelector:@selector(stopAction:) withObject:walk afterDelay:duration];
        [self performSelector:@selector(plantWheat) withObject:self afterDelay:duration + 1.5f];
        
    }
    
    
    
    if (CGRectContainsPoint(face.boundingBox, touchLocation)) {
        if (!face_flg) {
            [face setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"稻草人表情02.png"]];
            face_flg = YES;
        }
        else {
            [face setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"稻草人表情01.png"]];
            face_flg = NO;
        }
    }
//    if (oldChicken) {
//        CCSprite *wheat = [CCSprite spriteWithSpriteFrameName:@"麦粒.png"];
//        wheat.position = oldChicken.position;
//        [self addChild:wheat z:9];
//        oldChickenFlg = NO;
//
//    }
    
    
    CCLOG(@"x:%f    Y:%f",touchLocation.x,touchLocation.y );    
}


@end
