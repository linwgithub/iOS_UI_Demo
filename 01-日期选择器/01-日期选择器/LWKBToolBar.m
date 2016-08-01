//
//  LWKBToolBar.m
//  01-日期选择器
//
//  Created by 林威 on 16/8/1.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "LWKBToolBar.h"

@implementation LWKBToolBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)itemClick:(UIBarButtonItem *)sender {
    if (sender.tag == 2) {
        if ([self.kbDelegate respondsToSelector:@selector(kbToolbar:btndidClick:)]) {
            [self.kbDelegate kbToolbar:self btndidClick:sender];
        }
    }
    
}
+ (instancetype)kbtoolbar{
    return [[[NSBundle mainBundle] loadNibNamed:@"LWKBToolBar" owner:nil options:nil]lastObject];
}
@end
