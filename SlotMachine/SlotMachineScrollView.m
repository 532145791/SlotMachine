//
//  SlotMachineScrollView.m
//  老虎机
//
//  Created by 冷超 on 2017/6/19.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "SlotMachineScrollView.h"
#import <Masonry/Masonry.h>
@interface SlotMachineScrollView ()

@end

@implementation SlotMachineScrollView
{
    UIScrollView *_scrollView;
    CGFloat height;
    NSMutableArray *contentArr;
    CGFloat space;
    BOOL isScrolled;
    CGFloat contentOffSetY;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self);
    }];
}

-(void)setUpIcons{
    height = 40;
    space = 20;
    CGFloat width = _scrollView.frame.size.width;
    
    if (contentArr.count > 0) {
        [contentArr removeAllObjects];
    }
    
    if (contentArr == nil) {
        contentArr = [NSMutableArray array];
    }
    
    for (NSInteger i = 0; i < self.kTurn + 1; i ++) {
        [contentArr addObjectsFromArray:_iconArr];
    }
    
    for (NSInteger i = 0; i < contentArr.count; i ++) {
        @autoreleasepool {
            UIImageView *imgView = [UIImageView new];
            imgView.frame = CGRectMake(0, i * (height + space), width, height);
            imgView.contentMode = UIViewContentModeScaleAspectFit;
            NSInteger tmpIndex = i%_iconArr.count;
            imgView.image = [UIImage imageNamed:_iconArr[tmpIndex]];
            [_scrollView addSubview:imgView];
        }
    }
    [_scrollView setContentSize:CGSizeMake(0, contentArr.count * (height + space))];
    NSInteger index = arc4random()%(_iconArr.count - 1);
    [_scrollView setContentOffset:CGPointMake(0, index * (height + space) +(height + space)/2)];
}

-(void)scrollToIndex:(NSInteger)index{
    [UIScrollView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        if (isScrolled) {
            _scrollView.contentOffset = CGPointMake(0,  contentOffSetY + (height + space));
        }else{
            _scrollView.contentOffset = CGPointMake(0, _iconArr.count * (height + space));
        }
    } completion:^(BOOL finished) {
        [UIScrollView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _scrollView.contentOffset = CGPointMake(0, (contentArr.count - _iconArr.count * 2) * (height + space));
        } completion:^(BOOL finished) {
            [UIScrollView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                _scrollView.contentOffset = CGPointMake(0, (contentArr.count - _iconArr.count * 2) * (height + space) + (index + 1) * (height + space) - (height + space)/2);
            } completion:^(BOOL finished) {
                if (finished) {
                    _scrollView.contentOffset = CGPointMake(0,  (index + 1) * (height + space) - (height + space)/2);
                    contentOffSetY = _scrollView.contentOffset.y;
                    isScrolled = YES;
                }
            }];
        }];
    }];
}

@end
