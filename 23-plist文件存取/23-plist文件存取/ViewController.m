//
//  ViewController.m
//  23-plist文件存取
//
//  Created by linw on 16/8/28.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)saveData:(id)sender
{
    //1、获得沙盒文件根路径
    NSString *home = NSHomeDirectory();
    NSLog(@"home directory: %@",home);
    
    //2、获得Document路径
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    
    //新建数据
    //PS:plist只能存基本的数据类型
    NSArray *arrData = @[@"aa",@"bb",@"cc"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    
    [arrData writeToFile:filePath atomically:YES];
}

- (IBAction)readData:(id)sender {
    //1、获得沙盒文件根路径
    NSString *home = NSHomeDirectory();
    NSLog(@"home directory: %@",home);
    
    //2、获得Document路径
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    //3、文件路径
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    
    NSArray *dataArr = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%@",dataArr);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
