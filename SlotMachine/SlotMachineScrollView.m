//
//  SlotMachineScrollView.m
//  老虎机
//
//  Created by 冷超 on 2017/6/19.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "SlotMachineScrollView.h"

@interface SlotMachineScrollView ()

@end

@implementation SlotMachineScrollView
{
    UIScrollView *_scrollView;
    CGFloat height;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
}

-(void)setUpIcons{
    height = _scrollView.frame.size.height;
    CGFloat width = _scrollView.frame.size.width;
    for (NSInteger i = 0; i < _iconArr.count * self.kTurn ; i ++) {
        UIImageView *view = [UIImageView new];
        view.frame = CGRectMake(0, i * height, width, height);
        view.contentMode = UIViewContentModeScaleAspectFit;
        if (i%_iconArr.count == 0) {
            view.image = [UIImage imageNamed:@"1"];
        }else if (i%_iconArr.count == 1){
            view.image = [UIImage imageNamed:@"2"];
        }else if (i%_iconArr.count == 2){
            view.image = [UIImage imageNamed:@"3"];
        }else if (i%_iconArr.count == 3){
            view.image = [UIImage imageNamed:@"4"];
        }
        [_scrollView addSubview:view];
    }
    [_scrollView setContentSize:CGSizeMake(0, _iconArr.count*height * self.kTurn)];
}

-(void)beginScroll{
    [_scrollView setContentOffset:CGPointMake(0, 0)];
    [UIScrollView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _scrollView.contentOffset = CGPointMake(0, self.iconArr.count*height*_kTurn * 0.1);
    } completion:^(BOOL finished) {
        [UIScrollView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _scrollView.contentOffset = CGPointMake(0, self.iconArr.count*height*_kTurn * 0.9);
        } completion:^(BOOL finished) {
            [UIScrollView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                _scrollView.contentOffset = CGPointMake(0, self.iconArr.count*height*_kTurn - height);
            } completion:^(BOOL finished) {
                
            }];
        }];
    }];
}

@end
