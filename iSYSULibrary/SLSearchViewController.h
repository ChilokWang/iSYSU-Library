//
//  SLSearchViewController.h
//  iSYSULibrary
//
//  Created by Alaysh on 9/2/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLSearchViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end
