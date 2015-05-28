//
//  LinkList.h
//  AlgoTests
//
//  Created by Tim Harris on 1/13/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;

@interface LinkList : NSObject{
    Node * Head, *Tail;
    BOOL Doubly;
}

@property Node * Head, *Tail;
@property BOOL Doubly;

-(id)init;
-(id)initDoubly;
-(Node*) Search:(NSNumber*)searchKey;
-(void) insertNode:(Node *) newNode;
-(void) deleteNode:(Node *) nodeToDelete;

-(void) deleteNodeAlt:(Node *)nodeToDelete;
-(Node *)SearchAlt:(NSNumber *)searchKey;

-(void)printList;
-(NSString *)description;
@end
