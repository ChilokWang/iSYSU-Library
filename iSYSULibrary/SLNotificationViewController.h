//
//  SLNotificationViewController.h
//  iSYSULibrary
//
//  Created by Alaysh on 9/17/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLNotificationViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end
