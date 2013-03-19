//
//  overScene.m
//  大山叔叔
//
//  Created by edwardair on 12-1-12.
//  Copyright 2012年 - -. All rights reserved.
//

#import "overScene.h"
#import "SceneManager.h"

@implementation overScene
-(void) accelerometer:(UIAccelerometer *)accelerometer

        didAccelerate:(UIAcceleration *)acceleration

{
    
    // 减速度系数(值越小＝转向越快)
    
    float deceleration = 0.4f;
    
    // 加速度系数 (值越大 = 越敏感)
    
    float sensitivity = 6.0f;
    
    // 最大速度
    
    float maxVelocity = 100;
    
    // 根据加速度计算当前速度
    
    playerVelocity.x = playerVelocity.x * deceleration + acceleration.x * sensitivity;
    playerVelocity.y = playerVelocity.y * deceleration + acceleration.y * sensitivity;
    
    // 限制最大速度为 ±maxVelocity之间
    
    if (playerVelocity.x > maxVelocity) {
        
        playerVelocity.x = maxVelocity;
        
    } else if (playerVelocity.x < - maxVelocity) {
        
        playerVelocity.x = - maxVelocity;
        
    }
    if (playerVelocity.y > maxVelocity) {
        
        playerVelocity.y = maxVelocity;
        
    } else if (playerVelocity.y < - maxVelocity) {
        
        playerVelocity.y = - maxVelocity;
        
    }
    
} 
-(void) update{
    int x = [text numberOfRunningActions];
    CCLOG(@"%d",x);
    
    // 不断改变角色x坐标
    
    CGPoint pos = text.position;
    
    pos.y += playerVelocity.x;
//    pos.x += playerVelocity.y;

//    // 防止角色移到屏幕以外
//    
//    CGSize screenSize = [[CCDirector sharedDirector] winSize];
//    
//    float imageWidthHalved = [text texture].contentSize.width * 0.5f; float leftBorderLimit = imageWidthHalved;
//    
//    float rightBorderLimit = screenSize.width - imageWidthHalved;
//    
//    float imageHeightHalved = [text texture].contentSize.height * .5f; float downBorderLimit = imageHeightHalved;
//    
//    float upBorderLimit = screenSize.height - imageHeightHalved;
//    
//    if (pos.x < leftBorderLimit) {
//        
//        pos.x = leftBorderLimit;
//        
//        playerVelocity.x = 0;
//        
//    } else if(pos.x > rightBorderLimit) {
//        
//        pos.x = rightBorderLimit;
//        
//        playerVelocity.x = 0;
//        
//    }
    float downBorderLimit = 320;
    float upBorderLimit = 388;
    if (pos.y < downBorderLimit) {
        pos.y = downBorderLimit;
        playerVelocity.y = 0;
    }
    else if(pos.y > upBorderLimit){
        pos.y = upBorderLimit;
        playerVelocity.y = 0;
    }
    
    text.position = pos;
//    CCLOG(@"text:::::::%f,%f",text.position.x,text.position.y);
} 

- (id)init{
    if (self == [super init]) {
        CGSize conterSize =[CCDirector sharedDirector].winSize;
        CGPoint centerPos = ccp(conterSize.width/2, conterSize.height/2);
        
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache removeUnusedSpriteFrames];
        [cache addSpriteFramesWithFile:@"overSp.plist"];
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];
        
        CCSprite *bkDown = [CCSprite spriteWithSpriteFrameName:@"bkDown.png"];
        CCSprite *bkUp = [CCSprite spriteWithSpriteFrameName:@"bkUp.png"];
        bkDown.position = centerPos;
        bkUp.position = centerPos;
        [self addChild:bkDown z:0];
        [self addChild:bkUp z:3];
        
        text = [CCSprite spriteWithSpriteFrameName:@"页纸.png"];
        text.position = centerPos;
        [self addChild:text z:1 tag:0];
        
        NSArray *animalsArray = [NSArray arrayWithObjects:@"公鹅.png",@"母鸡.png",@"小鸡.png",@"鸭子.png",nil];
        NSArray *animalsPos = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:ccp(886, 176)],
                                                        [NSValue valueWithCGPoint:ccp(162, 606)],
                                                        [NSValue valueWithCGPoint:ccp(876, 602)],
                                                        [NSValue valueWithCGPoint:ccp(120, 164)],nil];
        for (int i = 0; i < [animalsArray count]; i++) {
            CCSprite *animal = [CCSprite spriteWithSpriteFrameName:[animalsArray objectAtIndex:i]];
            animal.position = [[animalsPos objectAtIndex:i] CGPointValue];
            [self addChild:animal z:3 tag:i+1];
        }
        self.isAccelerometerEnabled = YES;
        [self schedule:@selector(update)];
        
    }
    return self;
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
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundBk];
        if (translation.x < 0) {
            [SceneManager call_more:TransitionFadeBL];
            
        }
        else {
            [SceneManager call_Page_14:TransitionFadeTR];
            
        }
    }
    
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [touch locationInView:[touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation]; 
    for (int i = 1; i < 5; i++) {
        CCSprite *animal = (CCSprite *)[self getChildByTag:i];
        if (CGRectContainsPoint(animal.boundingBox, touchLocation)) {
            [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)soundBk];
            NSString *soundName;
            switch (i) {
                case 1:
                    soundName = @"overE.mp3";
                    break;
                case 2:
                    soundName = @"overHen.wav";
                    break;
                case 3:
                    soundName = @"overChicken.mp3";
                    break;
                case 4:
                    soundName = @"yz.mp3";
                    break;
                default:
                    break;
            }
            soundBk = (NSNumber *)[[SimpleAudioEngine sharedEngine] playEffect:soundName];
        }
    }
}
- (void)dealloc{
    [super dealloc];
}
@end
