//
//  EditViewViewController.m
//  22-私人通讯录
//
//  Created by linw on 16/8/21.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "EditViewViewController.h"

@interface EditViewViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBtn;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@end

@implementation EditViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameField.text = self.contact.name;
    self.phoneField.text = self.contact.phone;
    // Do any additional setup after loading the view.
}

- (IBAction)editClick:(id)sender
{
    if (self.nameField.enabled) {
        self.nameField.enabled = NO;
        self.phoneField.enabled = NO;
        self.nameField.text = self.contact.name;
        self.phoneField.text = self.contact.phone;
        [self.view endEditing:YES];
        self.saveBtn.hidden = YES;
        self.editBtn.title = @"编辑";
    }else{
        self.nameField.enabled = true;
        self.phoneField.enabled = true;
        [self.phoneField becomeFirstResponder];
        self.saveBtn.hidden = NO;
        self.editBtn.title = @"取消";
    }
    
}


- (IBAction)saveClick:(id)sender {
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
