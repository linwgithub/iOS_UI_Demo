//
//  TwoViewController.m
//  20-导航控制器
//
//  Created by 林威 on 16/8/19.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "TwoViewController.h"
#import "ThereViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController
- (IBAction)gobackView:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)enterThereView:(id)sender {
    [self.navigationController pushViewController:[[ThereViewController alloc]init] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
