//
//  ViewController.m
//  01-日期选择器
//
//  Created by 林威 on 16/8/1.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"
#import "LWKBToolBar.h"

@interface ViewController ()<LWKBToolBarDelegate>

@property (weak, nonatomic) IBOutlet UITextField *topTextfile;

@property (strong, nonatomic) UIDatePicker *datePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datePicker = [[UIDatePicker alloc]init];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh"];
    self.topTextfile.inputView = self.datePicker;
    
    LWKBToolBar *toolbar = [LWKBToolBar kbtoolbar];
    toolbar.kbDelegate = self;
    self.topTextfile.inputAccessoryView = toolbar;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)kbToolbar:(LWKBToolBar *)toolbar btndidClick:(UIBarButtonItem *)item{
    NSLog(@"xxx");
    NSDate *date = self.datePicker.date;
    NSLog(@"%@",date);
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    dateFormat.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [dateFormat stringFromDate:date];
    self.topTextfile.text = dateStr;
}

@end
