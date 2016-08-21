//
//  ContactsTableViewController.m
//  22-私人通讯录
//
//  Created by linw on 16/8/20.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "AddContactViewController.h"
#import "Contact.h"

@interface ContactsTableViewController ()<UIActionSheetDelegate, AddContectDelegate>

@property (nonatomic, strong) NSMutableArray *contacts;
@end

@implementation ContactsTableViewController

- (IBAction)loginout:(UIBarButtonItem *)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"确定退出登录？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}

- (NSArray *)contacts
{
    if (!_contacts) {
        _contacts = [NSMutableArray array];
    }
    return _contacts;
}

/**
 *  UIActionSheet的代理方法
 *
 *  @param actionSheet <#actionSheet description#>
 *  @param buttonIndex <#buttonIndex description#>
 */
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        NSLog(@"确定");
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"contactID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    Contact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //1、获取目标控制器
    AddContactViewController *addVc = segue.destinationViewController;
    //2、成为代理
    addVc.delegate = self;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

/**
 *  实现添加联系人界面的代理方法
 */
//- (void)addContactWithController:(AddContactViewController *)controller withContactName:(NSString *)name phone:(NSString *)phone
//{
//    NSLog(@"%@,%@",name,phone);
//}

- (void)addContactWithController:(AddContactViewController *)controller withContact:(Contact *)contact
{
    NSLog(@"%@,%@",contact.name,contact.phone);
    //1、添加模型数据
    [self.contacts addObject:contact];
    //2、刷新表格
    [self.tableView reloadData];
}

@end
