//
//  FoureGroundView.h
//  iOSDemo
//
//  Created by 陈昭燊 on 16/9/1.
//  Copyright © 2016年 陈昭燊. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BannerStayTime 100
#define BannerSwipeUpTime 0.3
#define BannerSwipeDownTime 0.3

@interface FoureGroundView : UIWindow
@property (nonatomic, retain)NSDictionary *userInfo;
@property (nonatomic, assign)BOOL isIos10;
-(void)removeWithAnimation;
@end
