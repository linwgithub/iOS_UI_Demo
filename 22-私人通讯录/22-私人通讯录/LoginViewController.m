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

/**
 *  记住密码按钮开关状体变化
 *
 *  @param sender <#sender description#>
 */
- (IBAction)pwdSwitchChange:(UISwitch *)sender {
    if (!self.pwdswitch.isOn) {
        [self.loginswitch setOn:NO animated:YES];
    }
}

/**
 *  自动登录开关按钮状态变化
 *
 *  @param sender <#sender description#>
 */
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

/**
 *  在segue跳转前调用，通常在此方法了获取目标控制器并传递数据
 *
 *  @param segue  跳转时调用的segue对象
 *  @param sender 来自performSegueWithIdentifier: sender:方法中sender传递的内容。
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //获取目标控制器
    UIViewController *vc = segue.destinationViewController;
    //设置目标控制器的标题
    vc.title = [NSString stringWithFormat:@"%@的通讯录",self.nameField.text];
    
}
@end
