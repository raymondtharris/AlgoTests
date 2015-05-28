//
//  BinaryTreeNode.h
//  AlgoTests
//
//  Created by Tim Harris on 1/13/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject{
    BinaryTreeNode * Parent, *Left, *Right;
    NSNumber * Key;
}

@property BinaryTreeNode *Parent, *Left, *Right;
@property NSNumber *Key;

-(id)initWithKey:(NSNumber*) aKey;
-(void)printNode;

@end
