//
//  User.h
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface User : NSObject

@property (nonatomic) int userId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *greeting;
@property (nonatomic, retain) NSArray *friends;

@end
