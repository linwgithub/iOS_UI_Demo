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
    //固若在storyboard中绑定cell，则创建cell的时候，一般过程是查看缓存池中有没有合适（标识符相同）的cell，没有的话再从storyboard中创建
    //即cell是从storyboard中创建的
    //PS:只要对象是通过Storyboard或者Xib创建，则不会调用init开头的方法，当init开头的方法是通过代码创建时才会调用(initWithCoder方法除外)。
    
    return [tableView dequeueReusableCellWithIdentifier:@"contact"];
}

/**
 *  对象从nib或storyboard创建的话会调用该方法
 */
- (void)awakeFromNib
{
    UIView *divider = [[UIView alloc] init];
    divider.backgroundColor = [UIColor grayColor];
    divider.alpha = 0.3;
    [self.contentView addSubview:divider];
    self.divider = divider;
}

/**
 *  当对象的frame发生变化时调用该方法
 */
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
