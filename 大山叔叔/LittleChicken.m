//
//  LittleChicken.m
//  大山_Demo
//
//  Created by Hua Chen on 11-12-10.
//  Copyright 2011年 - -. All rights reserved.
//

#import "LittleChicken.h"
#define speed 200

@implementation LittleChicken
@synthesize delegate;
@synthesize walk;

+(id)initWithFile:(NSString *)filename
{           
    
	return [[[self alloc] initWithFile:filename] autorelease];
    
}


-(void)littleChickenWalk{
    if (index_<[load count]) {
        CGPoint firstPos = [[load objectAtIndex:index_] CGPointValue];
//        firstPos = CGPointMake(firstPos.x - 150, firstPos.y - 30);
        if (firstPos.x >= self.position.x  ) {
            self.scaleX = 1;
        }
        else{
            self.scaleX = -1;
        }
        float length = sqrtf((firstPos.x - self.position.x)*(firstPos.x - self.position.x)+(firstPos.y - self.position.y)*(firstPos.y - self.position.y));
        float duration = length/speed;

        [self runAction:[CCSequence actions:[CCMoveTo actionWithDuration:duration position:firstPos],[CCCallFuncN actionWithTarget:self selector:@selector(littleChickenWalk)], nil]];
        index_++;
    }
    else {
        walk = NO;
        [load removeAllObjects];
        index_ = 0;
    }
}  
    
-(void)littleChickenWalkWithOldPosition:(CGPoint )oldPosition type:(int)type{
    switch (type) {
        case 1:
            [load addObject:[NSValue valueWithCGPoint:CGPointMake(oldPosition.x - 150, oldPosition.y - 30)]];
            break;
        case 2:
            [load addObject:[NSValue valueWithCGPoint:CGPointMake(oldPosition.x - 240, oldPosition.y - 30)]];
            break;

        default:
            break;
    }       
        if ([load count] == 2) {
            index_ = 0;
            [self littleChickenWalk];
        }
        
    CCLOG(@"walk");

}
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        walk = NO;
        load = [[NSMutableArray alloc] init];
//        self.position = ccp(500, 380);
        NSMutableArray *animFrames_Little = [NSMutableArray array];
        for(int i = 1; i <= 3; i++) {
            // Obtain frames by alias name
            CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
            [cache addSpriteFramesWithFile:@"littleChickenWalk.plist" textureFile:@"littleChickenWalk.pvr.ccz"];
            
            NSString *frameName = [NSString stringWithFormat:@"XJZL-%03d.png",i];
            CCLOG(@"%@",frameName);
            CCSpriteFrame *frame = [cache spriteFrameByName:frameName];
            [animFrames_Little addObject:frame];
//            if (i == 1) {
//                self = [CCSprite spriteWithSpriteFrame:frame];
//            }
    }
        CCAnimation *animation_Little = [CCAnimation animationWithFrames:animFrames_Little];
        id action_little_repeat = [CCRepeatForever actionWithAction:[CCAnimate actionWithDuration:.6f animation:animation_Little restoreOriginalFrame:NO]];
        [self runAction:action_little_repeat];  
    }

    return self;
    
}
-(void)dealloc{
    [load release];
    [super dealloc];
}
//- (void)onEnter
//{
//	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
//	[super onEnter];
//}
//
//- (void)onExit
//{
//	[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
//	[super onExit];
//}	


- (CGRect)rect
{
    return CGRectMake(-rect_.size.width / 2, -rect_.size.height / 2, rect_.size.width, rect_.size.height);
    
}

- (BOOL)containsTouchLocation:(UITouch *)touch
{
    int fanwei = 40;
    CGRect feelRect = CGRectMake(self.rect.origin.x - fanwei, self.rect.origin.y- fanwei, self.rect.size.width +2*fanwei, self.rect.size.height +2*fanwei);
	return CGRectContainsPoint(feelRect, [self convertTouchToNodeSpaceAR:touch]);
}


- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if ( ![self containsTouchLocation:touch] ) return NO;
    
    return YES;
}
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{   
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{         
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CCLOG(@"text  x:%f    y:%f   ",touchLocation.x,touchLocation.y );
}


@end
