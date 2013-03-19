//
//  Scene_Page_1.m
//  大山叔叔
//
//  Created by Hua Chen on 11-12-22.
//  Copyright 2011年 - -. All rights reserved.
//

#import "Scene_Page_1.h"
#define pageIndex 1
#define str_ch @"一天，当小红母鸡和她的孩子们正在农场上玩耍的时候，她发现了一些麦粒。"
#define str_en @"One day, Little Red Hen was playing in the farmyard with her baby chicks when she found some grains of wheat. "

#define str_1 @"\"Who will help me plant this wheat into the field?\" she asked. "
@implementation Scene_Page_1

-(void)loadTextAndVoice{
    if (soundName) {
        [[SimpleAudioEngine sharedEngine] unloadEffect:soundName];
    }

    if ([SceneManager CheckLanguage]) {
        soundName = @"p1_ch.wav";
        text = [Text initWithString:str_ch isChinese:YES wordNumberOfLine:24 wordPosition:ccp(604, 640)];
        text.text_delegate = self;
    }
    else{
        soundName = @"p1_en.wav";
        text = [Text initWithString:str_en isChinese:NO wordNumberOfLine:57 wordPosition:ccp(604, 640)];
        text.text_delegate = self;
        }
    [self addChild:text];
    [[SimpleAudioEngine sharedEngine] playEffect:soundName];
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
        
//        [[CCDirector sharedDirector] setProjection:kCCDirectorProjection3D];

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

        
        CGSize size = [[CCDirector sharedDirector] winSize];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
        [cache addSpriteFramesWithFile:@"littleChickenWalk.plist" textureFile:@"littleChickenWalk.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"oldChickenWalk.plist" textureFile:@"oldChickenWalk.pvr.ccz"];
        

        CCSprite *bk_01 = [CCSprite spriteWithFile:@"P1.png"];
        bk_01.position = ccp(size.width/2, size.height/2);
        [self addChild:bk_01 z:-0];
        
   
        //        NSMutableArray *animFrames_Little = [NSMutableArray array];
        //        for(int i = 1; i <= 3; i++) {
        //            // Obtain frames by alias name
        //            NSString *frameName = [NSString stringWithFormat:@"XJZL-%03d.png",i];
        //            CCLOG(@"%@",frameName);
        //            CCSpriteFrame *frame = [cache spriteFrameByName:frameName];
        //            [animFrames_Little addObject:frame];
        //            if (i == 1) {
        //                littleChicken = [CCSprite spriteWithSpriteFrame:frame];
        //            }}
        //        CCAnimation *animation_Little = [CCAnimation animationWithFrames:animFrames_Little];
        //        id action_little_repeat = [CCRepeatForever actionWithAction:[CCAnimate actionWithDuration:.6f animation:animation_Little restoreOriginalFrame:NO]];
        //        [self addChild:littleChicken];
        //        littleChicken.position = ccp(500, 380);
        //        [littleChicken runAction:action_little_repeat];  
        
        LittleChicken *littleChicken = [LittleChicken initWithFile:@"XJZL-001.png"];
        //        littleChicken.delegate = self;
        littleChicken.tag = 201;
        littleChicken.position = ccp(500, 380);
        [self addChild:littleChicken];
        
        LittleChicken *littleChicken1 = [LittleChicken initWithFile:@"XJZL-001.png"];
        //        littleChicken.delegate = self;
        littleChicken1.tag = 202;
        littleChicken1.position = ccp(400, 300);
        [self addChild:littleChicken1];

        
        NSMutableArray *animFrames_Old = [NSMutableArray array];
        for(int i = 1; i <= 5; i++) {
            // Obtain frames by alias name
            NSString *frameName = [NSString stringWithFormat:@"MJZL-%03d.png",i];
            CCLOG(@"%@",frameName);
            CCSpriteFrame *frame = [cache spriteFrameByName:frameName];
            [animFrames_Old addObject:frame];
            if (i == 1) {
                oldChicken = [CCSprite spriteWithSpriteFrame:frame];
            }}
        CCAnimation *animation_Old = [CCAnimation animationWithFrames:animFrames_Old];
        id action_old_repeat = [CCRepeatForever actionWithAction:[CCAnimate actionWithDuration:.8f animation:animation_Old restoreOriginalFrame:NO]];
        [self addChild:oldChicken];
        oldChicken.position = ccp(769, 282);
        [oldChicken runAction:action_old_repeat];  
        

//        text = [Text initWithString:str_en isChinese:NO wordNumberOfLine:57 wordPosition:ccp(604, 640)];
//        [self addChild:text z:1 tag:101];
        

        [self performSelector:@selector(loadTextAndVoice) withObject:self afterDelay:.9f];
//        [self loadTextAndVoice];
    }
    return self;
}


-(void)delegateTextAdd{
    [self loadTextAndVoice];

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
    if (CGRectContainsPoint(oldChicken.boundingBox, location)) {
        oldFlg = YES;
    }

    return YES;
    
}
- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    
//    CCSprite *tmp = (CCSprite *)[self getChildByTag:101];
//    tmp.position = ccpAdd(tmp.position, translation);
//    CCLOG(@"x:%f    Y:%f",tmp.position.x,tmp.position.y );    
//    CCLOG(@"x:%f   y:%f",translation.x,translation.y );
//    CCLOG(@"%d",abs(translation.x ));
    
    if (oldFlg) {
        if (translation.x<0) {
            oldChicken.scaleX = -1;
        }
        else {
            oldChicken.scaleX = 1;
        }
        oldChicken.position = ccpAdd(oldChicken.position, translation);
        LittleChicken *spt = (LittleChicken *)[self getChildByTag:201];
        
        int fanwei = 40;
        CGRect feelRect = CGRectMake(spt.position.x - fanwei, spt.position.y- fanwei, spt.position.x +fanwei, spt.position.y +fanwei);
        if(CGRectContainsPoint(feelRect, oldChicken.position) && spt.walk == NO){
            spt.walk = YES;
        }
        if (spt.walk) {
            [spt littleChickenWalkWithOldPosition:oldChicken.position type:1];

        }
        
        LittleChicken *spt1 = (LittleChicken *)[self getChildByTag:202];
        CGRect feelRect1 = CGRectMake(spt1.position.x - fanwei, spt1.position.y- fanwei, spt1.position.x +fanwei, spt1.position.y +fanwei);
        if(CGRectContainsPoint(feelRect1, oldChicken.position) && spt1.walk == NO){
            spt1.walk = YES;
        }
        if (spt.walk) {
            [spt1 littleChickenWalkWithOldPosition:oldChicken.position type:2];
            
        }

        
    }
    else{
    if (abs(translation.x)>25&& CGRectContainsPoint(slide_rect, touchLocation)) {
        [self cleanup];
        if (soundName) {
            [[SimpleAudioEngine sharedEngine] unloadEffect:soundName];
        }
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(loadTextAndVoice) object:self];

        if (translation.x < 0) {
            [SceneManager pagingOfIndex:pageIndex back:TransitionFadeBL];
        }
        else {
            [SceneManager pagingOfIndex:pageIndex back:TransitionFadeTR];
        }
    }
    }
}
- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [touch locationInView:[touch view]];
	touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    oldFlg = NO;
    CCSprite *transition_ = (CCSprite *)[self getChildByTag:300];
    if (CGRectContainsPoint(transition_.boundingBox, touchLocation)){
        [self transitionNumberAnimation:@"One"];
    }

    CCLOG(@"x:%f    Y:%f",touchLocation.x,touchLocation.y );    
}

@end
