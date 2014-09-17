//
//  SLSearchViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/2/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLSearchViewController.h"
#import "Constants.h"

@interface SLSearchViewController ()

@end

@implementation SLSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureAppearence];
    [self configureTextField];
    [self configureSegmentedControl];
    [self configureSearchButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)configureAppearence
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"return"] style:UIBarButtonItemStyleDone target:self.navigationController action:@selector(popViewControllerAnimated:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)configureTextField
{
    self.textField.layer.borderColor = kApplicationGrayColor.CGColor;
}

- (void)configureSegmentedControl
{
    self.segmentedControl.tintColor = kApplicationGreenColor;
}

- (void)configureSearchButton
{
    CGRect frame = self.searchButton.frame;
    self.searchButton.layer.cornerRadius = frame.size.width/2.0;
    self.searchButton.backgroundColor = kApplicationGreenColor;
    self.searchButton.tintColor = [UIColor whiteColor];
}

- (IBAction)searchButtonPressed:(id)sender
{
    NSLog(@"SearchButton Pressed");
}

- (IBAction)segmentedControlPressed:(id)sender {
    NSLog(@"SegmentedControl Pressed");
}

- (IBAction)backgroundPressed:(id)sender {
    [self.textField resignFirstResponder];
}

#pragma mark - TextFieldDelegate

- (IBAction)textFieldDidEndOnExit:(id)sender {
    [self.textField resignFirstResponder];
    [self searchButtonPressed:nil];
}

@end
