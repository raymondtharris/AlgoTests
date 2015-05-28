//
//  BinarySearchTree.m
//  AlgoTests
//
//  Created by Tim Harris on 1/17/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "BinarySearchTree.h"
#import "BinaryTreeNode.h"

@implementation BinarySearchTree

@synthesize root=_root, height=_height;

-(void)inorderTreeTraversal:(BinaryTreeNode *)currentNode{
    if (currentNode != nil) {
        [self inorderTreeTraversal:[currentNode Left]];
        [currentNode printNode];
        [self inorderTreeTraversal:[currentNode Right]];
    }
}

-(BinaryTreeNode *)treeSearch:(BinaryTreeNode *)aNode forKey:(NSNumber *)searchKey{
    if (aNode == nil || [searchKey intValue] == [[aNode Key] intValue]) {
        return aNode;
    }
    if ([searchKey intValue] < [[aNode Key] intValue]) {
        return [self treeSearch:[aNode Left] forKey:searchKey];
    }
    else{
        return [self treeSearch:[aNode Right] forKey:searchKey];
    }
}

-(BinaryTreeNode *)iterativeTreeSearch:(BinaryTreeNode *)aNode forKey:(NSNumber *)searchKey{
    while (aNode !=nil && [searchKey intValue] != [[aNode Key] intValue] ) {
        if ([searchKey intValue] < [[aNode Key] intValue]) {
            aNode = [aNode Left];
        }
        else{
            aNode = [aNode Right];
        }
    }
    return aNode;
}

-(BinaryTreeNode *)treeMinimum:(BinaryTreeNode *)aNode{
    while ([aNode Left] != nil) {
        aNode = [aNode Left];
    }
    return aNode;
}
-(BinaryTreeNode *)treeMaximum:(BinaryTreeNode *)aNode{
    while ([aNode Right] != nil) {
        aNode = [aNode Right];
    }
    return aNode;
}

-(BinaryTreeNode *)treeSuccessor:(BinaryTreeNode *)aNode{
    if ([aNode Right] != nil) {
        return [self treeMaximum:[aNode Right]];
    }
    BinaryTreeNode *parent = [aNode Parent];
    while (parent != nil && aNode == [parent Right]) {
        aNode = parent;
        parent = [parent Parent];
    }
    return parent;
}

-(void)treeInsert:(BinaryTreeNode *)newNode{
    BinaryTreeNode *n1, *n2;
    n1 = nil;
    n2 = [self root];
    while (n2 != nil) {
        n1 = n2;
        if ([[newNode Key] intValue] < [[n2 Key] intValue]) {
            n2 = [n2 Left];
        }
        else{
            n2 = [n2 Right];
        }
    }
    [newNode setParent:n1];
    if (n1 == nil) {
        [self setRoot:newNode];
    }
    else if ([[newNode Key] intValue] < [[n1 Key] intValue]){
        [n1 setLeft:newNode];
    }
    else{
        [n1 setRight:newNode];
    }
}

-(void)transplant:(BinaryTreeNode *)nodeToTransplant withCurrentNode:(BinaryTreeNode *)currentNode{
    if ([nodeToTransplant Parent] == nil) {
        [self setRoot:currentNode];
    }
    else if (nodeToTransplant == [[nodeToTransplant Parent] Left]){
        [[nodeToTransplant Parent] setLeft:currentNode];
    }
    else{
        [[nodeToTransplant Parent] setRight:currentNode];
    }
    if (currentNode != nil) {
        [currentNode setParent:[nodeToTransplant Parent]];
    }
}

-(void)treeDelete:(BinaryTreeNode *)nodeToDelete{
    if ([nodeToDelete Left] == nil) {
        [self transplant:nodeToDelete withCurrentNode:[nodeToDelete Right]];
    }
    else if ([nodeToDelete Right] ==nil){
        [self transplant:nodeToDelete withCurrentNode:[nodeToDelete Left]];
    }
    else{
        BinaryTreeNode *minNode = [self treeMinimum:[nodeToDelete Right]];
        if ([minNode Parent] != nodeToDelete) {
            [self transplant:minNode withCurrentNode:[minNode Right]];
            [minNode setRight:[nodeToDelete Right]];
            [[minNode Right] setParent:minNode];
        }
        [self transplant:nodeToDelete withCurrentNode:minNode];
        [minNode setLeft:[nodeToDelete Left]];
        [[minNode Left] setParent:minNode];
    }
}


@end
