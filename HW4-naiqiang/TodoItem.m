//
//  TodoItem.m
//  HW3
//
//  Created by czhang on 2/2/15.
//  Copyright (c) 2015 czhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TodoItem.h"

@implementation TodoItem: NSObject

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"KeyForTodoItemTitle"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.itemArray = [aDecoder decodeObjectForKey:@""];
    }
    id obj = [aDecoder decodeObjectForKey:@"KeyForTodoItemTitle"];
    
    NSString* title = (NSString*)obj;
    
    TodoItem* item = TodoItem todoItemWithTitle:title;
}

+(instancetype) todoItemWithTitle: (NSString*)title
{
    TodoItem* item = [[TodoItem alloc] init];
    item.title = title;
    return item;
}

@end