//
//  Document.m
//  HW4-naiqiang
//
//  Created by naiqiang on 2/5/15.
//  Copyright (c) 2015 naiqiang. All rights reserved.
//

#import "Document.h"
#import "TodoList.h"

@interface Document ()
@property TodoList* documentTodoList;
@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        NSLog(@"document init");
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (void)makeWindowControllers {
    // Override to return the Storyboard file name of the document.
    [self addWindowController:[[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"Document Window Controller"]];
}

// saving
- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    //[NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    //return nil;
    if ( self.documentTodoList==nil)
    {
        NSLog(@"creating initial list");
        self.documentTodoList = [TodoList groceryList];
    }
    
    NSLog(@"saving document");
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.documentTodoList];
    return data;
}

// loading
- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    //[NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    //return YES;
    
    NSLog(@"loading document");

    id object = [NSKeyedUnarchiver unarchiveObjectWithData:data ];
    if ( [object isKindOfClass:[TodoList class]])
    {
        self.documentTodoList = object;
    }
    return YES;
}

@end
