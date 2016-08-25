//
//  ContactTableViewCell.h
//  22-私人通讯录
//
//  Created by linw on 16/8/25.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface ContactTableViewCell : UITableViewCell

@property (nonatomic, strong)Contact *contact;

+ (instancetype) cellWithTableView:(UITableView *)tableView;

@end
