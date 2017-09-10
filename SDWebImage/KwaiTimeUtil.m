//
//  KwaiTimeUtil.m
//  SDWebImage
//
//  Created by 帅龙成 on 2017/9/10.
//  Copyright © 2017年 Dailymotion. All rights reserved.
//

#import "KwaiTimeUtil.h"

@implementation KwaiTimeUtil
+ (NSTimeInterval) currentTimeMs  {
    return [[NSDate date] timeIntervalSince1970]*1000;
}
@end
