//
//  SLMenuViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/2/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLMenuViewController.h"
#import "UIImageView+LBBlurredImage.h"

@interface SLMenuViewController () <XDKAirMenuDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SLMenuViewController

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

    [self.backgroundView setImageToBlur:[UIImage imageNamed:@"background"] blurRadius:kLBBlurredImageDefaultBlurRadius completionBlock:^{
    }];
    
    self.airMenuController = [XDKAirMenuController sharedMenu];
    self.airMenuController.airDelegate = self;
    
    [self.view addSubview:self.airMenuController.view];
    [self addChildViewController:self.airMenuController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"TableViewSegue"])
    {
        self.tableView = ((UITableViewController*)segue.destinationViewController).tableView;
    }
}

#pragma mark - XDKAirMenuDelegate

- (UIViewController*)airMenu:(XDKAirMenuController*)airMenu viewControllerAtIndexPath:(NSIndexPath*)indexPath
{
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *vc = nil;
    
    vc.view.autoresizesSubviews = TRUE;
    vc.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    if (indexPath.row == 0)
        vc = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    else if (indexPath.row == 1)
        vc = [storyboard instantiateViewControllerWithIdentifier:@"LendingViewController"];
    else if (indexPath.row == 2)
        vc = [storyboard instantiateViewControllerWithIdentifier:@"ReservationViewController"];
    else if (indexPath.row == 3)
        vc = [storyboard instantiateViewControllerWithIdentifier:@"RecommendViewController"];
    else if (indexPath.row == 4)
        vc = [storyboard instantiateViewControllerWithIdentifier:@"LendngHisViewController"];
    else if (indexPath.row == 5)
        vc = [storyboard instantiateViewControllerWithIdentifier:@"SetupViewController"];
    
    return vc;
}

- (UITableView*)tableViewForAirMenu:(XDKAirMenuController*)airMenu
{
    return self.tableView;
}

@end
