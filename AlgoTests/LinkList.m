//
//  LinkList.m
//  AlgoTests
//
//  Created by Tim Harris on 1/13/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "LinkList.h"
#import "Node.h"
#import "HashNode.h"
#import "HashObject.h"

@implementation LinkList

@synthesize Head=_Head, Tail =_Tail;
@synthesize  Doubly = _Doubly;

-(id)init{
    self = [super init];
    if (self) {
        self.Doubly = NO;
        self.Head = nil;
        self.Tail = self.Head;
    }
    return self;
}

-(id)initDoubly{
    self = [super init];
    if (self) {
        self.Doubly = YES;
        self.Head = nil;
        self.Tail = self.Head;
    }
    return self;
}

-(Node *)Search:(NSNumber *)searchKey{
    Node * curr = _Head;
    while (curr !=nil && [[curr key] intValue] != [searchKey intValue]) {
        curr  = [curr successor];
    }
    return curr;
}

-(void)insertNode:(Node *)newNode{
    //[newNode printNode];
    if(self.Doubly){
        [newNode setSuccessor:_Head];
        if (_Head != nil) {
            //NSLog(@"not ");
            [_Head setPredecessor:newNode];
        }
        else{
            // NSLog(@"new");
            [self setHead:newNode];
            //newNode.successor = nil;
            newNode.predecessor = nil;
        }
    }
    else{
        
        if (_Head == nil) {
            [self setHead:newNode];
            self.Tail = self.Head;
        }
        else{
            [_Tail setSuccessor:newNode];
            [self setTail: newNode];
        }
    }
}

-(void)deleteNode:(Node *)nodeToDelete{
    if ([nodeToDelete predecessor] != nil) {
        [[nodeToDelete predecessor] setSuccessor:[nodeToDelete successor]];
    }
    else{
        [self setHead:[nodeToDelete successor]];
    }
    if ([nodeToDelete successor] != nil) {
        [[nodeToDelete successor] setPredecessor:[nodeToDelete predecessor]];
    }
}

-(void) deleteNodeAlt:(Node *)nodeToDelete{
    [[nodeToDelete predecessor] setSuccessor:[nodeToDelete successor]];
    [[nodeToDelete successor] setPredecessor:[nodeToDelete predecessor]];
}

-(Node *)SearchAlt:(NSNumber *)searchKey{
    Node * curr = [[Node alloc] init];
    return curr;
}

-(void)printList{
    Node * curr = _Head;
    [curr printNode];
   // curr = [curr predecessor];
   // [curr printNode];
    while ([curr predecessor] != nil) {
        curr = [curr predecessor];
        [curr printNode];
        
    }
}

-(NSString *)description{
    NSString * returnString;
    /*
    HashNode *curr = [self Head];
    //NSLog(@"%@", [[curr obj] description]);
    returnString = [NSString stringWithFormat:@"{ %@", [curr description] ];
    
    //NSLog(@" %@", returnString);
    while ([curr predecessor] != nil) {
        curr = [curr predecessor];
        //NSLog(@"%@", [[curr obj] description]);
        returnString = [NSString stringWithFormat:@"%@, %@", returnString , [curr description]];
        //NSLog(@"%@", returnString);
    }
    returnString = [NSString stringWithFormat:@"%@ }", returnString ];
//NSLog(@"%@", returnString);
    //[returnString stringByAppendingString:[NSString stringWithFormat:@"%@ }", returnString]];
    */
    
    Node * curr = self.Head;
    returnString = [NSString stringWithFormat:@"{ %@", [curr description] ];
    if(!self.Doubly){
        while ([curr successor] != nil) {
            curr = [curr successor];
            //NSLog(@"%@", [[curr obj] description]);
            returnString = [NSString stringWithFormat:@"%@ -> %@", returnString , [curr description]];
            //NSLog(@"%@", returnString);
        }
    }
    returnString = [NSString stringWithFormat:@"%@ }", returnString ];
    return returnString;
}

@end
