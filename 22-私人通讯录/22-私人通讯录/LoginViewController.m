//
//  LoginViewController.m
//  22-私人通讯录
//
//  Created by linw on 16/8/20.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+MJ.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UISwitch *pwdswitch;

@property (weak, nonatomic) IBOutlet UISwitch *loginswitch;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@end

@implementation LoginViewController

- (IBAction)pwdSwitchChange:(UISwitch *)sender {
    if (!self.pwdswitch.isOn) {
        [self.loginswitch setOn:NO animated:YES];
    }
}

- (IBAction)loginSwitchChange:(id)sender {
    if (self.loginswitch.isOn) {
        [self.pwdswitch setOn:YES animated:YES];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //监听文本框文字改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
}
- (IBAction)loginBtn:(id)sender {
    if (![self.nameField.text isEqualToString:@"lw"]) {
        [MBProgressHUD showError:@"账号错误"];
        return;
    }
    if (![self.pwdField.text isEqualToString:@"123"]) {
        [MBProgressHUD showError:@"密码错误"];
        return;
    }

    [MBProgressHUD showMessage:@"正在登录..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        [self performSegueWithIdentifier:@"loginsegue" sender:nil];
    });
}

- (void)textChange{
    self.loginBtn.enabled = (self.nameField.text.length && self.pwdField.text.length);
}
@end
