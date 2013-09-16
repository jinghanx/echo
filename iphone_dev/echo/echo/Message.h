//
//  Message.h
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Location.h"

@interface Message : NSObject
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) User *sender;
@property (nonatomic, retain) User *receiver;
@property (nonatomic, retain) CLLocation *sendLocation;
@property (nonatomic, retain) CLLocation *receiveLocation;

- (Message *)initWithContent:(NSString *)content_;
@end
