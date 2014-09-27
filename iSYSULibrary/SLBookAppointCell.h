//
//  SLBookAppointCell.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-26.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBookBaseCell.h"

@interface SLBookAppointCell : SLBookBaseCell
@property (weak, nonatomic) IBOutlet UILabel *validDate;
@property (weak, nonatomic) IBOutlet UILabel *meetDate;
@property (weak, nonatomic) IBOutlet UILabel *reqStatus;
@property (weak, nonatomic) IBOutlet UILabel *reqNum;

@end
