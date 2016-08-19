//
//  WithXibViewController.m
//  19-创建控制器
//
//  Created by 林威 on 16/8/19.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "WithXibViewController.h"

@interface WithXibViewController ()

@end

@implementation WithXibViewController

//控制器加载view时调用该方法
/**
 *  初始化控制器的view
 *  调用时间：使用self.view时如果view不存在则会调用该方法去加载控制器的view；
 */
- (void)loadView{
    //如果实现了该方法那么控制器的view会按照该方法中的要求实现view
    //通常在此处做一下自定义View的操作
    
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
