//
//  SBOneViewController.m
//  20-导航控制器
//
//  Created by 林威 on 16/8/19.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "SBOneViewController.h"

@interface SBOneViewController ()

@end

@implementation SBOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"SBO 加载完成");
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"SBO 即将出现");
}

- (void)viewDidAppear:(BOOL)animated{
   NSLog(@"SBO 已经出现");
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"SBO 即将消失");
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"SBO 已经消失");
}

- (void)dealloc{
    NSLog(@"SBO 已销毁");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
