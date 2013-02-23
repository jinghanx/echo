//
//  Location.h
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Coordinate.h"

@interface Location : NSObject

+ (Location *)instance;
- (Coordinate *)getCoordinate;

@end
