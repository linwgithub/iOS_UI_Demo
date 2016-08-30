//
//  Person.m
//  23-plist文件存取
//
//  Created by linw on 16/8/30.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt:_age forKey:@"age"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self == [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
    
}

@end
