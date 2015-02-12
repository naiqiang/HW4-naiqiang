//
//  TodoItem.m
//  HW3
//
//  Created by czhang on 2/2/15.
//  Copyright (c) 2015 czhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TodoItem.h"

static NSString* const KEY_FOR_TODO_ITEM = @"KeyForTodoItemTitle";

@implementation TodoItem: NSObject

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    NSLog(@"TodoItem: encoding %@", self.title);
    
    [aCoder encodeObject:self.title forKey:KEY_FOR_TODO_ITEM];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    id obj = [aDecoder decodeObjectForKey:KEY_FOR_TODO_ITEM];
    
    if ( [obj isKindOfClass:[NSString class]])
    {
        NSLog(@"TodoItem: decoding %@", (NSString*)obj);
        
        self = [TodoItem todoItemWithTitle:obj];
    }
    return self;
}

+(instancetype) todoItemWithTitle: (NSString*)title
{
    TodoItem* item = [[TodoItem alloc] init];
    item.title = title;
    return item;
}

@end