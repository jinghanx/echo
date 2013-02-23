//
//  UserData.h
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject

@property (nonatomic) int userId;
@property (nonatomic, retain) NSArray *friends;
@property (nonatomic, retain) NSDictionary *MessageHistory;

- (void)getUserDataFromServer:(NSString *)DeviceName;

@end
