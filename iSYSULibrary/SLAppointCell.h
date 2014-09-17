//
//  SLAppointCell.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-4.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLAppointCell : UITableViewCell
@property (strong, nonatomic) UILabel *deadline;        /* 预约有效期 */
@property (strong, nonatomic) UILabel *takeBookPlace;   /* 取书地点 */
@property (strong, nonatomic) UILabel *status;          /* 预约状态 */

@end
