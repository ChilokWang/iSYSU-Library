//
//  SLRecommendBookInfoCell.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-3.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBookInfoCell.h"

@interface SLRecommendBookInfoCell : SLBookInfoCell
@property (weak, nonatomic) IBOutlet UILabel *reason;     /* 荐购理由 */
@property (weak, nonatomic) IBOutlet UILabel *status;     /* 荐购状态 */

@end
