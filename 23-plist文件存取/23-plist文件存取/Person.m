//
//  Person.m
//  23-plist文件存取
//
//  Created by linw on 16/8/30.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "Person.h"

@implementation Person

/**
 *  存档
 1、存储那些数据
 2、如何存储
 *
 *  @param aCoder <#aCoder description#>
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
}

/**
 *  读档
 1、读取那些数据
 2、如何读档
 *
 *  @param aDecoder <#aDecoder description#>
 *
 *  @return <#return value description#>
 */
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self == [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntForKey:@"age"];
    }
    return self;
    
}

@end
