//
//  Message.m
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Message.h"

@implementation Message
@synthesize  content;
@synthesize sender;
@synthesize receiver;
@synthesize sendLocation;
@synthesize receiveLocation;


- (Message *)initWithContent:(NSString *)content_ {
    self = [super init];
    if (self) {
        self.content = content_;
        self.sender = nil;
        self.receiver = nil;
        self.sendLocation = nil;//[[Location instance] getLocation];
        self.receiveLocation = nil;//[[Location instance] getLocation];
    }
    return self;
}

@end
