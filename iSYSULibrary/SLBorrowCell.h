//
//  SLBorrowCell.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-4.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLBookCell.h"

@interface SLBorrowCell : SLBookCell

@property (strong, nonatomic) UILabel *borrowDate;     /* 借书日期 */
@property (strong, nonatomic) UILabel *deadline;       /* 归还日期 */

@end
