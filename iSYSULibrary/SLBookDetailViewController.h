//
//  SLBookDetailViewController.h
//  iSYSULibrary
//
//  Created by Alaysh on 9/3/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//
/*
    NSArray *bookInfo =
    @[
        @[
            @{
                @"bookCoverImageUrl": @"2.png"
                @"bookName":  @"iOS 7",
                @"bookId":    @"TN929.53",
                @"bookAuthor":  @"刘一道著",
                @"bookPress":  @"机械工业出版社",
            }
        ],
        @[
            @{
                @"brief":  @"第一部分　基础篇第1章　开篇综述\n1.1　iOS概述\n1.1.1　iOS介绍\n1.1.2　iOS 6新特性\n1.2　开发环境及开发工具\n1.3　本书中的约定\n1.3.1　案例代码约定\n1.3.2　图示的约定　\n第2章　第一个iOS应用程序\n2.1　创建基于nib的HelloWorld工程"
            }
        ],
        @[
            @{
                @"单册状态":    @"外借本",
                @"应还日期":    @"在架上",
                @"分馆":       @"南校区中文流通",
                @"馆藏地":     @"南校区中文新书库（1楼）",
                @"架位":       @"TN929.53/245",
                @"请求数":     @"0",
            },
            @{
                @"单册状态":    @"外借本",
                @"应还日期":    @"在架上",
                @"分馆":       @"东校区中文流通",
                @"馆藏地":     @"东校区中文新书库（1楼）",
                @"架位":       @"TN929.53/245",
                @"请求数":     @"1"
            }
        ]
    ];
*/

#import <UIKit/UIKit.h>

@interface SLBookDetailViewController : UIViewController

@property (nonatomic, copy) UIImage *bookCoverImage;
@property (nonatomic, copy) NSArray *bookInfo;

@end
