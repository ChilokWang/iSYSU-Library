//
//  SLBorrowListTableView.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-16.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBorrowListTableView.h"
#import "SLBorrowCell.h"

@implementation SLBorrowListTableView
{
    UILabel *emptyHint;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        
        self.dataArray = [[NSArray alloc] init];
        
        CGRect emptyHintFrame = CGRectMake(0, 0, 320, 70);
        emptyHint = [[UILabel alloc] initWithFrame:emptyHintFrame];
        [emptyHint setBackgroundColor:[UIColor clearColor]];
        [emptyHint setText:[NSString stringWithFormat:@"借阅为空"]];
        [emptyHint setTextAlignment:NSTextAlignmentCenter];
        [emptyHint setFont:[UIFont fontWithName:@"Heiti" size:20.0]];
        [emptyHint setTextColor:[UIColor grayColor]];
        
        [self addSubview:emptyHint];
        
    }
    return self;
}

- (void)setDataArr:(NSArray *)dataArr
{
    self.dataArray = dataArr;
    NSLog(@"dataArr.count:%ld", self.dataArray.count);
    if(dataArr.count == 0)
    {
        [emptyHint setHidden:NO];
    }else
    {
        [emptyHint setHidden:YES];
    }
}

//- (void)setEmptyHintHidden:(BOOL)is
//{
//    [emptyHint setHidden:is];
//}

#pragma mark - UITableView data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return self.dataArray.count;
//        return 8;
    else
        return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    //列表使用重用机制
    NSString *cellIdentifier = [NSString stringWithFormat:@"BorrowingBookCell"];
    
    SLBorrowCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[SLBorrowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell configureWithData:self.dataArray[index]];
    return cell;
}



@end
