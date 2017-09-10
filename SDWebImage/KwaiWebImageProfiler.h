//
//  KwaiWebImageProfiler.h
//  SDWebImage
//
//  Created by 帅龙成 on 2017/9/10.
//  Copyright © 2017年 Dailymotion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KwaiWebImageProfiler : NSObject
+(nonnull instancetype) sharedInstance;
-(void)addMetricForKey:(NSString *)url metric:(NSString *)name  consume:(double)consumeMs;
-(void)endMetric:(NSString *) url;
@end
