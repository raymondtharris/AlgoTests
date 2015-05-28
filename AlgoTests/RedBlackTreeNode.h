//
//  RedBlackTreeNode.h
//  AlgoTests
//
//  Created by Tim Harris on 1/20/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "BinaryTreeNode.h"

@interface RedBlackTreeNode : BinaryTreeNode{
    NSString *color;
}
@property NSString * color;

-(id)initWithKey:(NSNumber *)aKey;

@end
