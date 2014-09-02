//
//  SLLoginViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/1/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLLoginViewController.h"
#import "Constants.h"

@interface SLLoginViewController ()

@end

@implementation SLLoginViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureAppearence
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.usernameField.alpha = 0.0;
    self.passwordField.alpha = 0.0;
    self.loginButton.alpha = 0.0;
    self.usernameField.textColor = kApplicationBlackColor;
    self.passwordField.textColor = kApplicationBlackColor;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.usernameField.text = [userDefaults objectForKey:kUserName];
    self.passwordField.text = [userDefaults objectForKey:kPassword];
    [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionCurveEaseIn  animations:^{
        self.usernameField.alpha = 1.0;
        self.passwordField.alpha = 1.0;
        self.loginButton.alpha = 0.9;
    } completion:nil];
    
    [self.usernameField addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.passwordField addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
    [self textFieldDidChange];
}

- (void)textFieldDidChange
{
    if ([self.usernameField.text isEqualToString:@""] || [self.passwordField.text isEqualToString:@""]) {
        self.loginButton.enabled = false;
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.loginButton.titleLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        } completion:nil];
    }
    else {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.loginButton.titleLabel.textColor = [UIColor whiteColor];
//            self.loginButton.backgroundColor = kApplicationGreenColor;
        } completion:nil];
        self.loginButton.enabled = true;
    }
}

- (IBAction)loginButtonClicked:(id)sender
{
    [self backgroundClicked:nil];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.usernameField.text forKey:kUserName];
    [userDefaults setObject:self.passwordField.text forKey:kPassword];
    [userDefaults synchronize];
}

- (IBAction)backgroundClicked:(id)sender
{
    [self.usernameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

@end
