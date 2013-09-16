//
//  SerializeUtil.m
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "SerializeUtil.h"

@implementation SerializeUtil

+ (NSData *)serialize:(id)instance forKey:(NSString *)key{
    NSError *error;
    return [NSJSONSerialization dataWithJSONObject:[NSDictionary dictionaryWithObject:instance forKey:key] options:NSJSONWritingPrettyPrinted error:&error];
}

+ (NSDictionary *)deSerialize:(NSData *)response {
    NSError *error;
    if (response) {
        NSDictionary *ret = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&error];
        return ret;
    }
    return nil;
}
@end
