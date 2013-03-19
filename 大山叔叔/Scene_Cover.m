//
//  Scene_Cover.m
//  大山叔叔
//
//  Created by Hua Chen on 11-12-22.
//  Copyright 2011年 - -. All rights reserved.
//

#import "Scene_Cover.h"
#import "AppDelegate.h"

#define lanPos CGPointMake( 800 ,600)
#define StartReading CGRectMake(866,314,114,122)
#define PictureGame  CGRectMake(866,188,124,64)
#define SendEmail    CGRectMake(858,108,106,56)
#define MoreBook     CGRectMake(856,28,122,56)
#define SleepingMode CGRectMake(856,631,168,137)

@implementation Scene_Cover

-(void)changtouchAllow{
    touchAllow = NO;
}
-(void)languageChange{
    
    if (!touchAllow) {
        touchAllow = YES;
        [self performSelector:@selector(changtouchAllow) withObject:nil afterDelay:1.f];
        //    int moveSpace = 30;
        float DurationA = .2f;
        float DurationB = .3f;

        CGPoint moveSpaceA = ccp(-42, -33);
        CGPoint moveSpaceB = ccp(42, 33);
        id bigA = [CCScaleTo actionWithDuration:DurationA scale:1.1f];
        id moveUpA = [CCMoveBy actionWithDuration:DurationA position:moveSpaceA];
        id hideA = [CCFadeOut actionWithDuration:DurationB];
        id moveDownA = [CCMoveBy actionWithDuration:DurationB position:moveSpaceB];
        id restoreA = [CCScaleTo actionWithDuration:DurationB scale:1.f];
        
        id spawn1A = [CCSpawn actions:bigA,moveUpA, nil];
        id spawn2A = [CCSpawn actions:hideA,moveDownA,restoreA, nil];
        
        id seqA = [CCSequence actions:[CCShow action],spawn1A,spawn2A,[CCHide action], nil];
        
        id smallB = [CCScaleTo actionWithDuration:DurationA scale:.9f];
        id moveDownB = [CCMoveBy actionWithDuration:DurationA position:moveSpaceB];
        id showB = [CCFadeIn actionWithDuration:DurationB];
        id moveUpB = [CCMoveBy actionWithDuration:DurationB position:moveSpaceA];
        id restoreB = [CCScaleTo actionWithDuration:DurationB scale:1.f];
        
        id spawn1B = [CCSpawn actions:smallB,moveDownB,showB, nil];
        id spawn2B = [CCSpawn actions:moveUpB,restoreB, nil];
        id seqB = [CCSequence actions:[CCShow action],spawn1B,spawn2B,[CCShow action], nil];
        
        
        if (item_Ch.visible) {
            [self reorderChild:item_Ch z:100];
            [self reorderChild:item_En z:101];
            [item_Ch runAction:seqA];
            //        item_En.visible = YES;
            [item_En runAction:seqB];
            page =[NSUserDefaults standardUserDefaults];
            [page setBool:NO forKey:@"language"];
            
        }
        else {
            [self reorderChild:item_Ch z:101];
            [self reorderChild:item_En z:100];
            
            [item_En runAction:seqA];
            //        item_Ch.visible = YES;
            [item_Ch runAction:seqB];
            page =[NSUserDefaults standardUserDefaults];
            [page setBool:YES forKey:@"language"];
            
        }

    }
}

-(void)title{
    [title_En runAction:[CCSequence actions:[CCShow action],[CCFadeIn actionWithDuration:1.f],nil]];
    [redCicle runAction:[CCSequence actions:[CCDelayTime actionWithDuration:1.f],[CCMoveTo actionWithDuration:.5f position:ccp(170,260)],nil]];
    [title_Ch runAction:[CCSequence actions:[CCDelayTime actionWithDuration:1.5f], [CCShow action],[CCFadeIn actionWithDuration:.5f],nil]];
}

//-(void) emailCallback
//{
//	[(AppDelegate*)[[UIApplication sharedApplication] delegate] sendEmail];
//}


