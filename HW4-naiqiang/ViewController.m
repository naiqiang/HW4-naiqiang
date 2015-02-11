//
//  ViewController.m
//  HW4-naiqiang
//
//  Created by naiqiang on 2/5/15.
//  Copyright (c) 2015 naiqiang. All rights reserved.
//

#import "ViewController.h"
#import "TodoItem.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.textFieldEntry.delegate = self;
    
    //self.todoList = [TodoList groceryList];
    [self updateUserInterface];
    self.current = -1;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
    NSLog(@"setRepresentedObject");
}


-(void)updateUserInterface
{
    [self.tableView reloadData];
    [self.textFieldEntry setEditable:NO];
}

-(void)controlTextDidChange:(NSNotification *)obj
{
    NSLog(@"controlTextDidChange");
    if( self.current>-1 )
    {
        NSInteger row = self.current;
        NSTableCellView* view = [self.tableView viewAtColumn:0 row:row makeIfNecessary:NO];
        if ( view)
        {
            NSString* newTitle = self.textFieldEntry.stringValue;
            NSString* title = view.textField.stringValue;

            [self.todoList updateItem:self.current withNewTitle:newTitle];
            NSLog(@"update item %lu: %@ to %@", self.current, title, newTitle);
        }
        [self updateUserInterface];
        [self.textFieldEntry setEditable:YES];
    }
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    NSLog(@"numberOfRowsInTableView %lu", (unsigned long)[self.todoList itemCount]);
    
    return [self.todoList itemCount];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
//    NSLog(@"create table row %ld", (long)row);
    
    NSTableCellView* cell =[tableView makeViewWithIdentifier:@"Cell" owner:nil];
    
    id obj = [[self.todoList allItems] objectAtIndex:row];
    TodoItem* item = (TodoItem*)obj;
    cell.textField.stringValue = [NSString stringWithFormat:@"%@", item.title ];
    return cell;
}

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row
{
    NSLog(@"select row %ld", (long)row);

    self.current = row;
    NSTableCellView* view = [self.tableView viewAtColumn:0 row:row makeIfNecessary:NO];

    [self.textFieldEntry setEditable:YES];
    self.textFieldEntry.stringValue = view.textField.stringValue;
    return YES;
}

- (IBAction)clickAddButton:(id)sender {
    NSLog(@"add");
    
    TodoItem* item = [TodoItem todoItemWithTitle:@"New Item"];
    [self.todoList addItem:item];
    
    [self updateUserInterface];
}

- (IBAction)clickRemoveButton:(NSButton *)sender {
    NSLog(@"remove");
    
    NSIndexSet* index = self.tableView.selectedRowIndexes;
    
    NSUInteger currentIndex = [index firstIndex];
    while (currentIndex != NSNotFound)
    {
        NSTableCellView* view = [self.tableView viewAtColumn:0 row:currentIndex makeIfNecessary:NO];
        if ( view)
        {
            NSString* title = view.textField.stringValue;
            [self.todoList removeItem:[TodoItem todoItemWithTitle:title]];
            NSLog(@"remove item %lu: %@", (unsigned long)currentIndex, title);
        }
        
        //increment
        currentIndex = [index indexGreaterThanIndex: currentIndex];
    }
    
    [self updateUserInterface];
}

@end
