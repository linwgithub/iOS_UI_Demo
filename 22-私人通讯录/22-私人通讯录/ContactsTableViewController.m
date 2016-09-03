//
//  ContactsTableViewController.m
//  22-私人通讯录
//
//  Created by linw on 16/8/20.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "AddContactViewController.h"
#import "EditViewViewController.h"
#import "Contact.h"
#import "ContactTableViewCell.h"

@interface ContactsTableViewController ()<UIActionSheetDelegate, AddContectDelegate,EditViewDelegate>
#define ContactsPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"contacts.data"]
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
        _contacts = [NSKeyedUnarchiver unarchiveObjectWithFile:ContactsPath];
        if (_contacts == nil) {
            _contacts = [NSMutableArray array];
        }
    }
    return _contacts;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //删除数据模型
    [self.contacts removeObjectAtIndex:indexPath.row];
    //刷新表格
    [self.tableView reloadData];
    //3、归档
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:ContactsPath];
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
    //    static NSString *ID = @"contactCell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    ////    if (cell == nil) {
    ////        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    ////    }
    //    Contact *contact = self.contacts[indexPath.row];
    //    cell.textLabel.text = contact.name;
    //    cell.detailTextLabel.text = contact.phone;
    //    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //    return cell;
    ContactTableViewCell *cell = [ContactTableViewCell cellWithTableView:tableView];
    cell.contact = self.contacts[indexPath.row];
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    Contact *contact = self.contacts[indexPath.row];
////    [self performSegueWithIdentifier:@"editview" sender:contact];
//}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id vc = segue.destinationViewController;
    if ([vc isKindOfClass:[AddContactViewController class]]) {
        //1、获取目标控制器
        AddContactViewController *addVc = (AddContactViewController *)vc;
        //2、成为代理
        addVc.delegate = self;
    }else if([vc isKindOfClass:[EditViewViewController class]]){
        EditViewViewController *etVc = (EditViewViewController *)vc;
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        etVc.contact = self.contacts[path.row];
        etVc.delegate = self;
        
    }
}

/**
 *  实现添加联系人界面的代理方法
 */
- (void)addContactWithController:(AddContactViewController *)controller withContact:(Contact *)contact
{
    NSLog(@"%@,%@",contact.name,contact.phone);
    //1、添加模型数据
    [self.contacts addObject:contact];
    //2、刷新表格
    [self.tableView reloadData];
    //3、归档
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:ContactsPath];
}

- (void)saveChangeContact:(EditViewViewController *)evVc contact:(Contact *)contact
{
    //1、刷新表格
    [self.tableView reloadData];
    
    //2、归档
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:ContactsPath];
    
}
@end
