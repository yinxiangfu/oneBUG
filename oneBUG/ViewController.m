//
//  ViewController.m
//  oneBUG
//
//  Created by yinxiangfu on 16/3/22.
//  Copyright © 2016年 xiangfu. All rights reserved.
//

#import "ViewController.h"
#import "TestTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    static NSString *strArr[] = {@"1",@"2",@"3",@"4"};
//    for (int i = 0; i < 5; i ++) {
//        NSString *str = strArr[i];
//        NSLog(@"%@", str);
//        if (i < 4) {
//            NSLog(@"%@",str);
//        }
//    }
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeSystem];
    bt.frame = CGRectMake(0, 0, 100, 40);
    bt.center = self.view.center;
    [bt setTitle:@"下一步" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
}

- (void)click
{
    TestTableViewController *ctr = [[TestTableViewController alloc] init];
    [self.navigationController pushViewController:ctr animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
