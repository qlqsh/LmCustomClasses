//
//  HSTableViewCell.h
//  SupportHorizontalScrollUITableView
//
//  Created by 刘明 on 16/8/27.
//  Copyright © 2016年 刘明. All rights reserved.
//

#define kCellScrollNotification @"cellScrollNotification"

#import <UIKit/UIKit.h>

@interface HSTableViewCell : UITableViewCell <UIScrollViewDelegate>
NS_ASSUME_NONNULL_BEGIN
@property (nonatomic, strong) UIScrollView *cellScrollView;
@property (nonatomic) BOOL isNotification; // 辨别自己与其它Cell
@property (nonatomic, strong) NSNotification *notification;
NS_ASSUME_NONNULL_END
@end
