//
//  SLBorrowListController.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-11.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBorrowListController.h"
#import "XDKAirMenuController.h"
#import "SLBorrowListTableView.h"

@interface SLBorrowListController ()

@end

@implementation SLBorrowListController
{
    NSInteger listCount;
}
@synthesize borrowTable;

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
    
    CGRect borrowTableFrame = CGRectMake(0, 64, 320, 500);
    
    borrowTable = [[SLBorrowListTableView alloc] initWithFrame:borrowTableFrame];
    [self.view addSubview:borrowTable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation action
- (IBAction)menuButtonPressed:(id)sender
{
    XDKAirMenuController *menu = [XDKAirMenuController sharedMenu];
    
    if (menu.isMenuOpened)
        [menu closeMenuAnimated];
    else
        [menu openMenuAnimated];
}




@end