-(id) init
{
	if( (self=[super init])) {
        
        // Font Item
//		CCMenuItem *emailItem = [CCMenuItemFont itemFromString: @"Email" target:self selector:@selector(emailCallback)];
//		CCMenu *menu = [CCMenu menuWithItems: emailItem, nil];
//		menu.position = ccp(50,50);
//        [self addChild:menu z:10];
//        @"Chinese.mp3"
//        @"English.mp3"
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"Chinese.mp3"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"English.mp3"];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"bgm.mp3"];
        page =[NSUserDefaults standardUserDefaults];
        [page setBool:YES forKey:@"language"]; //Chinese
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];

        CGSize size = [[CCDirector sharedDirector] winSize];
        bk_01 = [CCSprite spriteWithFile:@"coverBk1.pvr.ccz"];
        bk_01.position = ccp(size.width/2, size.height/2);
        [self addChild:bk_01];
        
        redCicle = [CCSprite spriteWithFile:@"红日.png"];
        redCicle.position = ccp(170,-50);
        [self addChild:redCicle];
        
        title_Ch = [CCSprite spriteWithFile:@"标题(中).png"];
        title_Ch.position = ccp(210, 270);
        [self addChild:title_Ch];
        title_Ch.visible = NO;
        
        title_En = [CCSprite spriteWithFile:@"标题(英).png"];
        title_En.position = ccp(300, 550);
        [self addChild:title_En];
        title_En.visible = NO;
        
        item_En = [CCMenuItemImage itemFromNormalImage:@"language_En.png"
                                         selectedImage:@"language_En.png"
                                                target:self
                                              selector:@selector(languageChange)];
        
        item_Ch = [CCMenuItemImage itemFromNormalImage:@"language_Ch.png"
                                         selectedImage:@"language_Ch.png"
                                                target:self
                                              selector:@selector(languageChange)];
        
        item_Ch.position=ccp(800,600);
        item_En.position=ccp(805,605);

        CCMenu *language_menu = [CCMenu menuWithItems:item_En,item_Ch,nil];
        language_menu.position = ccp(0, 0);
        language_menu.tag = 20;
        [self addChild:language_menu];
        
        CCMenuItemImage *fanHui = [CCMenuItemImage itemFromNormalImage:@"return.png"
                                                         selectedImage:nil
                                                                target:self
                                                              selector:@selector(call_fanHui)];
//        CCMenuItemImage *boFang = [CCMenuItemImage itemFromNormalImage:@"pause.png"
//                                                         selectedImage:nil
//                                                                target:self
//                                                              selector:@selector(call_playOrStop)];
        fanHui.position = ccp(450, 384);
//        boFang.position = ccp(630, 395);
        
        CCMenu *sleepingMode_menu = [CCMenu menuWithItems:fanHui,nil];
        sleepingMode_menu.position = ccp(0, 0);
        sleepingMode_menu.tag = 30;
        sleepingMode_menu.visible = NO;
        sleepingMode_menu.isTouchEnabled = NO;
        [self addChild:sleepingMode_menu z:121];
        
        
        [self title];
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
        bk_02 = [CCSprite spriteWithFile:@"coverBk2.png"];
        bk_02.position = ccp(size.width/2, size.height/2);
        [self addChild:bk_02 z:120];
        bk_02.visible = NO;

        CCSprite *playBtn = [CCSprite spriteWithFile:@"play.png"];
        playBtn.position = ccp(630, 395);
        playBtn.visible = NO;
        [self addChild:playBtn z:122 tag:31];
        
        CCSprite *pauseBtn = [CCSprite spriteWithFile:@"pause.png"];
        pauseBtn.position = ccp(630, 395);
        pauseBtn.visible = NO;
        [self addChild:pauseBtn z:122 tag:33];

        
