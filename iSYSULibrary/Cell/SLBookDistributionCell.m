//
//  SLBookDistributionCell.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/3/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLBookDistributionCell.h"

@implementation SLBookDistributionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SLBookDistributionCell" owner:self options:nil];
        self = (SLBookDistributionCell *)[nib objectAtIndex:0];
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    frame.origin.x += 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}

- (void)configureWithDictionary:(NSDictionary *)dic
{
    self.bookStateLabel.text = dic[@"bookState"];
    self.dueDateLabel.text = dic[@"dueDate"];
    self.branchLabel.text = dic[@"branch"];
    self.rackPositionLabel.text = dic[@"rackPosition"];
    self.requestLabel.text = dic[@"requests"];
}

@end
