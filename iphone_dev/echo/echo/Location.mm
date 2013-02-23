//
//  Location.m
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Location.h"

static Location *singletonInstance;

@interface Location() <CLLocationManagerDelegate>
@property (nonatomic,retain) CLLocationManager *locationManager;
@end

@implementation Location
@synthesize locationManager;

+ (Location *)instance {
    if (!singletonInstance) {
        singletonInstance = [[Location alloc] init];
        singletonInstance.locationManager = [[[CLLocationManager alloc] init] autorelease];
        singletonInstance.locationManager.delegate = singletonInstance;
        singletonInstance.locationManager.distanceFilter = kCLDistanceFilterNone;
        singletonInstance.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [singletonInstance.locationManager startUpdatingLocation];
    }
    return singletonInstance;
}

- (void)refresh {
    
}

- (Coordinate *)getCoordinate {
    return [[Coordinate alloc] initWithLatitude:self.locationManager.location.coordinate.latitude andLongtitude:self.locationManager.location.coordinate.longitude];
}

@end
