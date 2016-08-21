//
//  AddContactViewController.m
//  22-私人通讯录
//
//  Created by linw on 16/8/21.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "AddContactViewController.h"

@interface AddContactViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *numberField;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation AddContactViewController
- (IBAction)addContact:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    if ([self.delegate respondsToSelector:@selector(addContactWithController:withContact:)]) {
        Contact *contact = [[Contact alloc] init];
        contact.name = self.nameField.text;
        contact.phone = self.numberField.text;
        [self.delegate addContactWithController:self withContact:contact];
    }
//    if ([self.delegate respondsToSelector:@selector(addContactWithController:withContactName:phone:)]) {
//        [self.delegate addContactWithController:self withContactName:self.nameField.text phone:self.numberField.text];
//    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加文本监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.numberField];
    
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.nameField becomeFirstResponder];
}

- (void)textChange
{
    self.addBtn.enabled = (self.nameField.text.length && self.numberField.text.length);
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
