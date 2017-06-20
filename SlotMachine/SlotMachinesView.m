//
//  SlotMachinesView.m
//  老虎机
//
//  Created by 冷超 on 2017/6/19.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "SlotMachinesView.h"
#import "SlotMachineScrollView.h"
@implementation SlotMachinesView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    SlotMachineScrollView *slotScrollViewOne = [[SlotMachineScrollView alloc] initWithFrame:CGRectMake(0, 50, 50, 100)];
    slotScrollViewOne.kTurn = 5;
    slotScrollViewOne.iconArr = @[@"1",@"2",@"3",@"4"];
    slotScrollViewOne.backgroundColor = [UIColor redColor];
    [slotScrollViewOne setUpIcons];
    [self addSubview:slotScrollViewOne];
    
    SlotMachineScrollView *slotScrollViewTwo = [[SlotMachineScrollView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(slotScrollViewOne.frame) + 10, 50, 50, 100)];
    slotScrollViewTwo.kTurn = 5;
    slotScrollViewTwo.iconArr = @[@"1",@"2",@"3",@"4"];
    slotScrollViewTwo.backgroundColor = [UIColor blueColor];
    [slotScrollViewTwo setUpIcons];
    [self addSubview:slotScrollViewTwo];
    
    SlotMachineScrollView *slotScrollViewThree = [[SlotMachineScrollView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(slotScrollViewTwo.frame) + 10, 50, 50, 100)];
    slotScrollViewThree.kTurn = 5;
    slotScrollViewThree.iconArr = @[@"1",@"2",@"3",@"4"];
    slotScrollViewThree.backgroundColor = [UIColor purpleColor];
    [slotScrollViewThree setUpIcons];
    [self addSubview:slotScrollViewThree];
}

@end
