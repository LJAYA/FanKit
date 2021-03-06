//
//  NSDictionary+FanNull.m
//  FanKYUnity
//
//  Created by 向阳凡 on 16/7/28.
//  Copyright © 2016年 凡向阳. All rights reserved.
//

#import "NSDictionary+FanNull.h"




@implementation NSDictionary (FanNull)


-(id)fan_objectForKey:(id)aKey{
    id value=[self objectForKey:aKey];
    if ([value isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return value;
}
-(id)fan_objectForKey:(id)aKey type:(FanObject)objType{
    id value=[self objectForKey:aKey];
    if ([value isKindOfClass:[NSNull class]]||value==nil) {
        switch (objType) {
            case FanObjectString:
            {
                return @"";
            }
                break;
            case FanObjectNumber:
            {
                return @0;
            }
                break;
            case FanObjectArray:
            {
                return @[];
            }
                break;
            case FanObjectDictionary:
            {
                return @{};
            }
                break;
            default:
            {
                return nil;
            }
                break;
        }
    }
    return value;
}
-(BOOL)fan_boolForKey:(id)aKey{
    NSNumber *value=[self objectForKey:aKey];
    if([value isKindOfClass:[NSNumber class]]){
        return [value boolValue];
    }else if([value isKindOfClass:[NSString class]]){
        return [@([value integerValue]) boolValue];
    }
    return NO;
}
-(NSInteger)fan_integerForKey:(id)aKey{
    NSNumber *value=[self objectForKey:aKey];
    if([value isKindOfClass:[NSNumber class]]){
        return [value integerValue];
    }else if([value isKindOfClass:[NSString class]]){
        return [value integerValue];
    }
    return 0;
}
-(double)fan_doubleForKey:(id)aKey{
    NSNumber *value=[self objectForKey:aKey];
    if([value isKindOfClass:[NSNumber class]]){
        return [value doubleValue];
    }else if([value isKindOfClass:[NSString class]]){
        return [value doubleValue];
    }
    return 0.0f;
}
-(NSString *)fan_stringForKey:(id)aKey{
    NSString *value=[self objectForKey:aKey];
    if([value isKindOfClass:[NSString class]]){
        return value;;
    }
    return @"";
}
@end
