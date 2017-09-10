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
-(void)startMetric:(NSString *_Nonnull) url;
-(void)addTagFor:(NSString * _Nonnull)url tag:(NSString * _Nonnull)name;
-(void)endMetric:(NSString *_Nonnull) url;
@end
