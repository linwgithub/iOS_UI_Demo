//
//  Person.h
//  23-plist文件存取
//
//  Created by linw on 16/8/30.
//  Copyright © 2016年 linw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) int age;
@end
