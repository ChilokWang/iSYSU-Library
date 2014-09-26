//
//  SLSetupViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/2/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLSetupViewController.h"
#import "XDKAirMenuController.h"
#import "AppCache.h"

@interface SLSetupViewController ()

@end

@implementation SLSetupViewController

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
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)menuButtonPressed:(id)sender
{
    XDKAirMenuController *menu = [XDKAirMenuController sharedMenu];
    
    if (menu.isMenuOpened)
        [menu closeMenuAnimated];
    else
        [menu openMenuAnimated];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            //提醒设置
            break;
        case 1:
            //意见反馈
            break;
        case 2:
            //关于我们
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"关于我们" message:@"成员: 黄祺乐、黎海灝、黎坤旻、陈宏彬" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
            break;
        case 3:
        {
            //清除缓存
            [AppCache clearCache];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"清除缓存成功" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
            break;
        default:
            break;
    }
}

@end
