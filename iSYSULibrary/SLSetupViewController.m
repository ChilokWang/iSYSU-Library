//
//  SLSetupViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/2/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLSetupViewController.h"
#import "XDKAirMenuController.h"

@interface SLSetupViewController ()

@end

@implementation SLSetupViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            break;
        case 3:
        {
            //清除缓存
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            NSString *docDir=[paths objectAtIndex:0];
            NSString *path = [docDir stringByAppendingPathComponent:@"Cache"];       NSFileManager *fm = [NSFileManager defaultManager];
            if([fm fileExistsAtPath:path])
            {
                [fm removeItemAtPath:path error:nil];
            }
        }
            break;
        default:
            break;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
