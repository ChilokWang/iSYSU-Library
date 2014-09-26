//
//  SLRecommendTableView.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-26.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLRecommendTableView.h"
#import "SLRecommendCell.h"

@implementation SLRecommendTableView
{
    UILabel *emptyHint;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.separatorColor = UITableViewCellSeparatorStyleNone;
        self.dataSource = self;
        
        self.dataArray = [[NSMutableArray alloc] init];
        
        CGRect emptyHintFrame = CGRectMake(0, 0, 320, 70);
        emptyHint = [[UILabel alloc] initWithFrame:emptyHintFrame];
        [emptyHint setBackgroundColor:[UIColor clearColor]];
        [emptyHint setText:[NSString stringWithFormat:@"你目前没有荐购"]];
        [emptyHint setTextAlignment:NSTextAlignmentCenter];
        [emptyHint setFont:[UIFont fontWithName:@"Heiti" size:20.0]];
        [emptyHint setTextColor:[UIColor grayColor]];
        
        [self addSubview:emptyHint];
    }
    return self;
}

- (void)setDataArr:(NSMutableArray *)dataArr
{
    self.dataArray = dataArr;
    NSLog(@"dataArr.count:%ld", dataArr.count);
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
        return self.dataArray.count;
//        return 8;
    else
        return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    //列表使用重用机制
    NSString *cellIdentifier = [NSString stringWithFormat:@"RecommendBookCell"];
    
    SLRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[SLRecommendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

@end
