//
//  LoginViewController.m
//  22-私人通讯录
//
//  Created by linw on 16/8/20.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "LoginViewController.h"

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
        self.loginswitch.on = NO;
    }
}

- (IBAction)loginSwitchChange:(id)sender {
    if (self.loginswitch.isOn) {
        self.pwdswitch.on = YES;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //监听文本框文字改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
}

- (void)textChange{
    self.loginBtn.enabled = (self.nameField.text.length && self.pwdField.text.length);
}
@end
