//
//  HSTableViewCell.m
//  SupportHorizontalScrollUITableView
//
//  Created by 刘明 on 16/8/27.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "HSTableViewCell.h"

@implementation HSTableViewCell

#pragma mark - 单元视图生命周期
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createCellView];
    }

    return self;
}

// 单元的内容视图是个滚动视图
- (void)createCellView {
    // 滚动视图设置
    CGRect screen = [UIScreen mainScreen].bounds;
    _cellScrollView = [[UIScrollView alloc] initWithFrame:screen];
    _cellScrollView.contentSize = CGSizeMake(screen.size.width * 4, self.bounds.size.height);
    _cellScrollView.delegate = self;
    _cellScrollView.bounces = NO;                        // 不能弹动
    _cellScrollView.directionalLockEnabled = YES;        // 定向锁定
    _cellScrollView.showsHorizontalScrollIndicator = NO; // 隐藏水平滚动条
    [self.contentView addSubview:_cellScrollView];

    // 自由定制内容
    NSArray *strings = @[ @"标题", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0" ];
    float textLabelWidth = _cellScrollView.contentSize.width / (strings.count);
    float textLabelPositionX = _cellScrollView.contentSize.width - textLabelWidth;
    // 从右到左依次建立标签
    for (NSInteger i = strings.count - 1; i >= 0; i--) {
        NSString *text = strings[i];
        UILabel *textLabel = [[UILabel alloc]
            initWithFrame:CGRectMake(textLabelPositionX, 0.0f, textLabelWidth, self.bounds.size.height)];
        [_cellScrollView addSubview:textLabel];

        // 标签属性设置
        textLabel.layer.borderColor = kRGBAColor(3, 3, 3, 0.3).CGColor;
        textLabel.layer.borderWidth = 0.5f;
        textLabel.backgroundColor = [UIColor whiteColor];
        textLabel.text = text;
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabelPositionX -= textLabelWidth;
    }

    // 注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(scrollMove:)
                                                 name:kCellScrollNotification
                                               object:nil];
}

- (void)scrollMove:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    NSObject *object = notification.object;
    float offsetX = [userInfo[@"offsetX"] floatValue];
    if (object != self) {
        _isNotification = YES;
        // 为了所有单元同步移动，所以不能有动画效果。
        [_cellScrollView setContentOffset:CGPointMake(offsetX, 0.0f) animated:NO];
    } else {
        _isNotification = NO;
    }
    object = nil;
}

#pragma mark - UIScrollViewDelegate
// 有没有这个无所谓，效果没区别。但逻辑上应该存在。也就是说我正要移动当前单元格，所以这不是通知，是我手动。
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _isNotification = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!_isNotification) {
        // 发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:kCellScrollNotification
                                                            object:self
                                                          userInfo:@{
                                                              @"offsetX" : @(scrollView.contentOffset.x)
                                                          }];
    }

    NSArray *views = scrollView.subviews;
    UIView *first = views.lastObject;
    CGRect frame = first.frame;
    frame.origin.x = scrollView.contentOffset.x;
    first.frame = frame;
    _isNotification = NO;
}

@end
