//
//  SLCollectionViewController.h
//  iSYSULibrary
//
//  Created by Alaysh on 9/2/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLBookView;

typedef enum {
    UIModalTransitionStyleOpenBooks = 0x01 << 0,
} UIModalTransitionStyleCustom;

@interface SLCollectionViewController : UICollectionViewController
{
    @protected SLBookView *_bookView;
}
@end
