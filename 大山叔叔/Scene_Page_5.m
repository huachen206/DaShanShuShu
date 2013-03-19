//
//  Scene_Page_5.m
//  dashan
//
//  Created by Liu Yang on 11-12-20.
//  Copyright 2011年 Jiangsu  Zhongka  Educational  Science and   Technology  Co.，Ltd. All rights reserved.
//

#import "Scene_Page_5.h"
#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#define ds9   ccp(415, 240)
#define ds10  ccp(415, 290)
#define ds11  ccp(415, 340)
#define ds12  ccp(415, 390)
#define ds13  ccp(415, 420)
#define ds14  ccp(415, 470)
#define ds15  ccp(415, 520)
#define ds16  ccp(415, 570)
@implementation Scene_Page_5
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
        arry = [[NSMutableArray alloc ]init];
        [arry addObject:[NSValue valueWithCGRect:CGRectMake(10, 10, 1024, 40)]];
        [arry addObject:[NSValue valueWithCGRect:CGRectMake(10, 0, 30, 768)]];
        [arry addObject:[NSValue valueWithCGRect:CGRectMake(1024, 0, -30, 768)]];
        [arry addObject:[NSValue valueWithCGRect:CGRectMake(10, 768, 1024, -20)]];
        a=0;
        b=0;
        c=0;
        bol1 = YES;
        bol2 = YES;
        bol3 = YES;
        bol4 = YES;
        bol5 = YES;
        bol6 = YES;
        bol7 = YES;
        bol8 = YES;
        bol9 = YES;
        [[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
        cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache addSpriteFramesWithFile:@"p5_mj.plist" textureFile:@"p5_mj.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"p8_xj.plist" textureFile:@"p8_xj.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"transitionNumber.plist" textureFile:@"transitionNumber.pvr.ccz"];
        CCSprite *bk = [CCSprite spriteWithFile:@"p5_bk.pvr.ccz"];
        bk.position = ccp(512, 384);
        [self addChild:bk];
        
        CCSprite *bk1 = [CCSprite spriteWithSpriteFrameName:@"p5_mj.png"];
        bk1.position = ccp(255, 255);
        bk1.tag =1;
        [self addChild:bk1 z:1];
        
        CCSprite *bk2 = [CCSprite spriteWithSpriteFrameName:@"p5_mjs.png"];
        bk2.anchorPoint = CGPointMake(0.f, 0.5f);
        bk2.position = ccp(275, 160);
        bk2.tag = 2;
        [self addChild:bk2 z:1];
        
        CCSprite *bk3 = [CCSprite spriteWithSpriteFrameName:@"p5_cao.png"];
        bk3.position = ccp(843, 305);
        bk3.tag = 3;
        [self addChild:bk3 z:1];
    
        CCSprite *bk4 = [CCSprite spriteWithSpriteFrameName:@"p5_cao.png"];
        bk4.position = ccp(745, 188);
        bk4.tag = 4;
        [self addChild:bk4 z:1];
        
        CCSprite *bk5 = [CCSprite spriteWithSpriteFrameName:@"p5_ds2.png"];
        bk5.position = ccp(572, 65);
        bk5.tag = 5;
        [self addChild:bk5 z:1];
        
        CCSprite *bk9 = [CCSprite spriteWithSpriteFrameName:@"p5_ds.png"];
        bk9.position = ds9;
        bk9.tag =9;
        bk9.visible = NO;
        [self addChild:bk9 z:3];
        
        CCSprite *bk10 = [CCSprite spriteWithSpriteFrameName:@"p5_ds.png"];
        bk10.position = ds10;
        bk10.tag =10;
        bk10.visible = NO;
        [self addChild:bk10 z:3];
        
        CCSprite *bk11 = [CCSprite spriteWithSpriteFrameName:@"p5_ds.png"];
        bk11.position = ds11;
        bk11.tag =11;
        bk11.visible = NO;
        [self addChild:bk11 z:3];
        
        CCSprite *bk12 = [CCSprite spriteWithSpriteFrameName:@"p5_ds.png"];
        bk12.position = ds12;
        bk12.tag =12;
        bk12.visible = NO;
        [self addChild:bk12 z:3];
        
        CCSprite *bk13 = [CCSprite spriteWithSpriteFrameName:@"p5_ds.png"];
        bk13.position = ds13;
        bk13.tag =13;
        bk13.visible = NO;
        [self addChild:bk13 z:3];
        
        CCSprite *bk14 = [CCSprite spriteWithSpriteFrameName:@"p5_ds.png"];
        bk14.position = ds14;
        bk14.tag =14;
        bk14.visible = NO;
        [self addChild:bk14 z:3];
        
        CCSprite *bk15 = [CCSprite spriteWithSpriteFrameName:@"p5_ds.png"];
        bk15.position = ds15;
        bk15.tag =15;
        bk15.visible = NO;
        [self addChild:bk15 z:3];
        
        CCSprite *bk16 = [CCSprite spriteWithSpriteFrameName:@"p5_ds.png"];
        bk16.position = ds16;
        bk16.tag =16;
        bk16.visible = NO;
        [self addChild:bk16 z:3];
        
        CCSprite *bk6 = [CCSprite spriteWithSpriteFrameName:@"p5_hd1.png"];
        bk6.position = ccp(170, 652);
        bk6.tag = 6;
        bk6.rotation = -40;
        [self addChild:bk6 z:4];
        NSMutableArray *animFrames_b1 = [NSMutableArray array];
        for(int i = 1; i < 3; i++) {
            // Obtain frames by alias name
            CCSpriteFrame *frame1 = [cache spriteFrameByName:[NSString stringWithFormat:@"p5_hd%d.png",i]];
            [animFrames_b1 addObject:frame1];
        }
        
        CCAnimation *animation_b1 = [CCAnimation animationWithFrames:animFrames_b1];
        [bk6 runAction:[CCRepeatForever actionWithAction:
                        [CCAnimate actionWithDuration:0.3f animation:animation_b1 restoreOriginalFrame:NO]]];
        CCSprite *bk7 = [CCSprite spriteWithSpriteFrameName:@"p5_qt1.png"];
        bk7.position = ccp(340, 500);
        bk7.tag = 7;
        [self addChild:bk7 z:4];
        NSMutableArray *animFrames_b = [NSMutableArray array];
        for(int i = 1; i < 3; i++) {
            // Obtain frames by alias name
            CCSpriteFrame *frame = [cache spriteFrameByName:[NSString stringWithFormat:@"p5_qt%d.png",i]];
            [animFrames_b addObject:frame];
        }
        
        CCAnimation *animation_b = [CCAnimation animationWithFrames:animFrames_b];
        [bk7 runAction:[CCRepeatForever actionWithAction:
                        [CCAnimate actionWithDuration:0.1f animation:animation_b restoreOriginalFrame:NO]]];
        CCSprite *bk8 = [CCSprite spriteWithSpriteFrameName:@"p8_xj_2.png"];
        bk8.position = ccp(512, 112);
        bk8.tag = 8;
        [self addChild:bk8 z:1];
        [self schedule:@selector(update:) ];
        [self schedule:@selector(update1:)];
        
        CCSprite *transition_ = [CCSprite spriteWithSpriteFrameName:@"10001.png"];
        transition_.position = ccp(980, 48);
        [self addChild:transition_ z:5 tag:300];
        [self transitionNumberAnimation:@"forever"];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"5" fontName:@"KaiTi_GB2312" fontSize:28];
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
        NSString *tmp1 = [NSString stringWithFormat:@"When the wheat was tall and ripe, she asked, \"Who will help me harvest this wheat?\" "];
        text = [Text initWithString:tmp1 isChinese:NO wordNumberOfLine:39 wordPosition:ccp(604, 640)];
        [self playSoundEffect:@"ying_5.wav" playOrStop:YES];
    }
    else {
        NSString *tmp1 = [NSString stringWithFormat:@"当麦子长得又高又壮，已经成熟得时候，小红母鸡又问：“谁来帮我收割这些麦子呀？”"];
        text = [Text initWithString:tmp1 isChinese:YES wordNumberOfLine:18 wordPosition:ccp(604, 640)];
        [self playSoundEffect:@"zhong_5.wav" playOrStop:YES];
    }
    text.text_delegate = self;
    [self addChild:text z:1 tag:101];
}
-(void)update:(ccTime)dt{
    CCSprite *sprite =(CCSprite *)[self getChildByTag:6];
    CGRect rect1 = [[arry objectAtIndex:0] CGRectValue];
    CGRect rect2 = [[arry objectAtIndex:1] CGRectValue];
    CGRect rect3 = [[arry objectAtIndex:2] CGRectValue];
    CGRect rect4 = [[arry objectAtIndex:3] CGRectValue];
    int x = arc4random()%150;
    int y = arc4random()%100;
    id act = [CCMoveBy actionWithDuration:0.6f position:ccp(-x, y)];
    id act1 = [CCMoveBy actionWithDuration:0.6f position:ccp(x, y)];
    id act2 = [CCMoveBy actionWithDuration:0.6f position:ccp(-x, -y)];
    id act3 = [CCMoveBy actionWithDuration:0.6f position:ccp(x, -y)];

    if (CGRectContainsPoint(rect1, sprite.position)) {
        sprite.position = ccp(sprite.position.x+2, sprite.position.y+2);
            [sprite runAction:[CCRepeatForever actionWithAction:act]];
    }
    if (CGRectContainsPoint(rect2, sprite.position)) {
        sprite.position = ccp(sprite.position.x+2, sprite.position.y+2);
        if (a==1) {
            sprite.scaleX = 1;
            a=0;
        }
            [sprite runAction:[CCRepeatForever actionWithAction:act1]];
    }
    if (CGRectContainsPoint(rect3, sprite.position)) {
        sprite.position = ccp(sprite.position.x-2, sprite.position.y-2);
        if (a== 0) {
            sprite.scaleX = -1;
            a=1;
        }
        [sprite runAction:[CCRepeatForever actionWithAction:act2]];

    }
    if (CGRectContainsPoint(rect4, sprite.position)) {
        sprite.position = ccp(sprite.position.x-2, sprite.position.y-2);
        [sprite runAction:[CCRepeatForever actionWithAction:act3]];

    }
}
-(void)update1:(ccTime)dt1{
        CCSprite *sprite =(CCSprite *)[self getChildByTag:7];
        CGRect rect1 = [[arry objectAtIndex:0] CGRectValue];
        CGRect rect2 = [[arry objectAtIndex:1] CGRectValue];
        CGRect rect3 = [[arry objectAtIndex:2] CGRectValue];
        CGRect rect4 = [[arry objectAtIndex:3] CGRectValue];
        int x = arc4random()%150;
        int y = arc4random()%100;
        if (CGRectContainsPoint(rect1, sprite.position)) {
            sprite.position = ccp(sprite.position.x+2, sprite.position.y+2);
            id act = [CCMoveBy actionWithDuration:0.6f position:ccp(-x, y)];
            if (b==1) {
                sprite.scaleX = 1;
                sprite.scaleY = -1;
                b=0;
            }
            [sprite runAction:[CCRepeatForever actionWithAction:act]];
        }
        if (CGRectContainsPoint(rect2, sprite.position)) {
            sprite.position = ccp(sprite.position.x+2, sprite.position.y+2);
            id act = [CCMoveBy actionWithDuration:0.6f position:ccp(x, y)];
            [sprite runAction:[CCRepeatForever actionWithAction:act]];
        }
        if (CGRectContainsPoint(rect3, sprite.position)) {
            sprite.position = ccp(sprite.position.x-2, sprite.position.y-2);
            if (b== 0) {
                sprite.scaleX = -1;
                sprite.scaleY = 1;
                b=1;
            }
            id act = [CCMoveBy actionWithDuration:0.6f position:ccp(-x, -y)];
            [sprite runAction:[CCRepeatForever actionWithAction:act]];
        }
        if (CGRectContainsPoint(rect4, sprite.position)) {
        sprite.position = ccp(sprite.position.x-2, sprite.position.y-2);
        id act = [CCMoveBy actionWithDuration:0.6f position:ccp(x, -y)];
        [sprite runAction:[CCRepeatForever actionWithAction:act]];
    }
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
    CCSprite *sprite2 = (CCSprite *)[self getChildByTag:2];
    CCSprite *sprite3 = (CCSprite *)[self getChildByTag:3];
    CCSprite *sprite4 = (CCSprite *)[self getChildByTag:4];
    CCSprite *sprite6 = (CCSprite *)[self getChildByTag:6];
    CCSprite *sprite7 = (CCSprite *)[self getChildByTag:7];
    CCSprite *sprite9 = (CCSprite *)[self getChildByTag:9];
    CCSprite *sprite10 = (CCSprite *)[self getChildByTag:10];
    CCSprite *sprite11 = (CCSprite *)[self getChildByTag:11];
    CCSprite *sprite12 = (CCSprite *)[self getChildByTag:12];
    CCSprite *sprite13 = (CCSprite *)[self getChildByTag:13];
    CCSprite *sprite14 = (CCSprite *)[self getChildByTag:14];
    CCSprite *sprite15 = (CCSprite *)[self getChildByTag:15];
    CCSprite *sprite16 = (CCSprite *)[self getChildByTag:16];
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    
    if (CGRectContainsPoint(sprite6.boundingBox, touchLocation)) {
    sprite6.position = ccpAdd(sprite6.position, translation);
        id act = [CCMoveBy actionWithDuration:0.3f position:ccp(100, 80)];
        [sprite6 runAction:[CCRepeatForever actionWithAction:act]];
    }
    if (CGRectContainsPoint(sprite7.boundingBox, touchLocation)) {
    sprite7.position = ccpAdd(sprite7.position, translation);
        id act = [CCMoveBy actionWithDuration:0.3f position:ccp(100, 80)];
        [sprite7 runAction:[CCRepeatForever actionWithAction:act ]];
    }
    if (CGRectContainsPoint(sprite3.boundingBox, touchLocation)&&CGRectContainsPoint(sprite4.boundingBox, touchLocation)) {
        if (c==0) {
            if (bol1 == YES) {
                id act = [CCRotateTo actionWithDuration:0.3f angle:10];
                id act1 = [CCRotateTo actionWithDuration:0.3f angle:0];
                id seq = [CCSequence actions:act,act1, nil];
                sprite9.visible = YES;
                [sprite2 runAction:seq ];
                
            }
            bol1 = NO;
            }
        if (c==1) {
            if (bol2 == YES) {
                id act = [CCRotateTo actionWithDuration:0.3f angle:10];
                id act1 = [CCRotateTo actionWithDuration:0.3f angle:0];
                id seq = [CCSequence actions:act,act1, nil];
                sprite10.visible = YES;
                [sprite2 runAction:seq ];
            }
            bol2 = NO;
            }
        if (c==2) {
            if (bol3 == YES) {
                id act = [CCRotateTo actionWithDuration:0.3f angle:10];
                id act1 = [CCRotateTo actionWithDuration:0.3f angle:0];
                id seq = [CCSequence actions:act,act1, nil];
                sprite11.visible = YES;
                [sprite2 runAction:seq ];
            }
            bol3 = NO;
        }
        if (c==3) {
            if (bol4 == YES) {
                id act = [CCRotateTo actionWithDuration:0.3f angle:10];
                id act1 = [CCRotateTo actionWithDuration:0.3f angle:0];
                id seq = [CCSequence actions:act,act1, nil];
                sprite12.visible = YES;
                [sprite2 runAction:seq ];
            }
            bol4 = NO;
            }
        if (c==4) {
            if (bol5 == YES ) {
                id act = [CCRotateTo actionWithDuration:0.3f angle:10];
                id act1 = [CCRotateTo actionWithDuration:0.3f angle:0];
                id seq = [CCSequence actions:act,act1, nil];
                sprite13.visible = YES;
                [sprite2 runAction:seq ];
            }
            bol5=NO;
        }
        if (c==5) {
            if (bol6 == YES ){
                id act = [CCRotateTo actionWithDuration:0.3f angle:10];
                id act1 = [CCRotateTo actionWithDuration:0.3f angle:0];
                id seq = [CCSequence actions:act,act1, nil];
                sprite14.visible = YES;
                [sprite2 runAction:seq ];
            }
            bol6 = NO;
        }
        if (c==6) {
            if (bol7 == YES) {
                id act = [CCRotateTo actionWithDuration:0.3f angle:10];
                id act1 = [CCRotateTo actionWithDuration:0.3f angle:0];
                id seq = [CCSequence actions:act,act1, nil];
                sprite15.visible = YES;
                [sprite2 runAction:seq ];
            }
            bol7 = NO;
        }
        if (c==7) {
            if (bol8 == YES) {
                id act = [CCRotateTo actionWithDuration:0.3f angle:10];
                id act1 = [CCRotateTo actionWithDuration:0.3f angle:0];
                id seq = [CCSequence actions:act,act1, nil];
                sprite16.visible = YES;
                [sprite2 runAction:seq ];
            }
            bol8 = NO;
        } 
        if (c==8) {
            if (bol9 == YES) {
                id act10 = [CCHide action];
                [sprite9 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.1f],act10, nil]];
                [sprite10 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.3f],[CCMoveTo actionWithDuration:0.3f position:ccp(415, 220)],act10, [CCMoveTo actionWithDuration:0.f position:ccp(415, 270)],nil]];
                [sprite11 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5f],[CCMoveTo actionWithDuration:0.3f position:ccp(415, 270)],act10,[CCMoveTo actionWithDuration:0.f position:ccp(415, 320)], nil]];
                [sprite12 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.7f],[CCMoveTo actionWithDuration:0.3f position:ccp(415, 320)],act10,[CCMoveTo actionWithDuration:0.f position:ccp(415, 370)],nil]];
                [sprite13 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.9f],[CCMoveTo actionWithDuration:0.3f position:ccp(415, 370)],act10,[CCMoveTo actionWithDuration:0.f position:ccp(415, 420)], nil]];
                [sprite14 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:1.1f],[CCMoveTo actionWithDuration:0.3f position:ccp(415, 420)],act10,[CCMoveTo actionWithDuration:0.f position:ccp(415, 470)],nil]];
                [sprite15 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:1.3f],[CCMoveTo actionWithDuration:0.3f position:ccp(415, 470)],act10,[CCMoveTo actionWithDuration:0.f position:ccp(415, 520)], nil]];
                [sprite16 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:1.5f],[CCMoveTo actionWithDuration:0.3f position:ccp(415, 520)],act10,[CCMoveTo actionWithDuration:0.f position:ccp(415, 570)],nil]];
            }
            bol1 = YES;
            bol2 = YES;
            bol3 = YES;
            bol4 = YES;
            bol5 = YES;
            bol6 = YES;
            bol7 = YES;
            bol8 = YES;
            bol9 = YES;
                   }
    }
    else if (abs(translation.x)>25&& CGRectContainsPoint(slide_rect, touchLocation)) {
        [self cleanup];
            [self playSoundEffect:@"zhong_5.wav" playOrStop:NO];
            [self playSoundEffect:@"ying_5.wav" playOrStop:NO];
        if (translation.x < 0) {
            [SceneManager pagingOfIndex:5 back:TransitionFadeBL];
        }
        else {
            [SceneManager pagingOfIndex:5 back:TransitionFadeTR];
        }
    }
}
- (void)delegateTextAdd{
    [self textAdd];
}
-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint location = [touch locationInView:[touch view]];
    CCSprite *sprite300 = (CCSprite *)[self getChildByTag:300];
    
    location = [[CCDirector sharedDirector] convertToGL:location];  
    CCLOG(@"{%f,%f},",location.x,location.y );
    CCSprite *sprite3 = (CCSprite *)[self getChildByTag:3];
    CCSprite *sprite4 = (CCSprite *)[self getChildByTag:4];
    if (CGRectContainsPoint(sprite3.boundingBox, location)&&CGRectContainsPoint(sprite4.boundingBox, location)) {
        c++;
        if (c==9) {
            c=0;
        }
       CCLOG(@"%d",c);
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
    [arry release];
	[super dealloc];
}
@end
