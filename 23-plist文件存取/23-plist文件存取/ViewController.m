//
//  ViewController.m
//  23-plist文件存取
//
//  Created by linw on 16/8/28.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)saveData:(id)sender
{
    //    [self saveByPreferences];
    [self saveByCoding];
}

- (IBAction)readData:(id)sender {
    //    [self readByPreferences];
    [self readByCoding];
}

/**
 *  通过plist保存数据
 */
- (void)saveByPlist
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
    //参数：
    //1、文件路径
    //2、原子操作，保证数据安全
    
}

/**
 *  读取plist数据
 */
- (void)readByPlist
{
    //1、获得沙盒文件根路径
    NSString *home = NSHomeDirectory();
    NSLog(@"home directory: %@",home);
    
    //2、获得Document路径
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    //3、文件路径
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    //4、读取数据
    NSArray *dataArr = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%@",dataArr);
    
}

- (void)saveByPreferences
{
    //1、获取NSUserDefaults对象，
    //通过NSUserDefaults对象可以直接操作软件的偏好设置（Library/Preferances）
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //2、存储数据
    [defaults setObject:@"lw" forKey:@"user"];
    [defaults setObject:@"abc" forKey:@"pwd"];
    [defaults setInteger:123 forKey:@"number"];
    [defaults setBool:YES forKey:@"ismale"];
    
    //3、立刻同步，避免数据出错
    [defaults synchronize];
}

- (void)readByPreferences
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *user = [defaults objectForKey:@"user"];
    NSString *pwd = [defaults objectForKey:@"pwd"];
    NSInteger number = [defaults integerForKey:@"number"];
    
    
    NSLog(@"\nuser:%@\npwd:%@\nnumber:%ld\n",user,pwd,(long)number);
}

/**
 *  通过coding归档文件
 */
- (void)saveByCoding
{
    NSString *path = @"/Users/linw/Desktop/codingfile/person.data";
//    Person *p = [[Person alloc]init];
//    p.name = @"linw";
//    p.age = 110;
//    
//    [NSKeyedArchiver archiveRootObject:p toFile:path];
    Student *s = [[Student alloc]init];
    s.name = @"ly";
    s.age = 18;
    s.num = 2013;
    
    [NSKeyedArchiver archiveRootObject:s toFile:path];
}

/**
 *  通过coding读档
 */
- (void)readByCoding
{
    NSString *path = @"/Users/linw/Desktop/codingfile/person.data";
//    Person *p =[NSKeyedUnarchiver unarchiveObjectWithFile:path];
//    NSLog(@"name:%@,age:%d",p.name,p.age);
    Student *s = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog(@"name:%@,age:%d,num:%d",s.name,s.age,s.num);
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
