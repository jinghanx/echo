//
//  EchoViewController.m
//  echo
//
//  Created by Jinghan Xu on 2/18/13.
//  Copyright (c) 2013 echo. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "EchoViewController.h"
#import "User.h"
#import "Location.h"
#import "FriendsViewController.h"
#import "HttpUtil.h"

#define METERS_PER_MILE 1609.344

@interface EchoViewController() 
@property (nonatomic, retain) User *curUser;
@property (nonatomic) CLLocationCoordinate2D curCoordinate;
@end

@implementation EchoViewController
@synthesize textLabel;
@synthesize mapView;
@synthesize curUser;
@synthesize curCoordinate;

- (id)init {
    if (self=[super init]) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.curUser = [[User alloc] init];
    self.textLabel.text = [NSString stringWithFormat:@"Latitude:%f   Longtitude:%f", self.curCoordinate.latitude, self.curCoordinate.longitude];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

- (void)viewWillAppear:(BOOL)animated {  
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(self.curCoordinate, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:viewRegion];                
    [mapView setRegion:adjustedRegion animated:YES];      
}

- (void)viewDidUnload
{
    [textLabel release], textLabel = nil;
    [self setMapView:nil];
    [super viewDidUnload];
}

- (CLLocationCoordinate2D)curCoordinate {
    return [[Location instance] getCoordinate];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)sendPressed:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)friendsPressed:(id)sender {
    //self.textLabel.text = [[HttpUtil pullUserFor:nil] objectForKey:@"friends"];
}

- (IBAction)tmpPressed:(id)sender {
    //NSLog(@"%@", [[HttpUtil pullUserFor:nil] objectForKey:@"locations"]);
}

- (void)dealloc {
    [mapView release];
    [super dealloc];
}

@end
