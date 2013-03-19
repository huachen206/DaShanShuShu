//
//  youxi.m
//  youxi
//
//  Created by Liu Yang on 12-1-5.
//  Copyright 2012年 Jiangsu  Zhongka  Educational  Science and   Technology  Co.，Ltd. All rights reserved.
//

#import "youxi.h"
#import "SimpleAudioEngine.h"
#import "SceneManager.h"
@implementation youxi
- (void)array1Add{
    NSValue *val1= [NSValue valueWithCGPoint:CGPointMake(85,72)];
    NSValue *val2= [NSValue valueWithCGPoint:CGPointMake(255,72)];
    NSValue *val3= [NSValue valueWithCGPoint:CGPointMake(425,72)];
    NSValue *val4= [NSValue valueWithCGPoint:CGPointMake(595,72)];
    NSValue *val5= [NSValue valueWithCGPoint:CGPointMake(765,72)];
    NSValue *val6= [NSValue valueWithCGPoint:CGPointMake(935,72)];
    
    [arry1 addObjectsFromArray:[NSArray arrayWithObjects:val1,val2,val3,val4,val5,val6,nil]];
}
- (void)array2Add{
    NSValue *val1= [NSValue valueWithCGPoint:CGPointMake(48,100)];
    NSValue *val2= [NSValue valueWithCGPoint:CGPointMake(130.5,40)];
    NSValue *val3= [NSValue valueWithCGPoint:CGPointMake(214.5,100)];
    NSValue *val4= [NSValue valueWithCGPoint:CGPointMake(298.5,40)];
    NSValue *val5= [NSValue valueWithCGPoint:CGPointMake(382.5,100)];
    NSValue *val6= [NSValue valueWithCGPoint:CGPointMake(466.5,40)];
    NSValue *val7= [NSValue valueWithCGPoint:CGPointMake(550.5,100)];
    NSValue *val8= [NSValue valueWithCGPoint:CGPointMake(634.5,40)];
    NSValue *val9= [NSValue valueWithCGPoint:CGPointMake(718.5,100)];
    NSValue *val10= [NSValue valueWithCGPoint:CGPointMake(802.5,40)];
    NSValue *val11= [NSValue valueWithCGPoint:CGPointMake(886.5,100)];
    NSValue *val12= [NSValue valueWithCGPoint:CGPointMake(975,40)];
    
    [arry1 addObjectsFromArray:[NSArray arrayWithObjects:val1,val2,val3,val4,val5,val6,val7,val8,val9,val10,val11,val12,nil]];

}
- (void)array3Add{
    NSValue *val1= [NSValue valueWithCGPoint:CGPointMake(127,105)];
    NSValue *val2= [NSValue valueWithCGPoint:CGPointMake(197,105)];
    NSValue *val3= [NSValue valueWithCGPoint:CGPointMake(267,105)];
    NSValue *val4= [NSValue valueWithCGPoint:CGPointMake(337,105)];
    NSValue *val5= [NSValue valueWithCGPoint:CGPointMake(407,105)];
    NSValue *val6= [NSValue valueWithCGPoint:CGPointMake(477,105)];
    NSValue *val7= [NSValue valueWithCGPoint:CGPointMake(547,105)];
    NSValue *val8= [NSValue valueWithCGPoint:CGPointMake(617,105)];
    NSValue *val9= [NSValue valueWithCGPoint:CGPointMake(687,105)];
    NSValue *val10= [NSValue valueWithCGPoint:CGPointMake(757,105)];
    NSValue *val11= [NSValue valueWithCGPoint:CGPointMake(827,105)];
    NSValue *val12= [NSValue valueWithCGPoint:CGPointMake(896,105)];
    NSValue *val13= [NSValue valueWithCGPoint:CGPointMake(127,35)];
    NSValue *val14= [NSValue valueWithCGPoint:CGPointMake(197,35)];
    NSValue *val15= [NSValue valueWithCGPoint:CGPointMake(267,35)];
    NSValue *val16= [NSValue valueWithCGPoint:CGPointMake(337,35)];
    NSValue *val17= [NSValue valueWithCGPoint:CGPointMake(407,35)];
    NSValue *val18= [NSValue valueWithCGPoint:CGPointMake(477,35)];
    NSValue *val19= [NSValue valueWithCGPoint:CGPointMake(547,35)];
    NSValue *val20= [NSValue valueWithCGPoint:CGPointMake(617,35)];
    NSValue *val21= [NSValue valueWithCGPoint:CGPointMake(687,35)];
    NSValue *val22= [NSValue valueWithCGPoint:CGPointMake(757,35)];
    NSValue *val23= [NSValue valueWithCGPoint:CGPointMake(827,35)];
    NSValue *val24= [NSValue valueWithCGPoint:CGPointMake(896,35)];
    [arry1 addObjectsFromArray:[NSArray arrayWithObjects:val1,val2,val3,val4,val5,val6,val7,val8,val9,val10,val11,val12,val13,val14,val15,val16,val17,val18,val19,val20,val21,val22,val23,val24,nil]];

}
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        arry = [[NSMutableArray alloc] init];
        arry1 = [[NSMutableArray alloc] init];
        arry2 = [[NSMutableArray alloc] init];
        number1 = 0;
        bol =  YES;
        bol1 = YES;
        bol7 =  NO;
        shi = 30;
        shi1 = 60;
        shi2 = 100;
        fontName_ = @"GillSans";
        fontSize_ = 30;
        m=0;
        
        NSArray *familyNames = [UIFont familyNames];
        int j = 0;
        for (NSString *familyName in familyNames)
        {
            
            NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
            
            for (unsigned int i = 0; i < [fontNames count]; i++) {
                
                CCLOG(@"%@ %d", [fontNames objectAtIndex:i],j++);
            }
        }
        
        number2 = [SceneManager CheckGame];
        [[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
        cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache addSpriteFramesWithFile:@"beijing.plist" textureFile:@"beijing.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"kuang.plist" textureFile:@"kuang.pvr.ccz"];
        [cache addSpriteFramesWithFile:@"ziti.plist" textureFile:@"ziti.pvr.ccz"];
        CCSprite *bk = [CCSprite spriteWithSpriteFrameName:@"beijing.png"];
        bk.position = ccp(512, 384);
        [self addChild:bk];
        
        CCSprite *zhanting = [CCSprite spriteWithSpriteFrameName:@"暂停.png"];
        zhanting.position = ccp(870, 675);
        zhanting.tag = 1;
        [self addChild:zhanting z:1];
        
        CCSprite *jixu = [CCSprite spriteWithSpriteFrameName:@"jixu.png"];
        jixu.position = ccp(870, 675);
        jixu.tag = 200;
        jixu.visible = NO;
        [self addChild:jixu z:1];
        
        CCSprite *fanhui = [CCSprite spriteWithSpriteFrameName:@"fanhui.png"];
        fanhui.position = ccp(122, 676);
        fanhui.tag = 2;
        [self addChild:fanhui z:1];
        
        CCSprite *yi = [CCSprite spriteWithSpriteFrameName:@"1.png"];
        yi.position = ccp(928, 367);
        yi.tag = 3;
        [self addChild:yi z:1];
        
        CCSprite *er = [CCSprite spriteWithSpriteFrameName:@"2.png"];
        er.position = ccp(928, 295);
        er.tag = 4;
        [self addChild:er z:1];
        
        CCSprite *san = [CCSprite spriteWithSpriteFrameName:@"3.png"];
        san.position = ccp(928, 230);
        san.tag = 5;
        [self addChild:san z:1];
        
        CCSprite *kuang = [CCSprite spriteWithSpriteFrameName:@"kuang.png"];
        kuang.position = ccp(515, 395);
        kuang.tag = 6;
        [self addChild:kuang z:5];
        
        CCSprite *caikoa = [CCSprite spriteWithFile:@"caikao.pvr.ccz"];
        caikoa.position = ccp(515, 395);
        [self addChild:caikoa z:2];
                
        CCLabelTTF * baifen = [CCLabelTTF labelWithString:@"0%"  fontName:fontName_ fontSize:fontSize_];
        baifen.position = ccp(92, 290);
        baifen.tag = 8;
        [self addChild:baifen z:3];
        
        CCMenuItemImage *m1 = [CCMenuItemImage itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"kaishi_1.png"]
                                                     selectedSprite:[CCSprite spriteWithSpriteFrameName:@"kaishi_2.png"]
                                                             target:self 
                                                           selector:@selector(call_w1:)];
        m1.position = ccp(930, 525);
        CCMenu *image_menu = [CCMenu menuWithItems:m1,nil];
        image_menu.position= ccp(0, 0);
        image_menu.tag = 100;
        [self addChild:image_menu z:5 ];
        
        if (number2 == 0) {
            
            
            [cache addSpriteFramesWithFile:@"2*3.plist" textureFile:@"2*3.pvr.ccz"];
            
            CCLabelTTF *shijian = [CCLabelTTF labelWithString: @"0:30" fontName:fontName_ fontSize:fontSize_];
            shijian.position = ccp(92, 505);
            shijian.tag = 7;
            [self addChild:shijian z:3];
           
            
            CCSprite *tu1 = [CCSprite spriteWithSpriteFrameName:@"1_1.png"];
            tu1.position = ccp(310, 498);
            tu1.tag = 10;
            [self addChild:tu1 z:3];
            
            CCSprite *tu2 = [CCSprite spriteWithSpriteFrameName:@"1_2.png"];
            tu2.position = ccp(513, 498);
            tu2.tag = 11;
            [self addChild:tu2 z:3];
            
            CCSprite *tu3 = [CCSprite spriteWithSpriteFrameName:@"1_3.png"];
            tu3.position = ccp(716, 498);
            tu3.tag = 12;
            [self addChild:tu3 z:3];
            
            CCSprite *tu4 = [CCSprite spriteWithSpriteFrameName:@"1_4.png"];
            tu4.position = ccp(310, 295);
            tu4.tag = 13;
            [self addChild:tu4 z:3];
            
            CCSprite *tu5 = [CCSprite spriteWithSpriteFrameName:@"1_5.png"];
            tu5.position = ccp(513, 295);
            tu5.tag = 14;
            [self addChild:tu5 z:3];
            
            CCSprite *tu6 = [CCSprite spriteWithSpriteFrameName:@"1_6.png"];
            tu6.position = ccp(716, 295);
            tu6.tag = 15;
            [self addChild:tu6 z:3];
            

            
            [arry addObjectsFromArray:[NSArray arrayWithObjects:tu1,tu2,tu3,tu4,tu5,tu6,nil]];
            [self array1Add];
        }
        else if(number2 == 1){
            [cache addSpriteFramesWithFile:@"3*4.plist" textureFile:@"3*4.pvr.ccz"];
            
            CCLabelTTF *shijian = [CCLabelTTF labelWithString: @"0:60" fontName:fontName_ fontSize:fontSize_];
            shijian.position = ccp(92, 505);
            shijian.tag = 7;
            [self addChild:shijian z:3];
            
            CCSprite *tu1 = [CCSprite spriteWithSpriteFrameName:@"2_1.png"];
            tu1.position = ccp(286, 530);
            tu1.tag = 10;
            [self addChild:tu1 z:3];
            
            CCSprite *tu2 = [CCSprite spriteWithSpriteFrameName:@"2_2.png"];
            tu2.position = ccp(438, 530);
            tu2.tag = 11;
            [self addChild:tu2 z:3];
            
            CCSprite *tu3 = [CCSprite spriteWithSpriteFrameName:@"2_3.png"];
            tu3.position = ccp(590, 530);
            tu3.tag = 12;
            [self addChild:tu3 z:3];
            
            CCSprite *tu4 = [CCSprite spriteWithSpriteFrameName:@"2_4.png"];
            tu4.position = ccp(742, 530);
            tu4.tag = 13;
            [self addChild:tu4 z:3];
            
            CCSprite *tu5 = [CCSprite spriteWithSpriteFrameName:@"2_5.png"];
            tu5.position = ccp(286, 395.5);
            tu5.tag = 14;
            [self addChild:tu5 z:3];
            
            CCSprite *tu6 = [CCSprite spriteWithSpriteFrameName:@"2_6.png"];
            tu6.position = ccp(438, 395.5);
            tu6.tag = 15;
            [self addChild:tu6 z:3];
            
            CCSprite *tu7 = [CCSprite spriteWithSpriteFrameName:@"2_7.png"];
            tu7.position = ccp(590, 395.5);
            tu7.tag = 16;
            [self addChild:tu7 z:3];
            
            CCSprite *tu8 = [CCSprite spriteWithSpriteFrameName:@"2_8.png"];
            tu8.position = ccp(742, 395.5);
            tu8.tag = 17;
            [self addChild:tu8 z:3];
            
            CCSprite *tu9 = [CCSprite spriteWithSpriteFrameName:@"2_9.png"];
            tu9.position = ccp(286, 260.5);
            tu9.tag = 18;
            [self addChild:tu9 z:3];
            
            CCSprite *tu10 = [CCSprite spriteWithSpriteFrameName:@"2_10.png"];
            tu10.position = ccp(438, 260.5);
            tu10.tag = 19;
            [self addChild:tu10 z:3];
            
            CCSprite *tu11 = [CCSprite spriteWithSpriteFrameName:@"2_11.png"];
            tu11.position = ccp(590, 260.5);
            tu11.tag = 20;
            [self addChild:tu11 z:3];
            
            CCSprite *tu12 = [CCSprite spriteWithSpriteFrameName:@"2_12.png"];
            tu12.position = ccp(742, 260.5);
            tu12.tag = 21;
            [self addChild:tu12 z:3];
            
            [arry addObjectsFromArray:[NSArray arrayWithObjects:tu1,tu2,tu3,tu4,tu5,tu6,tu7,tu8,tu9,tu10,tu11,tu12,nil]];
            [self array2Add];
        }
        else if (number2 == 2){
            [cache addSpriteFramesWithFile:@"4*6.plist" textureFile:@"4*6.pvr.ccz"];
            [self array3Add];
            [arry2 addObject:[NSString stringWithString:@"0%"]];

//            for (int i = 1; i<= 24; i++) {
//                CGPoint pos = CGPointMake(127 + (i-1)%12*70, 105 - (i-1)/12*70);
//                [arry1 addObject:[NSValue valueWithCGPoint:pos]];
//                CCSprite *tu = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"3_%d.png",i]];
//                tu.position = ccp(262 + (i-1)%6 * 101, 547 - (i -1)/6*101);
//                tu.tag = 10+i -1;
//                [self addChild:tu z:11];
//                [arry addObject:tu];
//            }
//            
//            
//            
//            /*
            CCLabelTTF *shijian = [CCLabelTTF labelWithString: @"0:100" fontName:fontName_ fontSize:fontSize_];
            shijian.position = ccp(92, 505);
            shijian.tag = 7;
            [self addChild:shijian z:3];
            
            CCSprite *tu1 = [CCSprite spriteWithSpriteFrameName:@"3_1.png"];
            tu1.position = ccp(262, 547);
            tu1.tag = 10;
            [self addChild:tu1 z:3];
            

            CCSprite *tu2 = [CCSprite spriteWithSpriteFrameName:@"3_2.png"];
            tu2.position = ccp(363, 547);
            tu2.tag = 11;
            [self addChild:tu2 z:3];
            
            CCSprite *tu3 = [CCSprite spriteWithSpriteFrameName:@"3_3.png"];
            tu3.position = ccp(464, 547);
            tu3.tag = 12;
            [self addChild:tu3 z:3];
            
            CCSprite *tu4 = [CCSprite spriteWithSpriteFrameName:@"3_4.png"];
            tu4.position = ccp(565, 547);
            tu4.tag = 13;
            [self addChild:tu4 z:3];
            
            CCSprite *tu5 = [CCSprite spriteWithSpriteFrameName:@"3_5.png"];
            tu5.position = ccp(666, 547);
            tu5.tag = 14;
            [self addChild:tu5 z:3];
            
            CCSprite *tu6 = [CCSprite spriteWithSpriteFrameName:@"3_6.png"];
            tu6.position = ccp(767, 547);
            tu6.tag = 15;
            [self addChild:tu6 z:3];
            
            CCSprite *tu7 = [CCSprite spriteWithSpriteFrameName:@"3_7.png"];
            tu7.position = ccp(262, 446);
            tu7.tag = 16;
            [self addChild:tu7 z:3];
            
            CCSprite *tu8 = [CCSprite spriteWithSpriteFrameName:@"3_8.png"];
            tu8.position = ccp(363, 446);
            tu8.tag = 17;
            [self addChild:tu8 z:3];
            
            CCSprite *tu9 = [CCSprite spriteWithSpriteFrameName:@"3_9.png"];
            tu9.position = ccp(464, 446);
            tu9.tag = 18;
            [self addChild:tu9 z:3];
            
            CCSprite *tu10 = [CCSprite spriteWithSpriteFrameName:@"3_10.png"];
            tu10.position = ccp(565, 446);
            tu10.tag = 19;
            [self addChild:tu10 z:3];
            
            CCSprite *tu11 = [CCSprite spriteWithSpriteFrameName:@"3_11.png"];
            tu11.position = ccp(666, 446);
            tu11.tag = 20;
            [self addChild:tu11 z:3];
            
            CCSprite *tu12 = [CCSprite spriteWithSpriteFrameName:@"3_12.png"];
            tu12.position = ccp(767, 446);
            tu12.tag = 21;
            [self addChild:tu12 z:3];
            
            CCSprite *tu13 = [CCSprite spriteWithSpriteFrameName:@"3_13.png"];
            tu13.position = ccp(262, 345);
            tu13.tag = 22;
            [self addChild:tu13 z:3];
            
            CCSprite *tu14 = [CCSprite spriteWithSpriteFrameName:@"3_14.png"];
            tu14.position = ccp(363, 345);
            tu14.tag = 23;
            [self addChild:tu14 z:3];
            
            CCSprite *tu15 = [CCSprite spriteWithSpriteFrameName:@"3_15.png"];
            tu15.position = ccp(464, 345);
            tu15.tag = 24;
            [self addChild:tu15 z:3];
            
            CCSprite *tu16 = [CCSprite spriteWithSpriteFrameName:@"3_16.png"];
            tu16.position = ccp(565, 345);
            tu16.tag = 25;
            [self addChild:tu16 z:3];
            
            CCSprite *tu17 = [CCSprite spriteWithSpriteFrameName:@"3_17.png"];
            tu17.position = ccp(666, 345);
            tu17.tag = 26;
            [self addChild:tu17 z:3];
            
            CCSprite *tu18 = [CCSprite spriteWithSpriteFrameName:@"3_18.png"];
            tu18.position = ccp(767, 345);
            tu18.tag = 27;
            [self addChild:tu18 z:3];
            
            CCSprite *tu19 = [CCSprite spriteWithSpriteFrameName:@"3_19.png"];
            tu19.position = ccp(262, 244);
            tu19.tag = 28;
            [self addChild:tu19 z:3];
            
            CCSprite *tu20 = [CCSprite spriteWithSpriteFrameName:@"3_20.png"];
            tu20.position = ccp(363, 244);
            tu20.tag = 29;
            [self addChild:tu20 z:3];
            
            CCSprite *tu21 = [CCSprite spriteWithSpriteFrameName:@"3_21.png"];
            tu21.position = ccp(464, 244);
            tu21.tag = 30;
            [self addChild:tu21 z:3];
            
            CCSprite *tu22 = [CCSprite spriteWithSpriteFrameName:@"3_22.png"];
            tu22.position = ccp(565, 244);
            tu22.tag = 31;
            [self addChild:tu22 z:3];
            
            CCSprite *tu23 = [CCSprite spriteWithSpriteFrameName:@"3_23.png"];
            tu23.position = ccp(666, 244);
            tu23.tag = 32;
            [self addChild:tu23 z:3];
            
            CCSprite *tu24 = [CCSprite spriteWithSpriteFrameName:@"3_24.png"];
            tu24.position = ccp(767, 244);
            tu24.tag = 33;
            [self addChild:tu24 z:3];
            
            CCSprite *tu25 = [CCSprite spriteWithSpriteFrameName:@"tai.png"];
            tu25.position = ccp(1124, 384);
            tu25.tag = 34;
            [self addChild:tu25 z:10];
            
            CCSprite *tu26 = [CCSprite spriteWithSpriteFrameName:@"pang.png"];
            tu26.position = ccp(1124, 384);
            tu26.tag = 35;
            [self addChild:tu26 z:10];
            
            CCSprite *tu27 = [CCSprite spriteWithSpriteFrameName:@"le.png"];
            tu27.position = ccp(1124, 384);
            tu27.tag = 36;
            [self addChild:tu27 z:10];
            
            CCSprite *tu28 = [CCSprite spriteWithSpriteFrameName:@"hao.png"];
            tu28.position = ccp(1124, 384);
            tu28.tag = 37;
            [self addChild:tu28 z:10];
            
            [arry addObjectsFromArray:[NSArray arrayWithObjects:tu1,tu2,tu3,tu4,tu5,tu6,tu7,tu8,tu9,tu10,tu11,tu12,tu13,tu14,tu15,tu16,tu17,tu18,tu19,tu20,tu21,tu22,tu23,tu24,nil]];
         
             }
        self.isTouchEnabled = YES;
    }
    return self;
}
- (void) updateTimeDisplay{
    [self removeChildByTag:7 cleanup:YES];
    --shi;
    CCLabelAtlas *clockLabel = (CCLabelAtlas *)[self getChildByTag:7];
    clockLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"0:%02d",shi] fontName:fontName_ fontSize:fontSize_];
    clockLabel.position = ccp(92, 505);
    clockLabel.tag = 7;
    [self addChild:clockLabel z:3];
    if (shi<=0) {
        [self unschedule:@selector(updateTimeDisplay)];
        bol7 = NO;
        [[SimpleAudioEngine sharedEngine] playEffect:@"fail.wav"];

    }
}
- (void) updateTimeDisplay1{
    [self removeChildByTag:7 cleanup:YES];
    --shi1;
    CCLabelAtlas *clockLabel = (CCLabelAtlas *)[self getChildByTag:7];
    clockLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"0:%02d",shi1] fontName:fontName_ fontSize:fontSize_];
    clockLabel.position = ccp(92, 505);
    clockLabel.tag = 7;
    [self addChild:clockLabel z:3];
    if (shi1<=0) {
        [self unschedule:@selector(updateTimeDisplay1)];
        bol7 = NO;
        [[SimpleAudioEngine sharedEngine] playEffect:@"fail.wav"];

    }
}
- (void) updateTimeDisplay2{
    [self removeChildByTag:7 cleanup:YES];
    --shi2;
    CCLabelAtlas *clockLabel = (CCLabelAtlas *)[self getChildByTag:7];
    clockLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"0:%02d",shi2] fontName:fontName_ fontSize:fontSize_];
    clockLabel.position = ccp(92, 505);
    clockLabel.tag = 7;
    [self addChild:clockLabel z:3];
    if (shi2<=0) {
        [self unschedule:@selector(updateTimeDisplay2)];
        bol7 = NO;
        [[SimpleAudioEngine sharedEngine] playEffect:@"fail.wav"];

    }
}
//}
//字符转换成时间显示
//- (NSString *)stringForObjectValue:(id)anObject{
//    
//    if (! [anObject isKindOfClass: [NSNumber class]]) {
//        return nil;
//        
//    }
//    
//    NSNumber *secondsNumber = (NSNumber*) anObject;
//    
//    int seconds = [secondsNumber intValue];
//    
//    int minutesPart = seconds / 60;
//    
//    int secondsPart = seconds % 60;
//    
//    NSString *minutesString = (minutesPart < 10) ?
//    
//    [NSString stringWithFormat:@"0%d", minutesPart] :
//    
//    [NSString stringWithFormat:@"%d", minutesPart];
//    
//    NSString *secondsString = (secondsPart < 10) ?
//    
//    [NSString stringWithFormat:@"0%d", secondsPart] :
//    
//    [NSString stringWithFormat:@"%d", secondsPart];
//    
//    return [NSString stringWithFormat:@"%@:%@", minutesString, secondsString];
//    
//}
- (void)onEnter {
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}

