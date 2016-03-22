//
//  TestTableViewController.m
//  oneBUG
//
//  Created by yinxiangfu on 16/3/22.
//  Copyright © 2016年 xiangfu. All rights reserved.
//

#import "TestTableViewController.h"

@implementation TestTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"one"];
}

#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"one"];

#warning 数组越界，用Xcode在模拟器和真机上跑都不会崩溃，发布到线上通过AppStore下载后就会崩溃（可以用Instrument跑也会崩溃，Instrument差不多是最接近真实环境了）
/*
 问题出现情景：发布 零钱罐 上线下载后，点击一个按钮闪退
 */
    static NSString* strArr[] = {@"1",@"2",@"3",@"4"};
    cell.textLabel.text = strArr[indexPath.row];
    
    if (indexPath.row > 3) {
        static NSString *cellID = @"cellID";
        UITableViewCell *cellOther = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cellOther) {
            cellOther = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cellOther.textLabel.text = [NSString stringWithFormat:@"---%ld---", (long)indexPath.row+1];
        return cellOther;
    }
    
    return cell;
}
@end
