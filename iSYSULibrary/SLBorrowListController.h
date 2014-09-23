//
//  SLBorrowListController.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-11.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLBorrowListTableView;

@interface SLBorrowListController : UIViewController <UITableViewDelegate>
{
    NSInteger listCount;
    BOOL _reloading;
    NSArray *_dataArray;
}

@property (strong, nonatomic) SLBorrowListTableView *borrowTable;

@end
