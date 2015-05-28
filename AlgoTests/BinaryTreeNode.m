//
//  BinaryTreeNode.m
//  AlgoTests
//
//  Created by Tim Harris on 1/13/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode

@synthesize Key=_Key, Parent =_Parent, Left=_Left, Right = _Right;

-(id)initWithKey:(NSNumber *)aKey{
    self = [super init];
    if (self) {
        _Key = aKey;
        _Parent = nil;
        _Left = nil;
        _Right = nil;
    }
    return self;
}

-(void)printNode{
    NSLog(@"%@", _Key);
}

@end
