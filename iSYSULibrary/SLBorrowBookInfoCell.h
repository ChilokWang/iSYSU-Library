//
//  SLBorrowBookInfoCell.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-3.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBookInfoCell.h"

@interface SLBorrowBookInfoCell : SLBookInfoCell
@property (weak, nonatomic) IBOutlet UILabel *borrowDate;     /* 借书日期 */
@property (weak, nonatomic) IBOutlet UILabel *deadline;       /* 归还日期 */
@end
