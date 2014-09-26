//
//  SLRecommendController.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-3.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLRecommendTableView;

@interface SLRecommendController : UIViewController <UITableViewDelegate>

@property (strong, nonatomic) SLRecommendTableView *recommendTable;

@end