- (void)onExit{
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [super onExit];
}
-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    if (bol7 == YES) {
        for (CCSprite *spt in arry ) {
            if (CGRectContainsPoint(spt.boundingBox, touchLocation)){
                if (spt.scale == 1) {
                    return NO;
                }
                else {
                    n=spt.tag;
                    spt.scale = 1;
                    sp = spt.position; 
                    break;
                }
            }
        }
    }
    //    return self.isTouchEnabled;
    return YES;
}
-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    CCSprite *sprite1= (CCSprite *)[self getChildByTag:n];
    if (bol7 == YES) {
        if (CGRectContainsPoint(sprite1.boundingBox, touchLocation)) {
            sprite1.position = ccpAdd(sprite1.position, translation);
            [self reorderChild:sprite1 z:10];
        }
    }
}
-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];  
    CCLOG(@"{%f,%f},",location.x,location.y );
    CCSprite *sprite1= (CCSprite *)[self getChildByTag:n];
    CCSprite *sprite2= (CCSprite *)[self getChildByTag:1];
    CCSprite *sprite6= (CCSprite *)[self getChildByTag:2];
    CCSprite *sprite3= (CCSprite *)[self getChildByTag:3];
    CCSprite *sprite4= (CCSprite *)[self getChildByTag:4];
    CCSprite *sprite5= (CCSprite *)[self getChildByTag:5];
    CCSprite *sprite34= (CCSprite *)[self getChildByTag:34];
    CCSprite *sprite35= (CCSprite *)[self getChildByTag:35];
    CCSprite *sprite36= (CCSprite *)[self getChildByTag:36];
    CCSprite *sprite37= (CCSprite *)[self getChildByTag:37];
    CCSprite *sprite200= (CCSprite *)[self getChildByTag:200];
    if (number2 == 0) {
        if (bol7 == YES) {   
            if (sprite1.tag == 10 ) {
                if (CGRectContainsPoint(CGRectMake(210, 398, 200, 200), location)) {
                    sprite1.position = ccp(310, 498);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else  if (sprite1.tag == 11 ) {
                if (CGRectContainsPoint(CGRectMake(413, 398, 200, 200), location)) {
                    sprite1.position = ccp(513, 498);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                } 
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else  if (sprite1.tag == 12 ) {
                if (CGRectContainsPoint(CGRectMake(616, 398, 200, 200), location)) {
                    sprite1.position = ccp(716, 498);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }  
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else  if (sprite1.tag == 13 ) {
                if (CGRectContainsPoint(CGRectMake(210, 195, 200, 200), location)) {
                    sprite1.position = ccp(310, 295);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                } 
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else  if (sprite1.tag == 14 ) {
                if (CGRectContainsPoint(CGRectMake(413, 195, 200, 200), location)) {
                    sprite1.position = ccp(513, 295);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else  if (sprite1.tag == 15 ) {
                if (CGRectContainsPoint(CGRectMake(616, 195, 200, 200), location)) {
                    sprite1.position = ccp(716, 295);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }  
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
        }
        switch (number1) {
            case  1:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"16%%"] fontName:fontName_ fontSize:fontSize_];
                laber.position = ccp(92, 290);
                laber.tag = 8;
                [self addChild:laber z:3]; 
                break;
            case  2:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber2 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"32%%"] fontName:fontName_ fontSize:fontSize_];
                laber2.position = ccp(92, 290);
                laber2.tag = 8;
                [self addChild:laber2 z:3];
                break;
            case  3:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber3 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"48%%"] fontName:fontName_ fontSize:fontSize_];
                laber3.position = ccp(92, 290);
                laber3.tag = 8;
                [self addChild:laber3 z:3]; 
                break;
            case  4:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber4 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"64%%"] fontName:fontName_ fontSize:fontSize_];
                laber4.position = ccp(92, 290);
                laber4.tag = 8;
                [self addChild:laber4 z:3]; 
                break;
            case  5:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber5 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"82%%"] fontName:fontName_ fontSize:fontSize_];
                laber5.position = ccp(92, 290);
                laber5.tag = 8;
                [self addChild:laber5 z:3];  
                break;
            case  6:
                [self removeChildByTag:8 cleanup:YES];
