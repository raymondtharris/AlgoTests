//
//  RedBlackTree.m
//  AlgoTests
//
//  Created by Tim Harris on 1/20/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "RedBlackTree.h"
#import "RedBlackTreeNode.h"

@implementation RedBlackTree

@synthesize root=_root, tNil=_tNil;

-(void)leftRotate:(RedBlackTreeNode *)aNode{
    RedBlackTreeNode * n1 = (RedBlackTreeNode*)[aNode Right];
    [aNode setRight:[n1 Left]];
    if ([n1 Left] != _tNil) {
        [[n1 Left] setParent:aNode];
    }
    [n1 setParent:[aNode Parent]];
    if ([aNode Parent] == _tNil) {
        [self setRoot:n1];
    }
    else if (aNode == [[aNode Parent] Left]){
        [[aNode Parent] setLeft:n1];
    }
    else{
        [[aNode Parent] setRight:n1];
    }
    [n1 setLeft:aNode];
    [aNode setParent:n1];
}

-(void)rightRotate:(RedBlackTreeNode *)aNode{
    RedBlackTreeNode *n1 = (RedBlackTreeNode*)[aNode Left];
    [aNode setLeft:[n1 Right]];
    if ([n1 Right] != _tNil) {
        [[n1 Right] setParent:aNode];
    }
    [n1 setParent:[aNode Parent]];
    if ([aNode Parent] == _tNil) {
        [self setRoot:n1];
    }
    else if (aNode == [[aNode Parent] Right]){
        [[aNode Parent] setRight:n1];
    }
    else{
        [[aNode Parent] setLeft:n1];
    }
    [n1 setRight:aNode];
    [aNode setRight:n1];
}

-(void)rbInsert:(RedBlackTreeNode *)newNode{
    RedBlackTreeNode * n1  = _tNil;
    RedBlackTreeNode * n2 = _root;
    while (n2 != _tNil) {
        n1 = n2;
        if ([[newNode Key] intValue] < [[n2 Key] intValue]) {
            n2 = (RedBlackTreeNode*)[n2 Left];
        }
        else{
            n2 = (RedBlackTreeNode*)[n2 Right];
        }
    }
    [newNode setParent: n1];
    if (n1 == _tNil) {
        [self setRoot:newNode];
    }
    else if ([[newNode Key] intValue] < [[n1 Key] intValue]){
        [n1 setLeft:newNode];
    }
    else{
        [n1 setRight:newNode];
    }
    [newNode setLeft: _tNil];
    [newNode setRight:_tNil];
    [newNode setColor:@"red"];
    [self rbInsertFixUp:newNode];
}


-(void)rbInsertFixUp:(RedBlackTreeNode *)newNode{
    while ([[(RedBlackTreeNode*)[newNode Parent] color]  isEqual: @"red"]) {
        if ([newNode Parent] == [[[newNode Parent] Parent] Left]) {
            RedBlackTreeNode * n1 = (RedBlackTreeNode*)[[[newNode Parent] Parent] Right];
            if ([[n1 color] isEqual:@"red"]) {
                [(RedBlackTreeNode*)[newNode Parent] setColor:@"black"];
                [n1 setColor:@"black"];
                [(RedBlackTreeNode*)[[newNode Parent]Parent] setColor:@"red"];
                newNode = (RedBlackTreeNode*)[[newNode Parent] Parent];
            }
            else if (newNode == [[newNode Parent] Right]){
                newNode = (RedBlackTreeNode*)[newNode Parent];
                [self leftRotate:newNode];
            }
            [(RedBlackTreeNode*)[newNode Parent] setColor:@"black"];
            [(RedBlackTreeNode*)[[newNode Parent] Parent] setColor:@"red"];
            [self rightRotate:(RedBlackTreeNode*)[[newNode Parent] Parent]];
        }
        else{
            RedBlackTreeNode * n1 = (RedBlackTreeNode*)[[[newNode Parent] Parent] Left];
            if ([[n1 color] isEqual:@"red"]) {
                [(RedBlackTreeNode*)[newNode Parent] setColor:@"black"];
                [n1 setColor:@"black"];
                [(RedBlackTreeNode*)[[newNode Parent]Parent] setColor:@"red"];
                newNode = (RedBlackTreeNode*)[[newNode Parent] Parent];
            }
            else if (newNode == [[newNode Parent] Left]){
                newNode = (RedBlackTreeNode*)[newNode Parent];
                [self leftRotate:newNode];
            }
            [(RedBlackTreeNode*)[newNode Parent] setColor:@"black"];
            [(RedBlackTreeNode*)[[newNode Parent] Parent] setColor:@"red"];
            [self rightRotate:(RedBlackTreeNode*)[[newNode Parent] Parent]];
        }
    }
    [_root setColor:@"black"];
}


-(void)rbTransplant:(RedBlackTreeNode *)node1 with:(RedBlackTreeNode *)node2{
    if ((RedBlackTreeNode*)[node1 Parent] == _tNil) {
        [self setRoot:node2];
    }
    else if (node1 == (RedBlackTreeNode*)[[node1 Parent] Left]){
        [[node1 Parent] setLeft:node2];
    }
    else{
        [[node1 Parent] setRight:node2];
    }
    [node2 setParent:[node1 Parent]];
}

