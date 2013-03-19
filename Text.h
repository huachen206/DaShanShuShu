//
//  Text.h
//  大山叔叔
//
//  Created by Hua Chen on 11-12-22.
//  Copyright 2011年 - -. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@protocol text_touchedDelegate;

@interface Text : CCSprite <CCTargetedTouchDelegate>{
    id<text_touchedDelegate> delegate;

    NSString *TextName;
    BOOL isChinese;
    int NumOfLine;
    CGPoint postion;
    NSMutableArray *wordArray;
    int textLength;
    BOOL touchAllow;
    CGSize rectSize;
}

@property (nonatomic, assign) id<text_touchedDelegate> text_delegate;
+(id)initWithString:(NSString *)stringname isChinese:(BOOL )ischinese wordNumberOfLine:(int )num wordPosition:(CGPoint )pos;
-(CGSize )loadText:(NSString *)text isChinese:(BOOL )ischinese wordNumberOfLine:(int )num wordPosition:(CGPoint )pos;

@end
@protocol text_touchedDelegate
- (void)delegateTextAdd;
//- (void)touchedEndWithPosEnd:(CGPoint)posEnd;
//- (void)SelectColor:(int)index Red:(float)red Green:(float)green Blue:(float)bule;
@end