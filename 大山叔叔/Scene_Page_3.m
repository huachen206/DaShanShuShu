//
//  Scene_Page_3.m
//  大山叔叔
//
//  Created by Hua Chen on 11-12-23.
//  Copyright 2011年 - -. All rights reserved.
//

#import "Scene_Page_3.h"

#define pageIndex 3
#define str_ch @"“我不去。”鹅说。    “我也不去。”鸭子说。"
#define str_en @"\"Not me, \"said the Goose. \"Not me, either, \"said the Duck. "


const int bigSmoke[8][2]={
    {646, 368},
    {666, 222},
    {596, 208},
    {664, 50},
    
    {180, 412},
    {202, 222},
    {292, 212},
    {264, 84} ,

};

@implementation Scene_Page_3
-(void)loadVoiceTwice:(NSString *)soundname{
    soundName = soundname; 
    [[SimpleAudioEngine sharedEngine] playEffect:soundName];
    
}

-(void)loadTextAndVoice{
    if (soundName) {
        [[SimpleAudioEngine sharedEngine] unloadEffect:soundName];
    }
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(loadVoiceTwice:) object:@"p3_ch_2.wav"];
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(loadVoiceTwice:) object:@"p3_en_2.wav"];
    if ([SceneManager CheckLanguage]) {
        soundName = @"p3_ch_1.wav";
        text = [Text initWithString:str_ch isChinese:YES wordNumberOfLine:13 wordPosition:ccp(782, 612)];
        text.text_delegate = self;
        [self performSelector:@selector(loadVoiceTwice:) withObject:@"p3_ch_2.wav" afterDelay:3.5f];
    }
    else{
        soundName = @"p3_en_1.wav";
        text = [Text initWithString:str_en isChinese:NO wordNumberOfLine:28 wordPosition:ccp(782, 612)];
        text.text_delegate = self;
        [self performSelector:@selector(loadVoiceTwice:) withObject:@"p3_en_2.wav" afterDelay:3.5f];

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

        CCSprite *bk = [CCSprite spriteWithFile:@"p3_bk.pvr.ccz"];
        bk.position = ccp(size.width/2, size.height/2);
        [self addChild:bk];
        
        
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
        [cache addSpriteFramesWithFile:@"p3_.plist" textureFile:@"p3_.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"umbrella.plist" textureFile:@"umbrella.pvr.ccz"];

        
        umbrella = [CCSprite spriteWithSpriteFrameName:@"umbrella001.png"];
        umbrella.position = ccp(368, 460);
        umbrella.tag = 103;
        [self addChild:umbrella];

        tomGoose = [CCSprite spriteWithSpriteFrameName:@"公鹅.png"];
        tomGoose.position = ccp(666, 222);
        tomGoose.tag = 101;
        [self addChild:tomGoose];
        
        henGoose = [CCSprite spriteWithSpriteFrameName:@"母鹅.png"];
        henGoose.position = ccp(240, 248);
        henGoose.tag = 102;
        [self addChild:henGoose];
             
        CCSprite *water_bottle = [CCSprite spriteWithSpriteFrameName:@"茶壶.png"];
        water_bottle.position = ccp(398, 318);
        water_bottle.tag = 104;
        [self addChild:water_bottle];
        
        umbrella_frame = [[NSMutableArray alloc]init];
        for (int i = 1; i<=5; i++) {
            [umbrella_frame addObject:[cache spriteFrameByName:[NSString stringWithFormat:@"umbrella%03d.png",i]]];
        }
        
        
        [self performSelector:@selector(loadTextAndVoice) withObject:self afterDelay:.9f];

    }
    return self;
}

