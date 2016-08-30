//
//  Student.m
//  23-plist文件存取
//
//  Created by linw on 16/8/31.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self == [super initWithCoder:aDecoder]) {
        _num = [aDecoder decodeIntForKey:@"num"];
    }
    
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeInt:_num forKey:@"num"];
}
@end
