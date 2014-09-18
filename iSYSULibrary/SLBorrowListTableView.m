//
//  SLBorrowListTableView.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-16.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBorrowListTableView.h"
#import "SLBorrowCell.h"

#define CELL_HIGHT 100

@implementation SLBorrowListTableView
{
    UILabel *emptyHint;
    NSMutableArray *dataArr;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        self.delegate = self;
        
        dataArr = [[NSMutableArray alloc] init];
        
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

- (void)setDataArr:(NSMutableArray *)dataArray
{
    self.dataArr = dataArray;
    if(dataArr.count == 0)
    {
        [emptyHint setHidden:YES];
    }else
    {
        [emptyHint setHidden:NO];
    }
}

#pragma mark - UITableView data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return dataArr.count;
    else
        return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //列表使用重用机制
    NSString *cellIdentifier = [NSString stringWithFormat:@"Cell"];
    
    SLBorrowCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[SLBorrowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    return cell;
}

#pragma mark - UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_HIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
