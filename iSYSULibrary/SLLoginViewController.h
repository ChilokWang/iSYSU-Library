//
//  SLLoginViewController.h
//  iSYSULibrary
//
//  Created by Alaysh on 9/1/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)loginButtonClicked:(id)sender;
- (IBAction)backgroundClicked:(id)sender;
@end
