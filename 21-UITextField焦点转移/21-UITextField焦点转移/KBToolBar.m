//
//  KBToolBar.m
//  21-UITextField焦点转移
//
//  Created by linw on 16/8/20.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "KBToolBar.h"

@implementation KBToolBar

+ (instancetype)kbtoolBar{
    return [[[NSBundle mainBundle]loadNibNamed:@"KBToolBar.h" owner:nil options:nil]lastObject];
}

- (IBAction)toolBarButtonClick:(UIBarButtonItem *)sender {
    
    if ([self.kbDelegate respondsToSelector:@selector(kbToolBarClick:clickButton:)]) {
        [self.kbDelegate kbToolBarClick:self clickButton:sender];
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
