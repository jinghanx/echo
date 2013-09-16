//
//  Location.m
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Location.h"

static Location *singletonInstance = nil;

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

- (CLLocation *)getLocation {
    return self.locationManager.location;
}

- (CLLocationCoordinate2D)getCoordinate {
    return self.locationManager.location.coordinate;
}

@end
