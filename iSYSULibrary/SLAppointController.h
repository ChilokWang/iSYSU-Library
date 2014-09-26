//
//  SLAppointController.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-3.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLAppointTableView;

@interface SLAppointController : UIViewController <UITableViewDelegate>

@property (strong, nonatomic) SLAppointTableView *appointTable;

@end
