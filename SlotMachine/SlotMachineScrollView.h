//
//  SlotMachineScrollView.h
//  老虎机
//
//  Created by 冷超 on 2017/6/19.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlotMachineScrollView : UIView
@property (strong , nonatomic) NSArray *iconArr;
@property NSInteger kTurn;//转数
-(void)setUpIcons;
@end
