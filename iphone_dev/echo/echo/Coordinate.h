//
//  Coordinate.h
//  echo
//
//  Created by Jinghan Xu on 2/22/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coordinate : NSObject
@property (nonatomic) double latitude;
@property (nonatomic) double longtitude;

- (id)initWithLatitude:(double)latitude_ andLongtitude:(double)longtitude_;

@end
