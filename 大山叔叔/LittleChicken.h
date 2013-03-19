//
//  LittleChicken.h
//  大山_Demo
//
//  Created by Hua Chen on 11-12-10.
//  Copyright 2011年 - -. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Scene_Page_1.h"

@protocol touchedDelegate;
@interface LittleChicken : CCSprite<CCTargetedTouchDelegate>{
    id<touchedDelegate> delegate;
    
    BOOL walk;
    NSMutableArray *load;
    int index_;
}
@property (nonatomic, assign) id<touchedDelegate> delegate;
@property (nonatomic,assign) BOOL walk;
+(id)initWithFile:(NSString *)filename;

-(void)littleChickenWalkWithOldPosition:(CGPoint )oldPosition type:(int)type;
@end
@protocol touchedDelegate
- (void)touchedEndWithPosEnd:(CGPoint)posEnd;
@end