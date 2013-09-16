//
//  HttpUtil.h
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"
#import "Location.h"
#import "User.h"

@interface HttpUtil : NSObject

+ (NSDictionary *) sendMessage:(Message *)message; 
+ (NSDictionary *)pullUserFor:(NSString *)DeviceName;

@end

