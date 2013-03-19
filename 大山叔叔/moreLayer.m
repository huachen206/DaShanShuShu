//
//  moreLayer.m
//  XiMenBao
//
//  Created by Wei Haoyu on 11-8-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "moreLayer.h"

#define delay_TIME 0.9

#define mb_M01   ccp(282,610)
#define mb_M02   ccp(494,610)
#define mb_M03   ccp(690,610)
#define mb_M04   ccp(876,610)

#define mb_M05   ccp(84,484)
#define mb_M06   ccp(282,484)
#define mb_M07   ccp(494,484)
#define mb_M08   ccp(690,484)
#define mb_M09   ccp(876,484)

#define mb_M10   ccp(84,354)
#define mb_M11   ccp(282,354)
#define mb_M12   ccp(494,354) 
#define mb_M13   ccp(690,354)
#define mb_M14   ccp(876,354)

#define mb_M15   ccp(84,226)
#define mb_M16   ccp(282,226)
#define mb_M17   ccp(494,226)
#define mb_M18   ccp(690,226)
#define mb_M19   ccp(876,226)

@implementation moreLayer

-(id)init{
	if ((self = [super init])) {
        CGSize s = [[CCDirector sharedDirector]winSize];
		CGPoint p = ccp(s.width/2,s.height/2);

		bk = [CCSprite spriteWithFile:@"more.png"];
		bk.position = p;
		bk.tag = 10;
		[self addChild:bk z:0];
        
		[self menu_init];
		self.isTouchEnabled = YES;
	}
	return self;
}

-(void)menu_init
{
    CCMenuItemImage *m1 = [CCMenuItemImage itemFromNormalImage:@"1_1.png" 
                                                 selectedImage:@"1_2.png" 
                                                        target:self 
                                                      selector:@selector(buy_book1:)];				
    CCMenuItemImage *m2 = [CCMenuItemImage itemFromNormalImage:@"2_1.png" 
                                                 selectedImage:@"2_2.png" 
                                                        target:self 
                                                      selector:@selector(buy_book2:)];
    CCMenuItemImage *m3 = [CCMenuItemImage itemFromNormalImage:@"3_1.png" 
                                                 selectedImage:@"3_2.png" 
                                                        target:self 
                                                      selector:@selector(buy_book3:)];
    CCMenuItemImage *m4 = [CCMenuItemImage itemFromNormalImage:@"4_1.png" 
                                                 selectedImage:@"4_2.png" 
                                                        target:self 
                                                      selector:@selector(buy_book4:)];				
    CCMenuItemImage *m5 = [CCMenuItemImage itemFromNormalImage:@"5_1.png" 
                                                 selectedImage:@"5_2.png" 
                                                        target:self 
                                                      selector:@selector(buy_book5:)];
    CCMenuItemImage *m6 = [CCMenuItemImage itemFromNormalImage:@"6_1.png" 
                                                 selectedImage:@"6_2.png" 
                                                        target:self 
                                                      selector:@selector(buy_book6:)];				
    CCMenuItemImage *m7 = [CCMenuItemImage itemFromNormalImage:@"7_1.png" 
                                                 selectedImage:@"7_2.png" 
                                                        target:self 
                                                      selector:@selector(buy_book7:)];
    CCMenuItemImage *m8 = [CCMenuItemImage itemFromNormalImage:@"8_1.png" 
                                                 selectedImage:@"8_2.png" 
                                                        target:self 
                                                      selector:@selector(buy_book8:)];
    CCMenuItemImage *m9 = [CCMenuItemImage itemFromNormalImage:@"9_1.png" 
                                                 selectedImage:@"9_2.png" 
                                                        target:self 
                                                      selector:@selector(buy_book9:)];				
    CCMenuItemImage *m10 = [CCMenuItemImage itemFromNormalImage:@"10_1.png" 
                                                  selectedImage:@"10_2.png" 
                                                         target:self 
                                                       selector:@selector(buy_book10:)];
    
    CCMenuItemImage *m11 = [CCMenuItemImage itemFromNormalImage:@"11_1.png" 
                                                  selectedImage:@"11_2.png" 
                                                         target:self 
                                                       selector:@selector(buy_book11:)];
    
    CCMenuItemImage *m12 = [CCMenuItemImage itemFromNormalImage:@"12_1.png" 
                                                  selectedImage:@"12_2.png" 
                                                         target:self 
                                                       selector:@selector(buy_book12:)];
    CCMenuItemImage *m13 = [CCMenuItemImage itemFromNormalImage:@"13_1.png" 
                                                  selectedImage:@"13_2.png" 
                                                         target:self 
                                                       selector:@selector(buy_book13:)];
    
    CCMenuItemImage *m14 = [CCMenuItemImage itemFromNormalImage:@"14_1.png" 
                                                  selectedImage:@"14_2.png" 
                                                         target:self 
                                                       selector:@selector(buy_book14:)];
    CCMenuItemImage *m15 = [CCMenuItemImage itemFromNormalImage:@"15_1.png" 
                                                  selectedImage:@"15_2.png" 
                                                         target:self 
                                                       selector:@selector(buy_book15:)];
    
    CCMenuItemImage *m16 = [CCMenuItemImage itemFromNormalImage:@"16_1.png" 
                                                  selectedImage:@"16_2.png" 
                                                         target:self 
                                                       selector:@selector(buy_book16:)];
    
    CCMenuItemImage *m17 = [CCMenuItemImage itemFromNormalImage:@"17_1.png" 
                                                  selectedImage:@"17_2.png" 
                                                         target:self 
                                                       selector:@selector(buy_book17:)];
    CCMenuItemImage *m18 = [CCMenuItemImage itemFromNormalImage:@"18_1.png" 
                                                  selectedImage:@"18_2.png" 
                                                         target:self 
                                                       selector:@selector(buy_book18:)];
    
    CCMenuItemImage *m19 = [CCMenuItemImage itemFromNormalImage:@"19_1.png" 
                                                  selectedImage:@"19_2.png" 
                                                         target:self 
                                                       selector:@selector(buy_book19:)];
    m1.position = mb_M01;
    m2.position = mb_M02;
    m3.position = mb_M03;
    m4.position = mb_M04;
    m5.position = mb_M05;
    m6.position = mb_M06;
    m7.position = mb_M07;
    m8.position = mb_M08;
    m9.position = mb_M09;
    m10.position = mb_M10;
    m11.position = mb_M11;
    m12.position = mb_M12;
    m13.position = mb_M13;
    m14.position = mb_M14;
    m15.position = mb_M15;
    m16.position = mb_M16;
    m17.position = mb_M17;
    m18.position = mb_M18;
    m19.position = mb_M19;
    
    CCMenu *image_menu = [CCMenu menuWithItems:m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16,m17,m18,m19,nil];
    image_menu.tag = 100;
    image_menu.position = ccp(0,0);
    [self addChild:image_menu z:2];	
}

//- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{	
//	UITouch *touch = [touches anyObject];
//    CGPoint location = [touch locationInView: [touch view]];
//    CGPoint cp = [[CCDirector sharedDirector] convertToGL:location];
//    
//    if (cp.x > 874 && cp.y < 150 )
//    {
//        [self go_next];
//    }
//}


-(void) buy_book1:(id)sender
{
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/id452906911?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book2:(id)sender
{	
    
    NSString *string=[NSString stringWithFormat:
                      @"http://itunes.apple.com/cn/app/non-swimming-duck/id452515857?mt=8"];
    NSURL *url=[NSURL URLWithString:string];
    [[UIApplication sharedApplication] openURL:url];	
}

-(void) buy_book3:(id)sender
{
    
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/id455204078?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book4:(id)sender
{	
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/id455204550?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book5:(id)sender
{
    
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/big-bread-small-bread/id437767059?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book6:(id)sender
{
    
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/id455199634?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book7:(id)sender
{
    
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/id455202227?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book8:(id)sender
{
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/jackandbeanplant/id452908517?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book9:(id)sender
{
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/id455649066?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book10:(id)sender
{
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/the-wooden-soldiers-shoe-boat/id437766372?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book11:(id)sender
{
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/kabashima-taro/id440661808?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}
-(void) buy_book12:(id)sender
{
	
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/donkeystricks/id452926224?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book13:(id)sender
{
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/id452674705?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book14:(id)sender
{
    
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/id452916184?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}
-(void) buy_book15:(id)sender
{
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/id452512343?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book16:(id)sender
{
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/id452513784?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}


-(void) buy_book17:(id)sender
{
	
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/littlemousemovestoanewhouse/id452923942?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book18:(id)sender
{
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/land-of-tiny-people/id443919605?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
}

-(void) buy_book19:(id)sender
{
    
	NSString *string=[NSString stringWithFormat:
					  @"http://itunes.apple.com/cn/app/zhongshanwolf/id452917737?mt=8"];
	NSURL *url=[NSURL URLWithString:string];
	[[UIApplication sharedApplication] openURL:url];
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
    
    if (abs(translation.x)>25&& CGRectContainsPoint(slide_rect, touchLocation)) {
        [self cleanup];
        
        if (translation.x < 0) {
            [SceneManager call_Cover:TransitionCrossFade];
        }
        else {
            [SceneManager call_Page_Over:TransitionFadeTR];
        }
    }
    
}


- (void) dealloc
{
	[super dealloc];
}

@end
