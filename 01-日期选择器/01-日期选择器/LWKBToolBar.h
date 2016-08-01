//
//  LWKBToolBar.h
//  01-日期选择器
//
//  Created by 林威 on 16/8/1.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LWKBToolBar;

@protocol LWKBToolBarDelegate <NSObject>

@optional
- (void)kbToolbar:(LWKBToolBar *)toolbar btndidClick:(UIBarButtonItem *)item;

@end
@interface LWKBToolBar : UIToolbar

@property (nonatomic, strong)id<LWKBToolBarDelegate> kbDelegate;
+ (instancetype)kbtoolbar;

@end
