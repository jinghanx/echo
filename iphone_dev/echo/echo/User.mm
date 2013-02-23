//
//  User.m
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "User.h"
#import "UserData.h"

@interface User()
@property (nonatomic, retain) UserData *userDataInstance;
@end

@implementation User
@synthesize userDataInstance;

- (id)init {
    self = [super init];
    if (self) {
        self.userDataInstance = [[[UserData alloc] init] autorelease];
        [self.userDataInstance getUserDataFromServer:[UIDevice currentDevice].name];
    }
    return self;
}


@end
