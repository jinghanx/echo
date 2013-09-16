//
//  MessageViewController.m
//  echo
//
//  Created by Jinghan Xu on 2/24/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MessageViewController.h"
#import "HttpUtil.h"
#import "HeaderView.h"
#import "FooterView.h"

@interface MessageViewController ()
@property (nonatomic, retain) HeaderView *headerView;
@property (nonatomic, retain) FooterView *footerView;
@property (nonatomic, retain) UIButton *sendButton;
@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UITableView *historyTableView;

@end

@implementation MessageViewController
@synthesize headerView;
@synthesize footerView;
@synthesize sendButton;
@synthesize textField;
@synthesize historyTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupHeaderView {
    self.headerView = [[[HeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)] autorelease];
    [self.view addSubview:self.headerView];
}

- (void)setupHistoryTableView {
    self.historyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    //self.historyTableView
}
    
- (void)setupDialogView {
    self.sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.sendButton.frame = CGRectMake(100, 100, 80, 40);
    [self.sendButton setTitle:@"SEND" forState:UIControlStateNormal];
    [self.sendButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.sendButton];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(45, 30, 200, 40)];
    self.textField.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    self.textField.font = [UIFont fontWithName:@"Helvetica-Bold" size:25];
    self.textField.backgroundColor=[UIColor whiteColor];
    self.textField.text=@"Hello World";
    [self.view addSubview:self.textField];
}

- (void)setupFooterView {
    self.footerView = [[[FooterView alloc] initWithFrame:CGRectMake(0, 450, 320, 30)] autorelease];
    [self.view addSubview:self.footerView];
}

- (void)setupViews {
    [self setupHeaderView];
    [self setupHistoryTableView];
    [self setupDialogView];
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

- (void)goBack {
    [self.view endEditing:YES];
    //[self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
    [headerView release], headerView = nil;
    [footerView release], footerView = nil;
    [sendButton release], sendButton = nil;
    [textField release], textField = nil;
    [historyTableView release], historyTableView = nil;
    [super dealloc];
}
@end
