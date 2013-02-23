//
//  echoViewController.m
//  echo
//
//  Created by Jinghan Xu on 2/18/13.
//  Copyright (c) 2013 echo. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "echoViewController.h"
#import "User.h"
#import "Location.h"

@interface echoViewController()
@property (nonatomic, retain) User *curUser;
@property (nonatomic, assign) Location *curLocation;
@end

@implementation echoViewController
@synthesize textLabel;
@synthesize curUser;
@synthesize curLocation;

- (id)init {
    if (self=[super init]) {
        self.curUser = [[User alloc] init];
        self.curLocation = [Location instance];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewDidUnload
{
    [textLabel release], textLabel = nil;
    [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
- (IBAction)sendPressed:(id)sender {
    self.textLabel.text =[NSString stringWithFormat:@"%f, %f", [self.curLocation getCoordinate].latitude, [self.curLocation getCoordinate].longtitude];
}
- (IBAction)receivePressed:(id)sender {
    
}

@end
