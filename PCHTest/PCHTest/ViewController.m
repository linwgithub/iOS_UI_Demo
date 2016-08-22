//
//  ViewController.m
//  PCHTest
//
//  Created by 林威 on 16/8/11.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获得UIApplication对象
    UIApplication *app = [UIApplication sharedApplication];
    //设置网络状态
    app.networkActivityIndicatorVisible = !app.networkActivityIndicatorVisible;
    //设置icon的badge
    app.applicationIconBadgeNumber = 50;
    //设置状态栏属性
    app.statusBarStyle = UIStatusBarStyleLightContent;

}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
