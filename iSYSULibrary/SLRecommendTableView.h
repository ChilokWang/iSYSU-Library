//
//  SLRecommendTableView.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-26.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLRecommendTableView : UITableView <UITableViewDataSource>

- (void)setDataArr:(NSMutableArray *)dataArr;

@end