//                [self removeChildByTag:100 cleanup:YES];
                CCLabelTTF *laber6 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"100%%"] fontName:fontName_ fontSize:fontSize_];
                laber6.position = ccp(92, 290);
                laber6.tag = 8;
                [self addChild:laber6 z:3];
                number1 = 0;
                bol7 = NO;
                vider = (NSString *)[[SimpleAudioEngine sharedEngine] playEffect:@"youxi_win.wav" ];
                [self unschedule:@selector(updateTimeDisplay)];
//                [self array1Add];
//                bol = YES;
                break;
                
            default:
                break;
        }
    }
   else if (number2 == 1) {
        if (bol7 == YES) {
            if (sprite1.tag ==10) {
                if (CGRectContainsPoint(CGRectMake(248.5, 496.75, 75, 66.5), location)) {
                    sprite1.position = ccp(286, 530);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else if (sprite1.tag ==11) {
                if (CGRectContainsPoint(CGRectMake(400.5, 496.75, 75, 66.5), location)) {
                    sprite1.position = ccp(438, 530);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else if (sprite1.tag ==12) {
                if (CGRectContainsPoint(CGRectMake(552.5, 496.75, 75, 66.5), location)) {
                    sprite1.position = ccp(590, 530);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else if (sprite1.tag ==13) {
                if (CGRectContainsPoint(CGRectMake(704.5, 496.75, 75, 66.5), location)) {
                    sprite1.position = ccp(742, 530);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else if (sprite1.tag ==14) {
                if (CGRectContainsPoint(CGRectMake(248.5, 362.25, 75, 66.5), location)) {
                    sprite1.position = ccp(286, 395.5);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else if (sprite1.tag ==15) {
                if (CGRectContainsPoint(CGRectMake(400.5, 362.25, 75, 66.5), location)) {
                    sprite1.position = ccp(438, 395.5);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else if (sprite1.tag ==16) {
                if (CGRectContainsPoint(CGRectMake(552.5, 362.25, 75, 66.5), location)) {
                    sprite1.position = ccp(590, 395.5);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else if (sprite1.tag ==17) {
                if (CGRectContainsPoint(CGRectMake(704.5, 362.25, 75, 66.5), location)) {
                    sprite1.position = ccp(742, 395.5);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else if (sprite1.tag ==18) {
                if (CGRectContainsPoint(CGRectMake(248.5, 226.25, 75, 66.5), location)) {
                    sprite1.position = ccp(286, 260.5);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else if (sprite1.tag ==19) {
                if (CGRectContainsPoint(CGRectMake(400.5, 226.25, 75, 66.5), location)) {
                    sprite1.position = ccp(438, 260.5);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else if (sprite1.tag ==20) {
                if (CGRectContainsPoint(CGRectMake(552.5, 226.25, 75, 66.5), location)) {
                    sprite1.position = ccp(590, 260.5);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
            else if (sprite1.tag ==21) {
                if (CGRectContainsPoint(CGRectMake(704.5, 226.25, 75, 66.5), location)) {
                    sprite1.position = ccp(742, 260.5);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.5;
                }
            }
        }
        switch (number1) {
            case  1:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"8%%"] fontName:fontName_ fontSize:fontSize_];
                laber.position = ccp(92, 290);
                laber.tag = 8;
                [self addChild:laber z:3];   
                break;
            case  2:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber2 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"17%%"] fontName:fontName_ fontSize:fontSize_];
                laber2.position = ccp(92, 290);
                laber2.tag = 8;
                [self addChild:laber2 z:3];   
                break;
            case  3:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber3 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"25%%"] fontName:fontName_ fontSize:fontSize_];
                laber3.position = ccp(92, 290);
                laber3.tag = 8;
                [self addChild:laber3 z:3];   
                break;
            case  4:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber4 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"33%%"] fontName:fontName_ fontSize:fontSize_];
                laber4.position = ccp(92, 290);
                laber4.tag = 8;
                [self addChild:laber4 z:3];   
                break;
            case  5:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber5 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"42%%"] fontName:fontName_ fontSize:fontSize_];
                laber5.position = ccp(92, 290);
                laber5.tag = 8;
                [self addChild:laber5 z:3];   
                break;
            case  6:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber6 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"50%%"] fontName:fontName_ fontSize:fontSize_];
                laber6.position = ccp(92, 290);
                laber6.tag = 8;
                [self addChild:laber6 z:3];   
                break;
            case  7:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber7 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"58%%"] fontName:fontName_ fontSize:fontSize_];
                laber7.position = ccp(92, 290);
                laber7.tag = 8;
                [self addChild:laber7 z:3];   
                break;
            case  8:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber8 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"67%%"] fontName:fontName_ fontSize:fontSize_];
                laber8.position = ccp(92, 290);
                laber8.tag = 8;
                [self addChild:laber8 z:3];   
                break;
            case  9:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber9 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"75%%"] fontName:fontName_ fontSize:fontSize_];
                laber9.position = ccp(92, 290);
                laber9.tag = 8;
                [self addChild:laber9 z:3];   
                break;
            case  10:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber10 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"84%%"] fontName:fontName_ fontSize:fontSize_];
                laber10.position = ccp(92, 290);
                laber10.tag = 8;
                [self addChild:laber10 z:3];   
                break;
            case  11:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber11 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"92%%"] fontName:fontName_ fontSize:fontSize_];
                laber11.position = ccp(92, 290);
                laber11.tag = 8;
                [self addChild:laber11 z:3];   
                break;
            case  12:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber12 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"100%%"] fontName:fontName_ fontSize:fontSize_];
                laber12.position = ccp(92, 290);
                laber12.tag = 8;
                [self addChild:laber12 z:3]; 
                number1 = 0;
                bol7 = NO;
                vider = (NSString *)[[SimpleAudioEngine sharedEngine] playEffect:@"youxi_win.wav" ];
                CCParticleSystem *emitter = [[CCParticleExplosion alloc] init];
                emitter.totalParticles = 50;
                
                
                emitter.texture = [[CCTextureCache sharedTextureCache]addImage:@"fp1_cd1.png"];
                
                emitter.position = ccp(312, 768);
                emitter.startSize = 70;
                emitter.tag = 100;
                emitter.posVar = ccp(800, 0);
                emitter.life = 20;
                emitter.speed = 300;
                [self addChild:emitter z:8];
                
                CCParticleSystem *emitter1 = [[CCParticleExplosion alloc] init];
                emitter1.totalParticles = 50;
                
                
                emitter1.texture = [[CCTextureCache sharedTextureCache]addImage:@"fp1_cd3.png"];
                
                emitter1.position = ccp(312, 768);
                emitter1.startSize = 70;
                emitter1.tag = 100;
                emitter1.posVar = ccp(800, 0);
                emitter1.life = 20;
                emitter1.speed = 300;
                [self addChild:emitter1 z:8];
                
                CCParticleSystem *emitter2 = [[CCParticleExplosion alloc] init];
                emitter2.totalParticles = 50;
                
                
                emitter2.texture = [[CCTextureCache sharedTextureCache]addImage:@"fp1_ca2.png"];
                
                emitter2.position = ccp(312, 768);
                emitter2.startSize = 70;
                emitter2.tag = 100;
                emitter2.posVar = ccp(800, 0);
                emitter2.life = 20;
                emitter2.speed = 300;
                [self addChild:emitter2 z:8];
                
                
                CCParticleSystem *emitter3 = [[CCParticleExplosion alloc] init];
                emitter3.totalParticles = 50;
                
                
                emitter3.texture = [[CCTextureCache sharedTextureCache]addImage:@"fp1_cd.png"];
                
                emitter3.position = ccp(312, 768);
                emitter3.startSize = 40;
                emitter3.tag = 100;
                emitter3.posVar = ccp(800, 0);
                emitter3.life = 20;
                emitter3.speed = 300;
                [self addChild:emitter3 z:8];
                [self unschedule:@selector(updateTimeDisplay1)];
