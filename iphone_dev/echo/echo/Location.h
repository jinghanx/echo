//
//  Location.h
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Location : NSObject

+ (Location *)instance;
- (CLLocation *)getLocation;
- (CLLocationCoordinate2D)getCoordinate;

@end