-(void)rbDelete:(RedBlackTreeNode *)nodeToDelete{
    RedBlackTreeNode * n1 = nodeToDelete;
    NSString * originalColor = [n1 color];
    RedBlackTreeNode * n2;
    if ((RedBlackTreeNode*)[nodeToDelete Left] == _tNil) {
        n2 = (RedBlackTreeNode*) [nodeToDelete Right];
        [self rbTransplant:nodeToDelete with:(RedBlackTreeNode*)[nodeToDelete Right]];
    }
    else if ((RedBlackTreeNode*)[nodeToDelete Right] == _tNil){
        n2 = (RedBlackTreeNode*) [nodeToDelete Left];
        [self rbTransplant:nodeToDelete with:(RedBlackTreeNode*)[nodeToDelete Left]];
    }
    else{
        n1 = [self treeMinimum:(RedBlackTreeNode*)[nodeToDelete Right]];
        originalColor = [n1 color];
        n2 = (RedBlackTreeNode*) [n1 Right];
        if ((RedBlackTreeNode*)[n1 Parent] == nodeToDelete) {
            [n2 setParent:n1];
        }
        else{
            [self rbTransplant:n1 with:(RedBlackTreeNode*)[n1 Right]];
            [n1 setRight:(RedBlackTreeNode*)[nodeToDelete Right]];
            [[n1 Right] setParent:n1];
        }
        [self rbTransplant:nodeToDelete with:n1];
        [n1 setLeft:(RedBlackTreeNode*)[nodeToDelete Left]];
        [[n1 Left] setParent:n1];
        [n1 setColor:[nodeToDelete color]];
    }
    if ([originalColor isEqual:@"black"]) {
        [self rbDeleteFixUp:n2];
    }
}

-(void)rbDeleteFixUp:(RedBlackTreeNode *)aNode{
    while (aNode == _root && [[aNode color] isEqual:@"black"]) {
        if (aNode == (RedBlackTreeNode*)[[aNode Parent] Left]) {
            RedBlackTreeNode * n1 = (RedBlackTreeNode*)[[aNode Parent] Right];
            if ([[n1 color] isEqual:@"red"]) {
                [n1 setColor:@"black"];
                [(RedBlackTreeNode*)[aNode Parent] setColor:@"red"];
                [self leftRotate:(RedBlackTreeNode*)[aNode Parent]];
                n1 = (RedBlackTreeNode*)[[aNode Parent] Right];
            }
            if ([[(RedBlackTreeNode*)[n1 Left] color] isEqual:@"black"] && [[(RedBlackTreeNode*)[n1 Right] color] isEqual:@"black"]) {
                [n1 setColor:@"red"];
                aNode = (RedBlackTreeNode*)[aNode Parent];
            }
            else if ([[(RedBlackTreeNode*)[n1 Right] color] isEqual:@"black"]){
                [(RedBlackTreeNode*)[n1 Left] setColor:@"black"];
                [n1 setColor:@"red"];
                [self rightRotate:n1 ];
                n1 = (RedBlackTreeNode*)[[aNode Parent] Right];
            }
            [n1 setColor:[(RedBlackTreeNode*)[aNode Parent] color]];
            [(RedBlackTreeNode*)[aNode Parent] setColor:@"black"];
            [(RedBlackTreeNode*)[n1 Right] setColor:@"black"];
            [self leftRotate:(RedBlackTreeNode*)[aNode Parent]];
            aNode = _root;
        }
        else{
            RedBlackTreeNode * n1 = (RedBlackTreeNode*)[[aNode Parent] Left];
            if ([[n1 color] isEqual:@"red"]) {
                [n1 setColor:@"black"];
                [(RedBlackTreeNode*)[aNode Parent] setColor:@"red"];
                [self leftRotate:(RedBlackTreeNode*)[aNode Parent]];
                n1 = (RedBlackTreeNode*)[[aNode Parent] Right];
            }
            if ([[(RedBlackTreeNode*)[n1 Right] color] isEqual:@"black"] && [[(RedBlackTreeNode*)[n1 Left] color] isEqual:@"black"]) {
                [n1 setColor:@"red"];
                aNode = (RedBlackTreeNode*)[aNode Parent];
            }
            else if ([[(RedBlackTreeNode*)[n1 Left] color] isEqual:@"black"]){
                [(RedBlackTreeNode*)[n1 Right] setColor:@"black"];
                [n1 setColor:@"red"];
                [self rightRotate:n1 ];
                n1 = (RedBlackTreeNode*)[[aNode Parent] Left];
            }
            [n1 setColor:[(RedBlackTreeNode*)[aNode Parent] color]];
            [(RedBlackTreeNode*)[aNode Parent] setColor:@"black"];
            [(RedBlackTreeNode*)[n1 Left] setColor:@"black"];
            [self leftRotate:(RedBlackTreeNode*)[aNode Parent]];
            aNode = _root;
        }
    }
    [aNode setColor:@"black"];
}



-(RedBlackTreeNode *)treeMaximum:(RedBlackTreeNode *)aNode{
    while ((RedBlackTreeNode*)[aNode Right] != _tNil) {
        aNode = (RedBlackTreeNode*)[aNode Right];
    }
    return aNode;
}
-(RedBlackTreeNode *)treeMinimum:(RedBlackTreeNode *)aNode{
    while ((RedBlackTreeNode*)[aNode Left] != _tNil) {
        aNode = (RedBlackTreeNode*)[aNode Left];
    }
    return aNode;
}




@end
