//
//  SLAppointBook.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-25.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBookBaseModel.h"

@interface SLAppointBook : SLBookBaseModel

@property (copy, nonatomic) NSString *validDate;    //预约有效期
@property (copy, nonatomic) NSString *meetDate;    //满足日期
@property (copy, nonatomic) NSString *reqStatus;    //请求状态
@property (copy, nonatomic) NSString *reqNum;    //在请求队列中的位置
@property (copy, nonatomic) NSString *place;    //取书地点

@end
