//
//  ACForeGroundNotification.m
//  ACForeGroundMessage
//
//  Created by 陈昭燊 on 16/9/1.
//  Copyright © 2016年 陈昭燊. All rights reserved.
//

#import "ACForeGroundNotification.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation ACForeGroundNotification
+(void)handleRemoteNotification:(NSDictionary*)userInfo soundID:(int)soundID isIos10:(BOOL)isIos10{
    if (userInfo) {
        id aps = [userInfo valueForKey:@"aps"];
        if (aps && [aps isKindOfClass:[NSDictionary class]] && [aps valueForKey:@"alert"] && ![[aps valueForKey:@"alert"] isEqual: @""]) {
            [ACForeGroundNotification showBannerWithUserInfo:userInfo soundID:soundID isIos10:isIos10];
        }
    }
}

+(void)handleRemoteNotification:(NSDictionary*)userInfo soundID:(int)soundID{
    [ACForeGroundNotification handleRemoteNotification:userInfo soundID:soundID isIos10:NO];
}

+(void)handleRemoteNotification:(NSDictionary*)userInfo customSound:(NSString*)soundName{
    [ACForeGroundNotification handleRemoteNotification:userInfo customSound:soundName isIos10:NO];
}

+(void)handleRemoteNotification:(NSDictionary*)userInfo customSound:(NSString*)soundName isIos10:(BOOL)isIos10{
    if (soundName) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        SystemSoundID soundID = 0;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &soundID);
        [ACForeGroundNotification handleRemoteNotification:userInfo soundID:soundID isIos10:isIos10];
    }
}

#pragma mark - private

+(void)showBannerWithUserInfo:(NSDictionary*)userInfo soundID:(int)soundID isIos10:(BOOL)isIos10{
    if (soundID) {
        AudioServicesPlaySystemSound(soundID);
    }
    if (SharedFourGroundView) {
        SharedFourGroundView = nil;
    }
    NSArray *banners = [[NSBundle mainBundle] loadNibNamed:@"EBBannerView" owner:nil options:nil];
    if (isIos10) {
        SharedFourGroundView = banners[1];
    }else{
        SharedFourGroundView = banners[0];
    }
    [SharedFourGroundView makeKeyAndVisible];
    UIViewController *controller = [ACForeGroundNotification appRootViewController];
    SharedFourGroundView.isIos10 = isIos10;
    SharedFourGroundView.userInfo = userInfo;
    [controller.view addSubview:SharedFourGroundView];
}

+(UIViewController *)appRootViewController{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}
@end
