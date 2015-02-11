//
//  ViewController.h
//  HW4-naiqiang
//
//  Created by naiqiang on 2/5/15.
//  Copyright (c) 2015 naiqiang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"

@interface ViewController : NSViewController <NSTextFieldDelegate, NSTableViewDataSource, NSTableViewDelegate>

@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSButton *addButton;
@property (weak) IBOutlet NSButton *removeButton;
@property (weak) IBOutlet NSTextField *textFieldEntry;

@property TodoList* todoList;
@property NSInteger current;

-(void)updateUserInterface;

@end

