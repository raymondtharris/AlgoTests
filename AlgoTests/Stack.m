//
//  Stack.m
//  AlgoTests
//
//  Created by Tim Harris on 1/12/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "Stack.h"
#import "Node.h"
@implementation Stack

@synthesize top=_top;

-(id)init{
    self = [super init];
    if (self) {
        _top = nil;
    }
    return self;
}
-(id)initWithKeys:(NSArray *)keys{
    self = [super init];
    if (self) {
        _top=nil;
        for (NSNumber* key in keys) {
            [self push:key];
        }
    }
    return self;
}

-(BOOL)stackEmpty{
    if (_top == nil) {
        return YES;
    }
    return NO;
}
-(void)push:(NSNumber *)key{
    Node *newNode = [[Node alloc]init];
    [newNode setKey:key];
    if ([self stackEmpty] == NO) {
        [newNode setPredecessor:_top];
        [_top setSuccessor:newNode];
        [self setTop:newNode];
    }
    else{
      [self setTop:newNode];
    }
   // NSLog(@"%@", [newNode key]);

}
-(Node*)pop{
    if ([self stackEmpty]==YES) {
        NSLog(@"Stack Underflow");
        return nil;
    }
    else{
        Node *temp = _top;
        [self setTop:[[self top] predecessor]];
        _top.successor = nil;
        return temp;
    }
}
@end
