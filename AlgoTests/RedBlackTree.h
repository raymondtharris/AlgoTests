//
//  RedBlackTree.h
//  AlgoTests
//
//  Created by Tim Harris on 1/20/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RedBlackTreeNode;

@interface RedBlackTree : NSObject{
    RedBlackTreeNode *root;
    RedBlackTreeNode *tNil;
}

@property RedBlackTreeNode *root, *tNil;

-(void)leftRotate:(RedBlackTreeNode*) aNode;
-(void)rightRotate:(RedBlackTreeNode*) aNode;
-(void)rbInsert:(RedBlackTreeNode*) newNode;
-(void)rbInsertFixUp:(RedBlackTreeNode*) newNode;
-(void)rbTransplant:(RedBlackTreeNode*) node1 with:(RedBlackTreeNode*) node2;
-(void)rbDelete:(RedBlackTreeNode*)nodeToDelete;
-(void)rbDeleteFixUp:(RedBlackTreeNode*) aNode;

-(RedBlackTreeNode*)treeMinimum:(RedBlackTreeNode*) aNode;
-(RedBlackTreeNode*)treeMaximum:(RedBlackTreeNode*) aNode;

@end
