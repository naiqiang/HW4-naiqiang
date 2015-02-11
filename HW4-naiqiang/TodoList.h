//
//  TodoList.h
//  HW3
//
//  Created by czhang on 2/2/15.
//  Copyright (c) 2015 czhang. All rights reserved.
//

#ifndef HW3_TodoList_h
#define HW3_TodoList_h

#import "TodoItem.h"

@interface TodoList : NSObject <NSCoding>


@property NSMutableArray* todoItemList;
@property BOOL allowDuplicates;


-(BOOL)addItem:(TodoItem*)item;
-(BOOL)removeItem:(TodoItem*)item;
-(BOOL)hasTodoItem:(TodoItem*)item;
-(BOOL)updateItem:(NSInteger)index withNewTitle:(NSString*)newTitle;

//-(void)addItem:(TodoItem*)item;    // insert item if OK
//-(BOOL)canAddItem:(TodoItem*)item; // check if OK to insert
//
//-(void)addItemWithTitle:(NSString*)title; // create and insert item if OK
//-(BOOL)canAddItemWithTitle:(NSString *)item; // check if OK to insert
//-(BOOL)hasItemWithTitle:(NSString*)title; // check if any item contained already has same title
//
//-(NSArray*)itemTitles;  // an array of all item titles (NSString*)
-(NSArray*)allItems;    // an array of all items
-(NSUInteger)itemCount; // number of items contained in list



+(instancetype)todoList;
+(instancetype)groceryList; // make a list filled with grocery items
+(instancetype)airplaneLandingChecklist; // put on scarf. check!
@end

#endif
