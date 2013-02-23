//
//  Coordinate.m
//  echo
//
//  Created by Jinghan Xu on 2/22/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Coordinate.h"

@implementation Coordinate
@synthesize latitude;
@synthesize longtitude;

- (id)initWithLatitude:(double)latitude_ andLongtitude:(double)longtitude_ {
    self = [super init];
    if (self) {
        self.latitude = latitude_;
        self.longtitude = longtitude_;
    }
    return self;
}

@end
