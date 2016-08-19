//
//  ThereViewController.m
//  20-导航控制器
//
//  Created by 林威 on 16/8/19.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ThereViewController.h"

@interface ThereViewController ()

@end

@implementation ThereViewController
- (IBAction)gotoRootView:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置自定义的返回按钮
    //ps：自定义图片的返回按钮只能设置为在下一个控制器的导航栏的左边按钮
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 46, 31)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_back_normal" ]forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_back_selected"] forState:UIControlStateSelected];
    [backBtn addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *cusBackItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = cusBackItem;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)backView{
    [self.navigationController popViewControllerAnimated:YES];
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
