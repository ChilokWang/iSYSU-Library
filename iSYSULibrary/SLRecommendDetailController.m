//
//  SLRecommendDetailController.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-26.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLRecommendDetailController.h"
#import "SLRecommendBook.h"
#import "SLRecDetailLabel.h"
#import "Constants.h"

@interface SLRecommendDetailController ()

@end

@implementation SLRecommendDetailController
{
    UIScrollView *scroll;
}
@synthesize detailView;

@synthesize bookName;
@synthesize bookId;
@synthesize bookAuthor;
@synthesize bookPress;
@synthesize recDate;
@synthesize recReason;
@synthesize proStatus;
@synthesize proDate;
@synthesize status;

@synthesize bookDic;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:kApplicationGrayColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self initScrollView];
    
    [self initBackgroundView];
    
    [self configureViewsWithDictionary:self.bookDic];
}

- (void)initScrollView
{
    CGRect screenFrame = [[UIScreen mainScreen] bounds];
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(screenFrame.origin.x,
                                                  screenFrame.origin.y,
                                                  screenFrame.size.width,
                                                  screenFrame.size.height)];
    scroll.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scroll.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scroll];
}

- (void)initBackgroundView
{
    CGRect bgFrame = CGRectMake(10, 20,scroll.frame.size.width - 20,0);

    detailView = [[UIView alloc] initWithFrame:bgFrame];
    [detailView setBackgroundColor:[UIColor whiteColor]];
    detailView.layer.shadowOpacity = 0.15;
    detailView.layer.shadowRadius = 1.0;
    detailView.layer.shadowOffset = CGSizeMake(1, 1 * tan(M_PI * 60/180));

    [scroll addSubview:detailView];
    
    [self initContentViewsWithWidth:bgFrame.size.width];
}

- (void)initContentViewsWithWidth:(CGFloat)bgWidth
{
    CGRect nameFrame = CGRectMake(10, 10, 280, 25);
    CGRect idFrame = CGRectMake(10, nameFrame.origin.y + nameFrame.size.height + 5,bgWidth - 20, 25);
    CGRect authorFrame = CGRectMake(10, idFrame.origin.y + idFrame.size.height + 5, bgWidth - 20, 25);
    CGRect pressFrame = CGRectMake(10, authorFrame.origin.y + authorFrame.size.height + 5, bgWidth - 20, 25);
    CGRect recDateFrame = CGRectMake(10, pressFrame.origin.y + pressFrame.size.height + 5, bgWidth - 20, 25);
    CGRect proDateFrame = CGRectMake(10, recDateFrame.origin.y + recDateFrame.size.height + 5, bgWidth - 20, 25);
    CGRect proStatusFrame = CGRectMake(10, proDateFrame.origin.y + proDateFrame.size.height + 5, bgWidth - 20, 25);
    CGRect statusFrame = CGRectMake(10, proStatusFrame.origin.y + proStatusFrame.size.height + 5, bgWidth - 20, 25);
    CGRect recReasonFrame = CGRectMake(10, statusFrame.origin.y + statusFrame.size.height + 5, bgWidth - 20, 25);
    
    bookName = [[SLRecDetailLabel alloc] initWithFrame:nameFrame];
    bookName.font = [UIFont fontWithName:@"System Bold" size:17.0];
    bookName.textColor = [UIColor blackColor];
    
    bookId = [[SLRecDetailLabel alloc] initWithFrame:idFrame];
    bookId.font = [UIFont fontWithName:@"System Bold" size:17.0];
    bookId.textColor = kApplicationGreenColor;
    
    bookAuthor = [[SLRecDetailLabel alloc] initWithFrame:authorFrame];
    
    bookPress = [[SLRecDetailLabel alloc] initWithFrame:pressFrame];
    
    recDate = [[SLRecDetailLabel alloc] initWithFrame:recDateFrame];
    
    proDate = [[SLRecDetailLabel alloc] initWithFrame:proDateFrame];
    
    proStatus = [[SLRecDetailLabel alloc] initWithFrame:proStatusFrame];
    
    status = [[SLRecDetailLabel alloc] initWithFrame:statusFrame];
    
    recReason = [[SLRecDetailLabel alloc] initWithFrame:recReasonFrame];
    
    [detailView addSubview:bookName];
    [detailView addSubview:bookId];
    [detailView addSubview:bookAuthor];
    [detailView addSubview:bookPress];
    [detailView addSubview:recDate];
    [detailView addSubview:proDate];
    [detailView addSubview:proStatus];
    [detailView addSubview:status];
    [detailView addSubview:recReason];
}

- (void)configureViewsWithDictionary:(NSDictionary *)dic
{
    NSLog(@"%@", dic[@"bookName"]);
    bookName.text = [NSString stringWithFormat: @"书名: %@", dic[@"bookName"]];
    bookId.text = [NSString  stringWithFormat: @"Id: %@", dic[@"bookId"]];
    bookAuthor.text = [NSString stringWithFormat: @"作者: %@", dic[@"bookAuthor"]];
    bookPress.text = [NSString stringWithFormat: @"出版社: %@", dic[@"bookPress"]];
    recDate.text = [NSString stringWithFormat: @"荐购日期: %@", dic[@"recommendDate"]];
    proDate.text = [NSString stringWithFormat: @"处理日期: %@", dic[@"processingDate"]];
    proStatus.text = [NSString stringWithFormat:@"处理状态: %@", dic[@"processingStatus"]];
    recReason.text = [NSString stringWithFormat:@"推荐理由: %@", dic[@"recommendReason"]];
    
    if([dic[@"status"] intValue] == 0)
        status.text = @"订购状态: 已订购";
    else if([dic[@"status"] intValue] == 1)
        status.text = @"订购状态: 未订购";

    [self adjustFrameForViews];
}

- (void)adjustFrameForViews
{
    [recReason sizeToFit];
    
    CGRect newFrame = detailView.frame;
    for(UIView *v in detailView.subviews)
    {
        newFrame.size.height += v.frame.size.height + 5;
    }
    newFrame.size.height += 20;
    [detailView setFrame:newFrame];
    
    CGSize scrollSize = detailView.frame.size;
    scrollSize.height += 40;
    scroll.contentSize = scrollSize;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
