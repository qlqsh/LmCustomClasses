//
//  HSTableView.m
//  SupportHorizontalScrollUITableView
//
//  Created by 刘明 on 16/8/27.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "HSTableView.h"
#import "HSTableViewCell.h"

static NSString *cellIdentifier = @"HorizontalScrollCell";

@implementation HSTableView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self registerClass:[HSTableViewCell class] forCellReuseIdentifier:cellIdentifier];
        self.dataSource = self;
        self.delegate = self;
        self.bounces = NO;
    }

    return self;
}

#pragma mark - 数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    // 定制Cell

    return cell;
}

@end
