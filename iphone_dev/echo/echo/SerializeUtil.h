//
//  SerializeUtil.h
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface SerializeUtil : NSObject
+ (NSString *) serializeUser:(id)instance;
@end
