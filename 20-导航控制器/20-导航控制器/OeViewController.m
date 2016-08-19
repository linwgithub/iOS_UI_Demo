//
//  OeViewController.m
//  20-导航控制器
//
//  Created by 林威 on 16/8/19.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "OeViewController.h"
#import "TwoViewController.h"
@interface OeViewController ()

@end

@implementation OeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏按钮使用
    
    //1、设置标题
    //使用当前控制器的navigationItem属性设置
    self.navigationItem.title = @"第一个控制器";
    
    //2、设置导航栏左右两边按钮
    //2.1、创建导航栏按钮
    UIBarButtonItem *oneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    UIBarButtonItem *twoItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:nil action:nil];
    
    //3.1、设置单个导航栏按钮
    //self.navigationItem.leftBarButtonItem = oneItem;
    self.navigationItem.rightBarButtonItem = oneItem;
    //3.2、设置多个导航栏按钮
    self.navigationItem.leftBarButtonItems = @[oneItem,twoItem];
    // Do any additional setup after loading the view from its nib.
    
    //4、设置返回按钮
    //ps：返回按钮会显示在下一个控制器导航栏的左边
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回上一个控制器" style:UIBarButtonSystemItemEdit target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
}
- (IBAction)gotoNextView:(id)sender {
    TwoViewController *two = [[TwoViewController alloc]init];;
    [self.navigationController pushViewController:two animated:YES];
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
