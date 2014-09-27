//
//  SLBorrowListTableView.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-16.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLBorrowListTableView : UITableView <UITableViewDataSource>

@property (strong, nonatomic) NSArray *dataArray;

- (void)setDataArr:(NSArray *)dataArr;

- (void)setEmptyHintText:(NSString *)text;
//- (void)setEmptyHintHidden:(BOOL)is;

@end
