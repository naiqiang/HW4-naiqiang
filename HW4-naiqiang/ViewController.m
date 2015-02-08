//
//  ViewController.m
//  HW4-naiqiang
//
//  Created by naiqiang on 2/5/15.
//  Copyright (c) 2015 naiqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()
-(void)updateUserInterface: (TodoList*)list;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.textFieldEntry.delegate = self;
    
    self.todoList = [TodoList groceryList];
    [self updateUserInterface:self.todoList];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


-(void)updateUserInterface: (TodoList*)list
{
    [self.tableView reloadData];
    [self.textFieldEntry setEditable:NO];
}

-(void)controlTextDidChange:(NSNotification *)obj
{
    NSLog(@"controlTextDidChange");
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    NSLog(@"numberOfRowsInTableView");
    
    return [self.todoList itemCount];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSLog(@"table row %ld", (long)row);
    
    NSTableCellView* cell =[tableView makeViewWithIdentifier:@"Cell" owner:nil];
    
    id obj = [[self.todoList allItems] objectAtIndex:row];
    TodoItem* item = (TodoItem*)obj;
    cell.textField.stringValue = [NSString stringWithFormat:@"%@", item.title ];
    return cell;
}

- (IBAction)clickAddButton:(id)sender {
    NSLog(@"add");
    
}

- (IBAction)clickRemoveButton:(NSButton *)sender {
    NSLog(@"remove");
}

@end
