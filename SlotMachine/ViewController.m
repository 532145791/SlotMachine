//
//  ViewController.m
//  SlotMachine
//
//  Created by 冷超 on 2017/6/19.
//  Copyright © 2017年 lengchao. All rights reserved.
//

#import "ViewController.h"
#import "SlotMachinesView.h"
#import <Masonry/Masonry.h>
@interface ViewController ()
{
    SlotMachinesView *slotView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    slotView = [[SlotMachinesView alloc] init];
    [self.view addSubview:slotView];
    [slotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(50);
        make.top.mas_equalTo(50);
        make.width.mas_equalTo(170);
        make.height.mas_equalTo(100);
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [slotView setupData];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [slotView beginScrollToWinning:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
