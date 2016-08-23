//
//  EditViewViewController.h
//  22-私人通讯录
//
//  Created by linw on 16/8/21.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@class EditViewViewController;

@protocol EditViewDelegate <NSObject>

@optional
- (void)saveChangeContact:(EditViewViewController *)evVc contact:(Contact *)contact;

@end
@interface EditViewViewController : UIViewController

@property (nonatomic, strong) Contact *contact;

@property (nonatomic, strong) id<EditViewDelegate> delegate;

@end
