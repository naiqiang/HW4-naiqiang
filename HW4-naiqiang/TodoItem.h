//
//  TodoItem.h
//  HW3
//
//  Created by czhang on 2/2/15.
//  Copyright (c) 2015 czhang. All rights reserved.
//

#ifndef HW3_TodoItem_h
#define HW3_TodoItem_h

@interface TodoItem: NSObject <NSCoding>

@property NSString* title;

+(instancetype) todoItemWithTitle: (NSString*)title;

@end

#endif
