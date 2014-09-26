//
//  SLAppointCell.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-4.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLBookCell.h"

@interface SLAppointCell : SLBookCell
@property (strong, nonatomic) UILabel *validDate;        /* 预约有效期 */
@property (strong, nonatomic) UILabel *status;          /* 预约状态 */

@end
