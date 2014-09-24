//
//  SLRecommendCell.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-4.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLBookCell.h"

@interface SLRecommendCell : SLBookCell
@property (strong, nonatomic) UILabel *reason;     /* 荐购理由 */
@property (strong, nonatomic) UILabel *status;     /* 荐购状态 */

@end
