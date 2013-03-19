//
//  Text.m
//  大山叔叔
//
//  Created by Hua Chen on 11-12-22.
//  Copyright 2011年 - -. All rights reserved.
//

#import "Text.h"
#import "SceneManager.h"
static NSString *TextName_;
static BOOL ischinese_;
static int NumOfLine_;
static CGPoint postion_;


@implementation Text
@synthesize text_delegate;
+(id)initWithString:(NSString *)stringname isChinese:(BOOL )ischinese wordNumberOfLine:(int )num wordPosition:(CGPoint )pos{
    TextName_ = stringname;
    ischinese_ = ischinese;
    NumOfLine_ = num;
    postion_ = pos;
    
    
    return [[self alloc] init];
}

-(id) init
{
	if( (self=[super init])) {
//        CGSize size = [[CCDirector sharedDirector] winSize];
//        [self setContentSize:CGSizeMake(500, 768)];
//        self = [CCSprite spriteWithFile:@"Default.png"];     
        TextName = TextName_;
        isChinese = ischinese_;
        NumOfLine = NumOfLine_;
        postion = postion_;
        touchAllow = YES;
        
        wordArray = [[NSMutableArray alloc] init];
//        [self setContentSize:[self loadText:TextName isChinese:isChinese wordNumberOfLine:NumOfLine firstWordPosition:postion]];
        CGSize selfSize = [self loadText:TextName isChinese:isChinese wordNumberOfLine:NumOfLine wordPosition:postion];
        rectSize = selfSize;
        [self setTextureRect:CGRectMake(0, 0, selfSize.width, selfSize.height)];
//        [self loadText:TextName isChinese:isChinese wordNumberOfLine:NumOfLine firstWordPosition:postion];
        [self setOpacity:0];
    }
    return self;
}

-(CGSize)loadText:(NSString *)text isChinese:(BOOL )ischinese wordNumberOfLine:(int )num wordPosition:(CGPoint )pos{ 
    NSString *fontName_ = [NSString string];
    CCLOG(@"%@",text);
    textLength = [text length];
    int fontSize_;//字号
    int wordSpace;//字间距
    int lineSpace;//行间距
    int indent;//缩进
    if (ischinese) {
        fontName_ = @"KaiTi_GB2312";
        fontSize_ = 28;
        wordSpace = 30;
        lineSpace = 35;
        indent = 2;
    }
    else {
        fontName_ = @"ComicSansMS";  
        fontSize_ = 25;
        wordSpace = 12;
        lineSpace = 35;
        indent = 0;
    }
    self.position = pos;
    pos = ccp(0, ([text length]/num+1)*lineSpace*0.8 );

    if (ischinese) {
        for (int index = 0; index <[text length]; index++) {
            CCLabelTTF *label = [CCLabelTTF labelWithString:[text substringWithRange:NSMakeRange(index, 1)] fontName:fontName_ fontSize:fontSize_];
            label.color = ccc3(30, 45, 79);
            int abcd = 80;
            int x = arc4random()%abcd;
            int y = arc4random()%abcd;
            
            label.position = ccp(wordSpace /2 + pos.x + (index+indent)%num * wordSpace -x +abcd/2, pos.y - lineSpace*((index+indent) / num)-y+ abcd/2);
            label.visible = NO;
            label.tag = index;
            [self addChild:label];
            id move = [CCMoveTo actionWithDuration:.5f position:ccp(wordSpace /2 +pos.x + (index+indent)%num * wordSpace , pos.y - lineSpace*((index+indent) / num))];
            id spa = [CCSpawn actions:[CCFadeIn actionWithDuration:.5f],move, nil];
            id seq = [CCSequence actions:[CCDelayTime actionWithDuration:.2f*index],[CCShow action],spa, nil];
            [label runAction:seq];
            [wordArray addObject:label];
        }
    }
    else{
        int nextWordPos = 0;
        int nextWordPos_1 = 0;
        int nextWordPos_2 = 0;
        int nextWordPos_3 = 0;
        int nextWordPos_4 = 0;
        int nextWordPos_5 = 0;
        int number = 0;
        
        int wordFirst = 0;
        for (int index = 0; index <[text length]; index++) {
            
             if ([[text substringWithRange:NSMakeRange(index, 1)] isEqualToString:@" "]) {
                number++;
                CCLabelTTF *label = [CCLabelTTF labelWithString:[text substringWithRange:NSMakeRange(wordFirst, index  - wordFirst)] fontName:fontName_ fontSize:fontSize_];
                
                label.color = ccc3(30, 45, 79);
                int abcd = 80;
                int x = arc4random()%abcd;
                int y = arc4random()%abcd;

                
                if (index/num == 0) {
                    nextWordPos = nextWordPos_1;
                }
                else if (index/num == 1){
                    nextWordPos = nextWordPos_2;
                }
                else if (index/num == 2){
                    nextWordPos = nextWordPos_3;
                }
                else if (index/num == 3){
                    nextWordPos = nextWordPos_4;
                }              
                else if (index/num == 4){
                    nextWordPos = nextWordPos_5;
                }

                

                label.position = ccp(nextWordPos + label.contentSize.width/2+ abcd/2 -x, pos.y - lineSpace*((index+indent) / num)+ abcd/2 -y);
                label.visible = NO;
                label.tag = index;
                [self addChild:label];

                id move = [CCMoveTo actionWithDuration:.5f position:ccp(nextWordPos + label.contentSize.width/2 , pos.y - lineSpace*((index+indent) / num))];
                if (index/num == 0) {
                    nextWordPos_1 += label.contentSize.width + wordSpace;
                }
                else if (index/num == 1){
                    nextWordPos_2 += label.contentSize.width + wordSpace;
                }
                else if (index/num == 2){
                    nextWordPos_3 += label.contentSize.width + wordSpace;
                }
                else if (index/num == 3){
                    nextWordPos_4 += label.contentSize.width + wordSpace;
                }
                else if (index/num == 4){
                    nextWordPos_5 += label.contentSize.width + wordSpace;
                }

                
                id spa = [CCSpawn actions:[CCFadeIn actionWithDuration:.5f],move, nil];
                id seq = [CCSequence actions:[CCDelayTime actionWithDuration:.2f*number],[CCShow action],spa, nil];
                [label runAction:seq];
                wordFirst = index +1;
                [wordArray addObject:label];
            }
        }
    }
    
    return CGSizeMake(num *wordSpace,([text length]/num+1)*lineSpace );
    
}

