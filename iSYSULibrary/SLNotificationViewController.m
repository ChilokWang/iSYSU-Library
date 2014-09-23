//
//  SLNotificationViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/17/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLNotificationViewController.h"

@interface SLNotificationViewController ()

@property (nonatomic, strong) NSArray *items;

@end

@implementation SLNotificationViewController

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
    [self configureNavigationBar];
    [self configurePickerView];
    [self configurePickerViewData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)configureNavigationBar
{
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"return"] style:UIBarButtonItemStyleDone target:self.navigationController action:@selector(popViewControllerAnimated:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}
 
- (void)configurePickerView
{
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
}

- (void)configurePickerViewData
{
    self.items = @[@"不提醒", @"每五天提醒一次", @"每十天提醒一次",@"每二十天提醒一次", @"每个月提醒一次"];
}

#pragma mark UIPickerView DataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.items.count;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}

- (UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [self.items objectAtIndex:row];
    return label;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 20;
}
@end
