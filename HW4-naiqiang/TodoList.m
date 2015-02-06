//
//  TodoList.m
//  HW3
//
//  Created by czhang on 2/2/15.
//  Copyright (c) 2015 czhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TodoList.h"


@implementation TodoList: NSObject

- (BOOL)hasTodoItem:(TodoItem*)item
{
    for(id it in self.todoItemList)
    {
        TodoItem* todoItem = (TodoItem*)it;
        if ( [todoItem.title isEqualToString:item.title] )
        {
            // return on first match
            return YES;
        }
    }
    return NO;
}

-(BOOL)addItem:(TodoItem*)item
{
    // empty item not allowed
    if ((item.title==Nil) || ([item.title isEqualToString:@""]))
    {
        return NO;
    }
    
    // check for duplication
    if ((self.allowDuplicates==NO) && ([self hasTodoItem:item]) )
    {
        return NO;
    }

    [self.todoItemList addObject:item];
    return YES;
}


-(BOOL)removeItem:(TodoItem*)item
{
    for(id it in self.todoItemList)
    {
        TodoItem* todoItem = (TodoItem*)it;
        if ( [todoItem.title isEqualToString:item.title] )
        {
            NSUInteger index = [self.todoItemList indexOfObject:todoItem];
            [self.todoItemList removeObjectAtIndex:index] ;
            return YES;
        }
    }
    return NO;
}

-(NSArray*)allItems
{
    return self.todoItemList;
}

-(NSUInteger)itemCount
{
    return [self.todoItemList count];
}

+(instancetype) initWithArrayOfItems: (NSArray*)items
{
    TodoList* list = [[TodoList alloc] init];
    list.allowDuplicates = YES;
    list.todoItemList = [[NSMutableArray alloc] initWithArray:items];
    return list;
}

+(instancetype) todoList
{
    TodoList* list = [[TodoList alloc] init];
    list.allowDuplicates = YES;
    list.todoItemList = [[NSMutableArray alloc] init];
    return list;
}

+(instancetype)groceryList
{
    TodoList* list = [[TodoList alloc] init];
    list.allowDuplicates = YES;
    list.todoItemList = [[NSMutableArray alloc] init];
    
    [list.todoItemList addObject: [TodoItem todoItemWithTitle:@"Apple"]];
    [list.todoItemList addObject: [TodoItem todoItemWithTitle:@"Orange"]];
    [list.todoItemList addObject: [TodoItem todoItemWithTitle:@"Banana"]];
    
    return list;
}

+(instancetype)airplaneLandingChecklist
{
    TodoList* list = [[TodoList alloc] init];
    list.allowDuplicates = YES;
    list.todoItemList = [[NSMutableArray alloc] init];
    
    [list.todoItemList addObject: [TodoItem todoItemWithTitle:@"Cleanup"]];
    [list.todoItemList addObject: [TodoItem todoItemWithTitle:@"Sit Straight"]];
    [list.todoItemList addObject: [TodoItem todoItemWithTitle:@"Land"]];
    
    return list;
    
}

static NSString* const KEY_FOR_TODO_LIST = @"KeyForTodoList";

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    NSLog(@"TodoList: encoding data");
    
    [aCoder encodeObject:self.todoItemList forKey:KEY_FOR_TODO_LIST];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"TodoList: decoding data");
    
    id obj = [aDecoder decodeObjectForKey:KEY_FOR_TODO_LIST];
    
    self = [super init];
    if (self)
    {
        if ( [obj isKindOfClass:[NSMutableArray class]])
        {
            NSArray* items = (NSArray*)obj;
            
            NSLog(@"TodoList: array of %lu", (unsigned long)[items count]);
            NSLog(@"%@", items);

            self = [TodoList initWithArrayOfItems:items];
        }
    }
    return self;
    
}

@end