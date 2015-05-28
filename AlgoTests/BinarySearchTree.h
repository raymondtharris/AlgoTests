//
//  BinarySearchTree.h
//  AlgoTests
//
//  Created by Tim Harris on 1/17/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BinaryTreeNode;

@interface BinarySearchTree : NSObject{
    BinaryTreeNode *root;
    NSNumber *height;
}

@property BinaryTreeNode *root;
@property NSNumber*height;

-(void)inorderTreeTraversal:(BinaryTreeNode*) currentNode;
-(BinaryTreeNode*)treeSearch:(BinaryTreeNode *) aNode forKey:(NSNumber*) searchKey;
-(BinaryTreeNode*)iterativeTreeSearch:(BinaryTreeNode*) aNode forKey:(NSNumber*) searchKey;
-(BinaryTreeNode*)treeMinimum:(BinaryTreeNode*) aNode;
-(BinaryTreeNode*)treeMaximum:(BinaryTreeNode*) aNode;
-(BinaryTreeNode*)treeSuccessor:(BinaryTreeNode*) aNode;
-(void)treeInsert:(BinaryTreeNode*) newNode;
-(void)transplant:(BinaryTreeNode*) nodeToTransplant withCurrentNode:(BinaryTreeNode*) currentNode;
-(void)treeDelete:(BinaryTreeNode*) nodeToDelete;
@end
