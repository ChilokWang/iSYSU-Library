//
//  SLBookDistributionCell.h
//  iSYSULibrary
//
//  Created by Alaysh on 9/3/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLBookBaseCell.h"

@interface SLBookDistributionCell : SLBookBaseCell
@property (weak, nonatomic) IBOutlet UILabel *bookStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *dueDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *branchLabel;
@property (weak, nonatomic) IBOutlet UILabel *rackPositionLabel;
@property (weak, nonatomic) IBOutlet UILabel *requestLabel;

@end
