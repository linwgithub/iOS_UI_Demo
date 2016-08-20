//
//  KBToolBar.h
//  21-UITextField焦点转移
//
//  Created by linw on 16/8/20.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KBToolBar;

@protocol KBToolBarDelegate <NSObject>

@optional
- (void)kbToolBarClick:(KBToolBar *)kbtoolbar clickButton:(UIBarButtonItem *)barButton;

@end
@interface KBToolBar : UIToolbar
@property (weak, nonatomic) IBOutlet UIBarButtonItem *previewButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@property(nonatomic, strong)id<KBToolBarDelegate> kbDelegate;

+ (instancetype)kbtoolBar;




@end