-(void)dealloc{
    [umbrella_frame release];
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
//    if (CGRectContainsPoint(tomGoose.boundingBox, location)) {
//        tomGooseFlg = YES;
//    }
//    else if (CGRectContainsPoint(henGoose.boundingBox, location)){
//        henGooseFlg = YES;
//    }
//    else {
//        return YES;
//    }
//    
    return YES;
    
}
- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    
//    CCSprite *tmp = (CCSprite *)[self getChildByTag:104];
//    tmp.position = ccpAdd(tmp.position, translation);
//    CCLOG(@"x:%f    Y:%f",tmp.position.x,tmp.position.y );    
//    CCLOG(@"x:%f   y:%f",translation.x,translation.y );
//    CCLOG(@"%d",abs(translation.x ));
    if (!tomGooseFlg && !henGooseFlg) {
        if (abs(translation.x)>25&& CGRectContainsPoint(slide_rect, touchLocation)) {
            [self cleanup];
            if (soundName) {
                [[SimpleAudioEngine sharedEngine] unloadEffect:soundName];
            }
            [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(loadTextAndVoice) object:self];
            [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(loadVoiceTwice:) object:@"p3_ch_2.wav"];
            [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(loadVoiceTwice:) object:@"p3_en_2.wav"];
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
    CCSprite *transition_ = (CCSprite *)[self getChildByTag:300];

    if (CGRectContainsPoint(umbrella.boundingBox, touchLocation) &&  !unbrellaIsClosed) {
        if (soundName) {
            [[SimpleAudioEngine sharedEngine] unloadEffect:soundName];
        }
        soundName = @"收伞.WAV";
        [[SimpleAudioEngine sharedEngine] playEffect:soundName];

        [umbrella setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:@"umbrella005.png"]];
        unbrellaIsClosed = YES;
        [umbrella runAction:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:umbrella_frame delay:1.0f/7]]];
        [self performSelector:@selector(burntE) withObject:self afterDelay:1.0f/7*5];
    }
    else if (CGRectContainsPoint(transition_.boundingBox, touchLocation)){
        [self transitionNumberAnimation:@"One"];
    }
    

    CCLOG(@"x:%f    Y:%f",touchLocation.x,touchLocation.y );    
}


-(void)changeBlack{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"p3_burntE.plist" textureFile:@"p3_burntE.pvr.ccz"];
    [tomGoose setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"焦鹅10007.png"]];
    [henGoose setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:@"母鹅0007.png"]];
    

}

-(void)changeBack{
    [tomGoose setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"公鹅.png"]];
    [henGoose setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:@"母鹅.png"]];

    for (int i = 0; i<8; i++) {
        smoke1 = (CCSprite *)[self getChildByTag:200+i];
        smoke1.visible = NO;
    }
    [umbrella setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:@"umbrella001.png"]];
    unbrellaIsClosed = NO;


}

-(void)smoke{
    boom_tom.visible = NO;
    boom_hen.visible = NO;
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"p3_smoke.plist" textureFile:@"p3_smoke.pvr.ccz"];
    NSMutableArray *smokeFrame = [NSMutableArray array];
    for (int i = 1; i<=32; i++) {
        [smokeFrame addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"1-烟%04d.png",i]]];
    }

    if (!smoke1) {
        for (int i = 0; i<8; i++) {
            smoke1 = [CCSprite spriteWithSpriteFrameName:@"1-烟0001.png"];
            smoke1.position = ccp(bigSmoke[i][0], bigSmoke[i][1]);
            if (i == 0) {
                smoke1.scale = 1.3;
            }
            smoke1.tag = 200+i;
            [self addChild:smoke1];
            [smoke1 runAction:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:smokeFrame delay:1.f/12]]];

        }
 
    }
    else{
        for (int i = 0; i<8; i++) {
            smoke1 = (CCSprite *)[self getChildByTag:200+i];
            smoke1.visible = YES;
            [smoke1 runAction:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:smokeFrame delay:1.f/12]]];

        }

    
    }
    


}

-(void)burntE{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"p3_boom.plist" textureFile:@"p3_boom.pvr.ccz"];
    if (!boom_tom) {
        boom_tom = [CCSprite spriteWithSpriteFrameName:@"爆炸0001.png"];
        boom_tom.position = ccp(666, 222);
        [self addChild:boom_tom];
        
        boom_hen = [CCSprite spriteWithSpriteFrameName:@"爆炸0001.png"];
        boom_hen.position = ccp(240, 248);
        [self addChild:boom_hen];
    }
    else{
        boom_tom.visible = YES;
        boom_hen.visible = YES;
    
    }
    NSMutableArray *boomFrame = [NSMutableArray array];
    for (int i = 1; i<=16; i++) {
        [boomFrame addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"爆炸%04d.png",i]]];
    }
    [boom_tom runAction:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:boomFrame delay:1.f/7]]];
    [boom_hen runAction:[CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:boomFrame delay:1.f/7]]];

    [self performSelector:@selector(changeBlack) withObject:self afterDelay:0.6f];
    [self performSelector:@selector(smoke) withObject:self afterDelay:1.f];
    [self performSelector:@selector(changeBack) withObject:self afterDelay:2.5f];
     



}
@end
