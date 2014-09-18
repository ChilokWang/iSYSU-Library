//
//  SLHistoryCell.h
//  iSYSULibrary
//
//  Created by Alaysh on 14-9-18.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLHistoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *borDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *borTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthorLabel;
@end