//- (CGRect)rect
//{
//    CCLOG(@"wwwwwwwww %f,%f,%f,%f",-rect_.size.width / 2, -rect_.size.height / 2, rect_.size.width, rect_.size.height);
//    return CGRectMake(-rect_.size.width / 2, -rect_.size.height / 2, rect_.size.width, rect_.size.height);
//    
//    //    return CGRectMake(0, 0, 1024, 768);
//    
//}


- (void)onEnter
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	[super onEnter];
}

- (void)onExit
{
	[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
	[super onExit];
}	


//0, 0, selfSize.width, selfSize.height
- (BOOL)containsTouchLocation:(UITouch *)touch
{
	return CGRectContainsPoint(CGRectMake(-rectSize.width/2, -rectSize.height/2, rectSize.width, rectSize.height), [self convertTouchToNodeSpaceAR:touch]);
//    for (CCSprite *spt in wordArray) {
//        return CGRectContainsPoint(spt.boundingBox, [self convertTouchToNodeSpaceAR:touch]);
//
//    }
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if ( ![self containsTouchLocation:touch] ) return NO;
    else if (!touchAllow) return NO;
    return YES;
}
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{   
}
- (void)removeTTF:(CCLabelTTF *)labelTTF{
    if (labelTTF) {
        [self removeFromParentAndCleanup:YES];
        CCLOG(@"释放 Label");
        [self.text_delegate delegateTextAdd];

    }
}
//- (void)textAdd{
////    [self.text_delegate delegateTextAdd];
//}
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{         
    touchAllow = NO;
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CCLOG(@"text  x:%f    y:%f   ",touchLocation.x,touchLocation.y );
    for (int i = 0; i < textLength; i++) {
        float posX,posY;
        posX = arc4random()%80;
        posY = arc4random()%80;
        CCLabelTTF *label = (CCLabelTTF *)[self getChildByTag:i];
        [label runAction:[CCSequence actions:[CCSpawn actions:[CCMoveBy actionWithDuration:1.f position:ccp(label.position.x + (posX - 40), label.position.y + (posY - 40))], [CCFadeOut actionWithDuration:1.f], nil], [CCCallFuncN actionWithTarget:self selector:@selector(removeTTF:)], nil]];
    }
    [[NSUserDefaults standardUserDefaults] setBool:![SceneManager CheckLanguage] forKey:@"language"];
//    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(textAdd) object:self];
//    [self performSelector:@selector(textAdd) withObject:self afterDelay:1.1f];
}
- (void)dealloc{
    CCLOG(@"释放");
    [super dealloc];
}
@end