//        //中文C  英文E
//        soundNamesC = [[NSArray alloc] initWithObjects:@"p1_ch.wav",@"p2_ch.wav",@"p3_ch_1.wav",@"p3_ch_2.wav",@"p4_ch.wav",@"zhong_5.wav",@"6-1-zhong.wav",@"6-2-zhong.wav",@"7-zhong.wav",@"zhong_8.wav",@"zhong_1.wav",@"zhong_2.wav",@"p10_soundC.wav",@"p11_bk_C.wav",@"p12_soundC.wav",@"p13_sound1C.wav",@"p14_soundC.wav",nil];
//        soundNamesE = [[NSArray alloc] initWithObjects:@"p1_en.wav",@"p2_en.wav",@"p3_en_1.wav",@"p3_en_2.wav",@"p4_en_1.wav",@"p4_en_2.wav",@"ying_5.wav",@"6-1-yin.wav",@"6-2-yin.wav",@"7-ying.wav",@"7-ying1.wav",@"ying_8.wav",@"ying_1.wav",@"ying_2.wav",@"p10_soundE.wav",@"p11_bk_E.wav",@"p12_soundE.wav",@"p13_sound1E.wav",@"p14_soundE.wav",nil];
    }
    return self;
}
- (void)call_fanHui{
    CCSprite *playBtn = (CCSprite *)[self getChildByTag:31];
    CCSprite *pauseBtn = (CCSprite *)[self getChildByTag:33];
    playBtn.visible = NO;
    pauseBtn.visible = NO;
    bk_02.visible = NO;
    CCMenu* menu = (CCMenu *)[self getChildByTag:20];
    menu.isTouchEnabled = YES;

    CCMenu* sleepingMode_menu = (CCMenu *)[self getChildByTag:30];
    sleepingMode_menu.visible = NO;
    sleepingMode_menu.isTouchEnabled = NO;
    [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(call_fanHui) object:self];

}
- (void)call_playOrStop{
    CCSprite *playBtn = (CCSprite *)[self getChildByTag:31];
    CCSprite *pauseBtn = (CCSprite *)[self getChildByTag:33];
    
    if (!playBtn.visible) {
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundId];
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(call_fanHui) object:self];
    }
    else {
        [self playMusic];
    }
    pauseBtn.visible = !pauseBtn.visible;

    playBtn.visible = !playBtn.visible;
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
    CCSprite *pause = (CCSprite *)[self getChildByTag:33];
    CCSprite *play = (CCSprite *)[self getChildByTag:31];
    if (bk_02.visible) {
        if (CGRectContainsPoint(pause.boundingBox, location)||
            (CGRectContainsPoint(play.boundingBox, location))) {
            return YES;
        }
        else {
            return NO;
        }
    }
//    if (pause.visible || play.visible) return YES;
//    return !bk_02.visible;
    return YES;
}
- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
//    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
//    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
//    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
//    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
//    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
//    CCLOG(@"x:%f   y:%f",translation.x,translation.y );
//    CCLOG(@"%d",abs(translation.x ));
}
- (void)playMusic{
    if (language) {
        sound = @"Chinese.mp3";
        [self performSelector:@selector(call_fanHui) withObject:self afterDelay:100];
    }
    else {
        sound = @"English.mp3";
        [self performSelector:@selector(call_fanHui) withObject:self afterDelay:110];
    }
    soundId = (NSNumber *)[[SimpleAudioEngine sharedEngine] playEffect:sound];
}
- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [touch locationInView:[touch view]];
	touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    CCSprite *pause = (CCSprite *)[self getChildByTag:33];
    if (CGRectContainsPoint(pause.boundingBox, touchLocation) && (bk_02.visible)) {
//        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(call_fanHui) object:self];
        [self call_playOrStop];
    }
    if (CGRectContainsPoint(StartReading, touchLocation)) {
        [self cleanup];
        [SceneManager pagingOfIndex:-3 back:TransitionFadeBL];
    }
    else if (CGRectContainsPoint(PictureGame, touchLocation)){
        [SceneManager call_game:TransitionCrossFade];
    }
    else if (CGRectContainsPoint(SendEmail, touchLocation)){
        [(AppDelegate*)[[UIApplication sharedApplication] delegate] sendEmail];
    }
    else if (CGRectContainsPoint(MoreBook, touchLocation)){
        [SceneManager call_more:TransitionCrossFade];
    }
    else if (CGRectContainsPoint(SleepingMode, touchLocation)){
        bk_02.visible = YES;
        pause.visible = YES;
        CCMenu* menu = (CCMenu *)[self getChildByTag:20];
        CCMenu* sleepingMode_menu = (CCMenu *)[self getChildByTag:30];
        sleepingMode_menu.visible = YES;
        sleepingMode_menu.isTouchEnabled = YES;
        menu.isTouchEnabled = NO;
        language = [SceneManager CheckLanguage];
//        languageTmp = language;
//        [self performSelector:@selector(call_fanHui) withObject:self afterDelay:420];
        [self playMusic];
    }
    CCLOG(@"x:%f    Y:%f",touchLocation.x,touchLocation.y );    
}

@end

