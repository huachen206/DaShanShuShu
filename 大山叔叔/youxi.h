//
//  youxi.h
//  youxi
//
//  Created by Liu Yang on 12-1-5.
//  Copyright 2012年 Jiangsu  Zhongka  Educational  Science and   Technology  Co.，Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface youxi : CCLayer {
    CCSpriteFrameCache *cache;
    NSString *fontName_;
    NSString *vider;
    int fontSize_;
//    NSDate *time;
    int shi;
    int shi1;
    int shi2;
    NSMutableArray *arry;
    NSMutableArray *arry1;
    NSMutableArray *arry2;
    CGPoint sp;
    NSUserDefaults *page;
    BOOL bol;
    BOOL bol1;
    BOOL bol7;
    int n;
    int number1;
    int number2;
    int m;
}
@end
