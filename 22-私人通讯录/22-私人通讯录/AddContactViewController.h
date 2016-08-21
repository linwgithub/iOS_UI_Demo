//
//  AddContactViewController.h
//  22-私人通讯录
//
//  Created by linw on 16/8/21.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddContactViewController;

@protocol AddContectDelegate <NSObject>

@optional
- (void)addContactWithController:(AddContactViewController *)controller withContactName:(NSString *)name phone:(NSString *)phone;

@end
@interface AddContactViewController : UIViewController

@property(nonatomic, strong)id<AddContectDelegate> delegate;

@end
