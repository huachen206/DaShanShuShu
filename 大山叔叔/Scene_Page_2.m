//
//  Scene_Page_2.m
//  大山叔叔
//
//  Created by Hua Chen on 11-12-23.
//  Copyright 2011年 - -. All rights reserved.
//

#import "Scene_Page_2.h"
#define pageIndex 2
#define str_ch @"“谁来帮我把这些麦粒种到地里去呀？”小红母鸡问。"
#define str_en @"\"Who will help me plant this wheat into the field?\" she asked. "

const int wheat_pos[12][2] = {
    {328,282},
    {402,192},
    {498,332},
    {584,244},
    {658,154},
    {744,50},
    {672,378},
    {758,292},
    {828,206},
    {910,118},
    {848,410},
    {934,326},

};
@implementation Scene_Page_2

-(void)loadTextAndVoice{
    if (soundName) {
        [[SimpleAudioEngine sharedEngine] unloadEffect:soundName];
    }
    
    if ([SceneManager CheckLanguage]) {
        soundName = @"p2_ch.wav";
        text = [Text initWithString:str_ch isChinese:YES wordNumberOfLine:20 wordPosition:ccp(400, 550)];
        text.text_delegate = self;
    }
    else{
        soundName = @"p2_en.wav";
        text = [Text initWithString:str_en isChinese:NO wordNumberOfLine:40 wordPosition:ccp(400, 550)];
        text.text_delegate = self;
    }
    [self addChild:text];
    [[SimpleAudioEngine sharedEngine] playEffect:soundName];
}

-(void)delegateTextAdd{
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

        
        CCSprite *bk = [CCSprite spriteWithFile:@"p2_bk.pvr.ccz"];
        bk.position = ccp(size.width/2, size.height/2);
        [self addChild:bk];
        
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
        
        [cache addSpriteFramesWithFile:@"p2_.plist" textureFile:@"p2_.pvr.ccz"];
        
        oldChicken = [CCSprite spriteWithSpriteFrameName:@"母鸡.png"];
        oldChicken.position = ccp(126, 156);
        [self addChild:oldChicken];
        
        bulldozer = [CCSprite spriteWithSpriteFrameName:@"推土机.png"];
        bulldozer.position = ccp(630, 443);
        [self addChild:bulldozer];
        
        [cache addSpriteFramesWithFile:@"little_jump.plist" textureFile:@"little_jump.pvr.ccz"];

        CCSprite *littleChicken_jump = [CCSprite spriteWithSpriteFrameName:@"XJT-001.png"];
        littleChicken_jump.position = ccp(316, 100);
        [self addChild:littleChicken_jump];
        NSMutableArray *little_frames = [NSMutableArray array];
        for (int i = 1; i<= 16; i++) {
            [little_frames addObject:[cache spriteFrameByName:[NSString stringWithFormat:@"XJT-%03d.png",i]]];
        }
        [littleChicken_jump runAction:[CCRepeatForever actionWithAction:[CCSequence actions:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:little_frames delay:1.f/7]],[CCDelayTime actionWithDuration:3.f], nil]]];
        
        [cache addSpriteFramesWithFile:@"wheat_grow.plist" textureFile:@"wheat_grow.pvr.ccz"];
        
        for (int i = 0; i<12; i++) {
            CCSprite *wheat = [CCSprite spriteWithSpriteFrameName:@"wheat_grow001.png"];
            wheat.position = ccp(wheat_pos[i][0], wheat_pos[i][1] + wheat.contentSize.height/2);
            [self addChild:wheat z:3 tag:100+i];
        }
        wheat_animationFrame = [[NSMutableArray alloc] init];
        for (int i = 1;i<=25 ; i++) {
            [wheat_animationFrame addObject:[cache spriteFrameByName:[NSString stringWithFormat:@"wheat_grow%03d.png",i]]];
        }
        [self performSelector:@selector(loadTextAndVoice) withObject:self afterDelay:.9f];

    }
    return self;
}

-(void)dealloc{
    [wheat_animationFrame release];
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
- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [touch locationInView:[touch view]];
	touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    CCSprite *transition_ = (CCSprite *)[self getChildByTag:300];

    if (CGRectContainsPoint(oldChicken.boundingBox, touchLocation)) {
        if ([soundName isEqualToString:@"母鸡.WAV"]) {
            [[SimpleAudioEngine sharedEngine] unloadEffect:soundName];
        }
        soundName = @"母鸡.WAV";
        [self loadVoice:soundName];
    }
    else if(CGRectContainsPoint(bulldozer.boundingBox, touchLocation)) {
        if ([soundName isEqualToString:@"汽车喇叭.mp3"]) {
            [[SimpleAudioEngine sharedEngine] unloadEffect:soundName];
        }
        soundName = @"汽车喇叭.mp3";
        [self loadVoice:soundName];
    }
   else if (CGRectContainsPoint(transition_.boundingBox, touchLocation)){
        [self transitionNumberAnimation:@"One"];
    }

    else{
        for (int i = 0; i<12; i++) {
            CCSprite *wheat = (CCSprite *)[self getChildByTag:100+i];
            [wheat stopAllActions];
            if (CGRectContainsPoint(wheat.boundingBox, touchLocation)) {
                [wheat runAction:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:wheat_animationFrame delay:1.f/7]]];
                
            }
        }

    }
    CCLOG(@"{x:%d,Y:%d}",(int)touchLocation.x,(int)touchLocation.y );    
}

-(void)loadVoice:(NSString *)str{
    [[SimpleAudioEngine sharedEngine] playEffect:soundName];    
}
@end
