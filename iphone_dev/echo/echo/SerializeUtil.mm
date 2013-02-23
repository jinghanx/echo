//
//  SerializeUtil.m
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "SerializeUtil.h"

@implementation SerializeUtil

+ (NSString *) serializeUser:(id)instance {
    return [instance description];
}

@end
