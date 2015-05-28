//
//  Queue.m
//  AlgoTests
//
//  Created by Tim Harris on 1/12/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "Queue.h"
#import "Node.h"

@implementation Queue

@synthesize Head=_Head, Tail=_Tail;
@synthesize length=_length;

-(id)init{
    self = [super init];
    if (self) {
        _Head = nil;
        _Tail = _Head;
        _length = @0;
    }
    return self;
}

-(id)initWithKeys:(NSArray *)keys{
    self = [super init];
    if (self) {
        _Head = nil;
        _Tail = nil;
        _length = @0;
        for (NSNumber * key in keys) {
            [self enqueue:key];
        }
    }
    return self;
}

-(void)enqueue:(NSNumber *)key{
    Node *newNode = [[Node alloc]init];
    [newNode setKey:key];
    if ([_length intValue] == 0) {
        [self setHead:newNode];
        [self setTail:_Head];
    }
    else{
        [_Tail setSuccessor:newNode];
        [newNode setPredecessor:_Tail];
        [self setTail:newNode];
    }
    _length = [NSNumber numberWithInt:[_length intValue] +1];
   // NSLog(@"%@", [newNode key]);
}

-(Node*)dequeue{
    if (_Head== nil) {
        NSLog(@"Queue Empty");
        return nil;
    }else{
        Node *toDequeue = _Head;
        [self setHead:_Head.successor];
        [_Head setPredecessor:nil];
        //NSLog(@"%@", [toDequeue key]);
        _length = [NSNumber numberWithInt:[_length intValue] -1];
        return toDequeue;
    }
}
-(BOOL)isEmpty{
    if (_Head == nil) {
        return YES;
    }else
        return NO;
}
@end
