//
//  SLBookInfoCell.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-4.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLBookInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cover;    /* 书的封面 */
@property (weak, nonatomic) IBOutlet UILabel *name;         /* 书名 */
@property (weak, nonatomic) IBOutlet UIImageView *arrow;    /* 箭头 */

@end