//                [self array2Add];
//                bol = YES;

                break;
            default:
                break; 
        }
    }
   else if (number2 == 2) {
//        if(CGRectContainsPoint(sprite3.boundingBox, location)){
        if (bol7 == YES) {
            if (sprite1.tag ==10) {
                if (CGRectContainsPoint(CGRectMake(232, 517, 60, 60), location)) {
                    sprite1.position = ccp(262, 547);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if (sprite1.tag ==11) {
                if (CGRectContainsPoint(CGRectMake(333, 517, 60, 60), location)) {
                    sprite1.position = ccp(363, 547);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if (sprite1.tag ==12) {
                if (CGRectContainsPoint(CGRectMake(434, 517, 60, 60), location)) {
                    sprite1.position = ccp(464, 547);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            } 
            else if (sprite1.tag ==13) {
                if (CGRectContainsPoint(CGRectMake(535, 517, 60, 60), location)) {
                    sprite1.position = ccp(565, 547);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if (sprite1.tag ==14) {
                if (CGRectContainsPoint(CGRectMake(636, 517, 60, 60), location)) {
                    sprite1.position = ccp(666, 547);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if (sprite1.tag ==15) {
                if (CGRectContainsPoint(CGRectMake(737, 517, 60, 60), location)) {
                    sprite1.position = ccp(767, 547);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if (sprite1.tag ==16) {
                if (CGRectContainsPoint(CGRectMake(232, 416, 60, 60), location)) {
                    sprite1.position = ccp(262, 446);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if (sprite1.tag ==17) {
                if (CGRectContainsPoint(CGRectMake(333, 416, 60, 60), location)) {
                    sprite1.position = ccp(363, 446);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if (sprite1.tag ==18) {
                if (CGRectContainsPoint(CGRectMake(434, 416, 60, 60), location)) {
                    sprite1.position = ccp(464, 446);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if (sprite1.tag ==19) {
                if (CGRectContainsPoint(CGRectMake(535, 416, 60, 60), location)) {
                    sprite1.position = ccp(565, 446);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if (sprite1.tag ==20) {
                if (CGRectContainsPoint(CGRectMake(636, 416, 60, 60), location)) {
                    sprite1.position = ccp(666, 446);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if (sprite1.tag ==21) {
                if (CGRectContainsPoint(CGRectMake(737, 416, 60, 60), location)) {
                    sprite1.position = ccp(767, 446);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if(sprite1.tag == 22){
                if (CGRectContainsPoint(CGRectMake(232, 315, 60, 60), location)) {
                    sprite1.position = ccp(262, 345);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if(sprite1.tag == 23){
                if (CGRectContainsPoint(CGRectMake(333, 315, 60, 60), location)) {
                    sprite1.position = ccp(363, 345);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if(sprite1.tag == 24){
                if (CGRectContainsPoint(CGRectMake(434, 315, 60, 60), location)) {
                    sprite1.position = ccp(464, 345);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if(sprite1.tag == 25){
                if (CGRectContainsPoint(CGRectMake(535, 315, 60, 60), location)) {
                    sprite1.position = ccp(565, 345);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if(sprite1.tag == 26){
                if (CGRectContainsPoint(CGRectMake(636, 315, 60, 60), location)) {
                    sprite1.position = ccp(666, 345);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if(sprite1.tag == 27){
                if (CGRectContainsPoint(CGRectMake(737, 315, 60, 60), location)) {
                    sprite1.position = ccp(767, 345);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if(sprite1.tag == 28){
                if (CGRectContainsPoint(CGRectMake(232, 214, 60, 60), location)) {
                    sprite1.position = ccp(262, 244);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if(sprite1.tag == 29){
                if (CGRectContainsPoint(CGRectMake(333, 214, 60, 60), location)) {
                    sprite1.position = ccp(363, 244);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if(sprite1.tag == 30){
                if (CGRectContainsPoint(CGRectMake(434, 214, 60, 60), location)) {
                    sprite1.position = ccp(464, 244);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if(sprite1.tag == 31){
                if (CGRectContainsPoint(CGRectMake(535, 214, 60, 60), location)) {
                    sprite1.position = ccp(565, 244);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if(sprite1.tag == 32){
                if (CGRectContainsPoint(CGRectMake(636, 214, 60, 60), location)) {
                    sprite1.position = ccp(666, 244);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
            else if(sprite1.tag == 33){
                if (CGRectContainsPoint(CGRectMake(737, 214, 60, 60), location)) {
                    sprite1.position = ccp(767, 244);
                    [self reorderChild:sprite1 z:3];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"xx.wav"];
                    number1++;
                }
                else {
                    sprite1.position = sp;
                    sprite1.scale = 0.7;
                }
            }
        }
        //            if (number1 == 1) {
        //                [self removeChildByTag:8 cleanup:YES];
        //                int i;
        //                i = 4;
        //                CCLabelTTF *laber = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d%%",i] fontName:fontName_ fontSize:fontSize_];
        //                laber.position = ccp(92, 290);
        //                laber.tag = 8;
        //                [self addChild:laber z:3];
        //
        //            }
        switch (number1) {
            case  1:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"4%%"] fontName:fontName_ fontSize:fontSize_];
                laber.position = ccp(92, 290);
                laber.tag = 8;
                [self addChild:laber z:3]; 
                break;
            case  2:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber2 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"8%%"] fontName:fontName_ fontSize:fontSize_];
                laber2.position = ccp(92, 290);
                laber2.tag = 8;
                [self addChild:laber2 z:3];   
                break;
            case  3:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber3 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"12%%"] fontName:fontName_ fontSize:fontSize_];
                laber3.position = ccp(92, 290);
                laber3.tag = 8;
                [self addChild:laber3 z:3];   
                break;
            case  4:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber4 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"16%%"] fontName:fontName_ fontSize:fontSize_];
                laber4.position = ccp(92, 290);
                laber4.tag = 8;
                [self addChild:laber4 z:3];   
                break;
            case  5:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber5 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"20%%"] fontName:fontName_ fontSize:fontSize_];
                laber5.position = ccp(92, 290);
                laber5.tag = 8;
                [self addChild:laber5 z:3];   
                break;
            case  6:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber6 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"24%%"] fontName:fontName_ fontSize:fontSize_];
                laber6.position = ccp(92, 290);
                laber6.tag = 8;
                [self addChild:laber6 z:3];   
                break;
            case  7:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber7 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"28%%"] fontName:fontName_ fontSize:fontSize_];
                laber7.position = ccp(92, 290);
                laber7.tag = 8;
                [self addChild:laber7 z:3];   
                break;
            case  8:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber8 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"32%%"] fontName:fontName_ fontSize:fontSize_];
                laber8.position = ccp(92, 290);
                laber8.tag = 8;
                [self addChild:laber8 z:3];   
                break;
            case  9:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber9 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"36%%"] fontName:fontName_ fontSize:fontSize_];
                laber9.position = ccp(92, 290);
                laber9.tag = 8;
                [self addChild:laber9 z:3];   
                break;
            case  10:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber10 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"40%%"] fontName:fontName_ fontSize:fontSize_];
                laber10.position = ccp(92, 290);
                laber10.tag = 8;
                [self addChild:laber10 z:3];   
                break;
            case  11:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber11 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"44%%"] fontName:fontName_ fontSize:fontSize_];
                laber11.position = ccp(92, 290);
                laber11.tag = 8;
                [self addChild:laber11 z:3];   
                break;
            case  12:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber12 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"48%%"] fontName:fontName_ fontSize:fontSize_];
                laber12.position = ccp(92, 290);
                laber12.tag = 8;
                [self addChild:laber12 z:3];   
                break;
            case  13:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber13 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"52%%"] fontName:fontName_ fontSize:fontSize_];
                laber13.position = ccp(92, 290);
                laber13.tag = 8;
                [self addChild:laber13 z:3];   
                break;
            case  14:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber14 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"56%%"] fontName:fontName_ fontSize:fontSize_];
                laber14.position = ccp(92, 290);
                laber14.tag = 8;
                [self addChild:laber14 z:3];   
                break;
            case  15:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber15 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"62%%"] fontName:fontName_ fontSize:fontSize_];
                laber15.position = ccp(92, 290);
                laber15.tag = 8;
                [self addChild:laber15 z:3];   
                break;
            case  16:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber16 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"66%%"] fontName:fontName_ fontSize:fontSize_];
                laber16.position = ccp(92, 290);
                laber16.tag = 8;
                [self addChild:laber16 z:3];   
                break;
            case  17:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber17 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"70%%"] fontName:fontName_ fontSize:fontSize_];
                laber17.position = ccp(92, 290);
                laber17.tag = 8;
                [self addChild:laber17 z:3];   
                break;
            case  18:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber18 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"74%%"] fontName:fontName_ fontSize:fontSize_];
                laber18.position = ccp(92, 290);
                laber18.tag = 8;
                [self addChild:laber18 z:3];   
                break;
            case  19:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber19 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"78%%"] fontName:fontName_ fontSize:fontSize_];
                laber19.position = ccp(92, 290);
                laber19.tag = 8;
                [self addChild:laber19 z:3];   
                break;
            case  20:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber20 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"82%%"] fontName:fontName_ fontSize:fontSize_];
                laber20.position = ccp(92, 290);
                laber20.tag = 8;
                [self addChild:laber20 z:3];   
                break;
            case  21:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber21 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"86%%"] fontName:fontName_ fontSize:fontSize_];
                laber21.position = ccp(92, 290);
                laber21.tag = 8;
                [self addChild:laber21 z:3];   
                break;
            case  22:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber22 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"90%%"] fontName:fontName_ fontSize:fontSize_];
                laber22.position = ccp(92, 290);
                laber22.tag = 8;
                [self addChild:laber22 z:3];   
                break;
            case  23:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber23 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"94%%"] fontName:fontName_ fontSize:fontSize_];
                laber23.position = ccp(92, 290);
                laber23.tag = 8;
                [self addChild:laber23 z:3];   
                break;
            case  24:
                [self removeChildByTag:8 cleanup:YES];    
                CCLabelTTF *laber24 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"100%%"] fontName:fontName_ fontSize:fontSize_];
                laber24.position = ccp(92, 290);
                laber24.tag = 8;
                [self addChild:laber24 z:3];
                bol7 = NO;
                number1 = 0;
                vider = (NSString *)[[SimpleAudioEngine sharedEngine] playEffect:@"youxi_win.wav" ];
                [cache addSpriteFramesWithFile:@"shengli.plist" textureFile:@"shengli.pvr.ccz"];
                
                CCSprite * shengli = [CCSprite spriteWithSpriteFrameName:@"shengli.png"];
                shengli.position = ccp(512, 384);
                shengli.visible = YES;
                [self addChild:shengli z:9];
                [shengli runAction:[CCSequence actions:[CCFadeIn actionWithDuration:2.f],[CCDelayTime actionWithDuration:1.2f],[CCFadeOut actionWithDuration:1.f], nil]];
                
                [sprite34 runAction:[CCSequence actions:[CCEaseBounceOut actionWithAction:[CCMoveTo actionWithDuration:1.5f position:ccp(265, 392)]],[CCDelayTime actionWithDuration:0.6f],[CCMoveTo actionWithDuration:1.f position:ccp(-100, 384)], nil]];
                [sprite35 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.4f],[CCEaseBounceOut actionWithAction:[CCMoveTo actionWithDuration:1.5f position:ccp(405, 392)]],[CCMoveTo actionWithDuration:0.8f position:ccp(460, 392)] ,[CCMoveTo actionWithDuration:1.f position:ccp(-100, 384)],nil]];
                [sprite36 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.8f],[CCEaseBounceOut actionWithAction:[CCMoveTo actionWithDuration:1.5f position:ccp(590, 392)]],[CCMoveTo actionWithDuration:1.f position:ccp(650, 392)] ,[CCMoveTo actionWithDuration:1.f position:ccp(-100, 384)],nil]];
                [sprite37 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:1.f],[CCEaseBounceOut actionWithAction:[CCMoveTo actionWithDuration:1.5f position:ccp(640, 392)]],[CCMoveTo actionWithDuration:1.2f position:ccp(770, 392)] ,[CCMoveTo actionWithDuration:1.f position:ccp(-100, 384)],nil]];
                [self unschedule:@selector(updateTimeDisplay2)];
