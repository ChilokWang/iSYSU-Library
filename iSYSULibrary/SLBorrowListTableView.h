//
//  SLBorrowListTableView.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-16.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLBorrowListTableView : UITableView <UITableViewDataSource>

- (void)setDataArr:(NSMutableArray *)dataArr;

@end
