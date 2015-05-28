//
//  RedBlackTreeNode.m
//  AlgoTests
//
//  Created by Tim Harris on 1/20/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "RedBlackTreeNode.h"

@implementation RedBlackTreeNode

@synthesize  color=_color;

-(id)initWithKey:(NSNumber *)aKey{
    self = [super initWithKey:aKey];
    if (self) {
        _color = @"red";
    }
    return  self;
}
@end
