//
//  SlotMachinesView.m
//  老虎机
//
//  Created by 冷超 on 2017/6/19.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "SlotMachinesView.h"
#import "SlotMachineScrollView.h"
#import <Masonry/Masonry.h>
@implementation SlotMachinesView
{
    SlotMachineScrollView *slotScrollViewOne;
    SlotMachineScrollView *slotScrollViewTwo;
    SlotMachineScrollView *slotScrollViewThree;
    NSInteger oneIndex ;
    NSInteger twoIndex ;
    NSInteger threeIndex ;
    NSArray *iconArray;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    iconArray = @[@"1",@"2",@"3",@"4"];
    
    //第一列
    slotScrollViewOne = [[SlotMachineScrollView alloc] init];
    slotScrollViewOne.kTurn = 5;
    slotScrollViewOne.iconArr = iconArray;
    [self addSubview:slotScrollViewOne];
    [slotScrollViewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.equalTo(self);
    }];
    
    //第二列
    slotScrollViewTwo = [[SlotMachineScrollView alloc] init];
    slotScrollViewTwo.kTurn = 5;
    slotScrollViewTwo.iconArr = iconArray;
    [self addSubview:slotScrollViewTwo];
    [slotScrollViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(slotScrollViewOne.mas_right).offset(10);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(50);   
        make.height.equalTo(self);
    }];
    
    //第三列
    slotScrollViewThree = [[SlotMachineScrollView alloc] init];
    slotScrollViewThree.kTurn = 5;
    slotScrollViewThree.iconArr = iconArray;
    [self addSubview:slotScrollViewThree];
    [slotScrollViewThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(slotScrollViewTwo.mas_right).offset(10);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.equalTo(self);
    }];
}

-(void)setupData{
    [slotScrollViewOne setUpIcons];
    [slotScrollViewTwo setUpIcons];
    [slotScrollViewThree setUpIcons];
}

-(void)beginScrollToWinning:(BOOL)isWinning{
    NSInteger index = 0;
    if (isWinning) {
        index = arc4random()%iconArray.count;
        oneIndex = index;
        twoIndex = index;
        threeIndex = index;
    }else{
        [self getThreeNoEqualCounts];
    }
    
    //第一组先滚动
    [slotScrollViewOne scrollToIndex:oneIndex];
    //延迟0.5s后 第二组开始滚动
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [slotScrollViewTwo scrollToIndex:twoIndex];
        //延迟0.5s后 第三组开始滚动
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC));
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [slotScrollViewThree scrollToIndex:threeIndex];
        });
    });
}

#pragma mark - 随机生成三个不相等的数字 [0,iconArray.count)
-(void)getThreeNoEqualCounts{
    oneIndex = arc4random()%iconArray.count;
    twoIndex = arc4random()%iconArray.count;
    threeIndex = arc4random()%iconArray.count;
    if (oneIndex == twoIndex && twoIndex == threeIndex) {
        [self getThreeNoEqualCounts];
    }
}

@end