//                [self array3Add];
//                bol = YES;
                
                break;
            default:
                break;
        }
    }
//   }
    if (CGRectContainsPoint(sprite2.boundingBox, location)){
        if (bol7) {
            if (m==0) {
                sprite200.visible = YES;
                sprite2.visible = NO;
                if (number2 == 0) {
                    [self unschedule:@selector(updateTimeDisplay)];
                    bol7 = NO;
                }
                else  if  (number2 ==2){ 
                    [self unschedule:@selector(updateTimeDisplay2)]; 
                    bol7= NO;
                }
                else  if (number2 ==1){
                    [self unschedule:@selector(updateTimeDisplay1)];
                    bol7 = NO;
                }
                
                m=1;
            }
        }
        else {
            if (m==1){
                sprite200.visible = NO;
                sprite2.visible = YES;
                if (number2 == 0) {
                    [self schedule:@selector(updateTimeDisplay) interval:1];
                    bol7 =YES;
                }     
                else  if(number2 ==2) {
                    [self schedule:@selector(updateTimeDisplay2) interval:1]; 
                    bol7 = YES;
                }   
                else  if(number2 == 1){
                    [self schedule:@selector(updateTimeDisplay1) interval:1];
                    bol7 = YES;
                }
                
                m=0;
            }
        }
    }
    if(CGRectContainsPoint(sprite3.boundingBox, location)){
        page =[NSUserDefaults standardUserDefaults];
        [page setInteger:0 forKey:@"game"];
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)vider];
        [[SimpleAudioEngine sharedEngine] unloadEffect:@"youxi_win.wav"];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade
                                                   transitionWithDuration:0.3f scene:[youxi node] ]];
    }
    else if(CGRectContainsPoint(sprite4.boundingBox, location)){
        page =[NSUserDefaults standardUserDefaults];
        [page setInteger:1 forKey:@"game"];
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)vider];
        [[SimpleAudioEngine sharedEngine] unloadEffect:@"youxi_win.wav"];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade
                                                   transitionWithDuration:0.3f scene:[youxi node] ]];
    }
    
    else if(CGRectContainsPoint(sprite5.boundingBox, location)){
        page =[NSUserDefaults standardUserDefaults];
        [page setInteger:2 forKey:@"game"];
        [[SimpleAudioEngine sharedEngine] stopEffect:(ALuint)vider];
        [[SimpleAudioEngine sharedEngine] unloadEffect:@"youxi_win.wav"];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade
                                                   transitionWithDuration:0.3f scene:[youxi node] ]];
    }

    if (CGRectContainsPoint(sprite6.boundingBox, location)) {
        [SceneManager call_Cover:TransitionCrossFade];
    }
    CCLOG(@"%d 555555555555555",m);
    CCLOG(@"%d",number2);
    n = 0;
}
- (void) call_w1:(id)sender{
    //    self.isTouchEnabled = YES;
    int number;
    bol7 = YES;
    if (bol == YES) {
//        [self removeChildByTag:8 cleanup:YES];    
//        CCLabelTTF *laber16 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"0%%"] fontName:fontName_ fontSize:fontSize_];
//        laber16.position = ccp(92, 290);
//        laber16.tag = 8;
//        [self addChild:laber16 z:3];   
        CCMenu *menu = (CCMenu *)[self getChildByTag:100];
        menu.isTouchEnabled = NO;

        if (number2 == 0) {
//            shi = 30;
            for (int i = 0; i<6; i++) {
                CCSprite *sprite = (CCSprite *)[self getChildByTag:i+10];
                number =arc4random()%[arry1 count];
                sprite.position = [[arry1 objectAtIndex:number] CGPointValue];
                sprite.scale = 0.5;
                [arry1 removeObjectAtIndex:number];
                CCLOG(@"%d",number);
                [self schedule:@selector(updateTimeDisplay) interval:1];
            }
        }
        else if(number2 == 2){
            shi2 = 100;
            for (int i = 0; i<24; i++) {
                CCSprite *sprite = (CCSprite *)[self getChildByTag:i+10];
                number =arc4random()%[arry1 count];
                sprite.position = [[arry1 objectAtIndex:number] CGPointValue];
                sprite.scale = 0.7;
                [arry1 removeObjectAtIndex:number];
                CCLOG(@"%d",number);
                [self schedule:@selector(updateTimeDisplay2) interval:1];
            }
        }
        else if(number2 == 1){
            shi1 = 60;
            for (int i = 0; i<12; i++) {
                CCSprite *sprite = (CCSprite *)[self getChildByTag:i+10];
                number =arc4random()%[arry1 count];
                sprite.position = [[arry1 objectAtIndex:number] CGPointValue];
                sprite.scale = 0.5;
                [arry1 removeObjectAtIndex:number];
                CCLOG(@"%d",number);
                [self schedule:@selector(updateTimeDisplay1) interval:1];
            }
        }
  
        bol = NO;
    }
        
}
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    [arry release];
    [arry1 release];
   	[super dealloc];
}
@end
