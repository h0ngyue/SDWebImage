//
//  KwaiWebImageProfiler.m
//  SDWebImage
//
//  Created by 帅龙成 on 2017/9/10.
//  Copyright © 2017年 Dailymotion. All rights reserved.
//

#import "KwaiWebImageProfiler.h"
#import "KwaiTimeUtil.h"

@interface KwaiWebImageProfiler()
@property(atomic, strong)NSMutableDictionary<NSString *, NSMutableDictionary<NSString *, NSNumber *> *> *dict;
@property(atomic, strong)NSMutableDictionary<NSString *, NSNumber *> *lastTimeDict;
@end

@implementation KwaiWebImageProfiler
+(nonnull instancetype) sharedInstance {
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dict = [[NSMutableDictionary alloc] init];
        _lastTimeDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)startMetric:(NSString *) url {
    [_lastTimeDict setObject:[NSNumber numberWithDouble: [KwaiTimeUtil currentTimeMs]] forKey:url];
}

-(void)addTagFor:(NSString *)url tag:(NSString *)name {
//    NSLog(@"addTagFor :%@", url);
    double curMs = [KwaiTimeUtil currentTimeMs];
    double lastMs = [[_lastTimeDict objectForKey:url] doubleValue];
    id urlDict = [_dict objectForKey: url];
    if (urlDict == nil) {
        urlDict = [[NSMutableDictionary alloc] init];
        [_dict setObject:urlDict forKey:url];
    }
    [urlDict setObject:[NSNumber numberWithDouble:(curMs - lastMs)] forKey:name];
    [_lastTimeDict setObject:[NSNumber numberWithDouble: curMs] forKey:url];
}

-(void)endMetric:(NSString *) url {
    id urlDict = [_dict objectForKey: url];
    if (urlDict == nil) {
        NSLog(@"KwaiWebImageProfiler endMetric , dict for url not found, %@", url);
        return;
    }

    NSString *result = [NSString stringWithFormat:@"KwaiWebImageProfiler for url:%@ is:", [url substringFromIndex:[url length] - 10]];
    
    for (id key in urlDict) {
        result = [result stringByAppendingString:[NSString stringWithFormat:@" %@:%@ms", key, [urlDict objectForKey:key]]];
    }
    NSLog(@"%@", result);
}

@end
