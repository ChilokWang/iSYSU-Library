//
//  SLBookCell.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-24.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLBookCell : UITableViewCell

@property (strong, nonatomic) UIImageView *cover;      /* 书的封面 */
@property (strong, nonatomic) UILabel *name;           /* 书名 */

@end
