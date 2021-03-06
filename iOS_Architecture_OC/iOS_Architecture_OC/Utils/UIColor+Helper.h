//
//  UIColor+Helper.h
//  iOS_Architecture_OC
//
//  Created by MountainX on 2018/7/4.
//  Copyright © 2018年 MTX Software Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#undef  RGBCOLOR
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#undef  RGBACOLOR
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#undef  HEX_RGB
#define HEX_RGB(V)        [UIColor colorWithRGBHex:V]

#define kWhiteColor RGBCOLOR(255.0, 255.0, 255.0)
#define kBlackColor RGBCOLOR(0, 0, 0)
#define kBlueColor  RGBCOLOR(0, 0, 255)
#define kRedColor   RGBCOLOR(255, 0, 0)
#define kGreenColor RGBCOLOR(0, 255, 0)
#define kGrayColor  RGBCOLOR(128, 128, 128)
#define kCyanColor  RGBCOLOR(0, 255, 255)
#define kYellowColor RGBCOLOR(255, 255, 0)
#define kPinkColor  RGBCOLOR(255, 0, 255)
#define kClearColor [UIColor clearColor]

@interface UIColor (Helper)

+ (UIColor *)colorWithRGBHex:(UInt32)hex;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)colorWithCssName:(NSString *)cssColorName;

@end
