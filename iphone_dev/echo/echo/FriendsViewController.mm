//
//  FriendsViewController.m
//  echo
//
//  Created by Jinghan Xu on 2/24/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "FriendsViewController.h"
#import "FriendsTableView.h"
#import "FriendsTableViewCell.h"
#import "FooterView.h"
#import "HeaderView.h"
#import "MessageViewController.h"

@interface FriendsViewController ()

// View
@property (nonatomic, retain) FriendsTableView *friendsTableView;
@property (nonatomic, retain) HeaderView *headerView;
@property (nonatomic, retain) FooterView *footerView;
@property (nonatomic, retain) MessageViewController *messageViewController;
// Model
@property (nonatomic, retain) NSArray *friendsList;

@end

@implementation FriendsViewController
@synthesize friendsList;
@synthesize friendsTableView;
@synthesize footerView;
@synthesize headerView;
@synthesize messageViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        self.friendsList = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
        [self setupViews];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)setupHeaderView {
    self.headerView = [[[HeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)] autorelease];
    [self.view addSubview:self.headerView];
}

- (void)setupFooterView {
    self.footerView = [[[FooterView alloc] initWithFrame:CGRectMake(0, 450, 320, 30)] autorelease];
    [self.view addSubview:self.footerView];
}

- (void)setupFriendsTableView {
    self.friendsTableView = [[[FriendsTableView alloc] initWithFrame:CGRectMake(0, 30, 320, 420)] autorelease];
    [self.view addSubview:self.friendsTableView];
    self.friendsTableView.delegate = self;
    self.friendsTableView.dataSource = self;
}

- (void)setupViews {
    [self setupHeaderView];
    [self setupFriendsTableView];
    [self setupFooterView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.friendsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FRIENDS_TABLE_VIEW_CELL";
    FriendsTableViewCell *cell = (FriendsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FriendsTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.name.text = [self.friendsList objectAtIndex:indexPath.row];
    cell.profileImage.image = [UIImage imageNamed:@"profile_temp.jpg"];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.messageViewController = [[[MessageViewController alloc] init] autorelease];
    [self presentModalViewController:messageViewController animated:YES];
}

- (void)dealloc {
    [friendsList release], friendsList = nil;
    [friendsTableView release], friendsTableView = nil;
    [headerView release], headerView = nil;
    [super dealloc];
}
@end
