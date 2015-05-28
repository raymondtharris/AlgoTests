//
//  Queue.h
//  AlgoTests
//
//  Created by Tim Harris on 1/12/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;

@interface Queue : NSObject{
    Node *Head, *Tail;
}

@property Node *Head, *Tail;
@property NSNumber * length;

-(id)init;
-(id)initWithKeys:(NSArray*)keys;
-(void)enqueue:(NSNumber*)key;
-(Node*)dequeue;
-(BOOL)isEmpty;
@end
