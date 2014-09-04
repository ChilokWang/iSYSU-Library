//
//  SLAppointBookInfoCell.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-3.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBookInfoCell.h"

@interface SLAppointBookInfoCell : SLBookInfoCell
@property (weak, nonatomic) IBOutlet UILabel *deadline;        /* 预约有效期 */
@property (weak, nonatomic) IBOutlet UILabel *takeBookPlace;   /* 取书地点 */
@property (weak, nonatomic) IBOutlet UILabel *status;          /* 预约状态 */

@end
