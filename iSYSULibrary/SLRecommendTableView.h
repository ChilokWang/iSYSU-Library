//
//  SLRecommendTableView.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-26.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLRecommendTableView : UITableView <UITableViewDataSource>

@property (strong, nonatomic) NSArray *dataArray;

- (void)setDataArr:(NSArray *)dataArr;

//- (void)setEmptyHintHidden:(BOOL)is;
@end
