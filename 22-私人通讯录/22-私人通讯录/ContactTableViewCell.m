//
//  ContactTableViewCell.m
//  22-私人通讯录
//
//  Created by linw on 16/8/25.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ContactTableViewCell.h"

@interface ContactTableViewCell()

@property (nonatomic,weak) UIView *divider;

@end
@implementation ContactTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    return [tableView dequeueReusableCellWithIdentifier:@"contact"];
}

- (void)awakeFromNib
{
    UIView *divider = [[UIView alloc] init];
    divider.backgroundColor = [UIColor grayColor];
    divider.alpha = 0.3;
    [self.contentView addSubview:divider];
    self.divider = divider;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat diverH = 1;
    CGFloat diverX = 10;
    CGFloat diverY = self.frame.size.height - diverH;
    CGFloat diverW = self.frame.size.width - (2 * diverX);
    self.divider.frame = CGRectMake(diverX, diverY, diverW, diverH);
}


- (void)setContact:(Contact *)contact
{
    _contact = contact;
    
    self.textLabel.text = contact.name;
    self.detailTextLabel.text = contact.phone;
    
}

@end
