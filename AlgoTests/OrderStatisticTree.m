//
//  OrderStatisticTree.m
//  AlgoTests
//
//  Created by Tim Harris on 1/27/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "OrderStatisticTree.h"
#import "OrderStatisticTreeNode.h"

@implementation OrderStatisticTree

@synthesize root=_root, tNil = _tNil;

-(OrderStatisticTreeNode *)osSelect:(OrderStatisticTreeNode *)aNode andKey:(NSNumber *)aKey{
    NSNumber *temp =[NSNumber numberWithInt: [[(OrderStatisticTreeNode*)[aNode Left]osSize]intValue] + 1];
    if ([aKey intValue] == [temp intValue]) {
        return aNode;
    }
    else if ([aKey intValue] < [temp intValue]){
        return [self osSelect:(OrderStatisticTreeNode*)[aNode Left] andKey:aKey];
    }
    else{
        NSNumber *newKey = [NSNumber numberWithInt: [aKey intValue]  - [temp intValue]];
        return [self osSelect:(OrderStatisticTreeNode*)[aNode Right] andKey:newKey];

    }
}

-(NSNumber *)osRank:(OrderStatisticTreeNode *)aNode{
    NSNumber * rank = [NSNumber numberWithInt:  [[(OrderStatisticTreeNode*)[aNode Left] osSize] intValue] +1];
    OrderStatisticTreeNode * n1 = aNode;
    while (n1 != _root) {
        if (n1 == (OrderStatisticTreeNode*)[[n1 Parent] Right]) {
            rank =[NSNumber numberWithInt: [rank intValue] + [[(OrderStatisticTreeNode*)[[n1 Parent] Left] osSize] intValue] +1];
        }
        n1 = (OrderStatisticTreeNode*)[n1 Parent];
    }
    
    return rank;
}


-(void)leftRotate:(OrderStatisticTreeNode *)aNode{
    OrderStatisticTreeNode * n1 = (OrderStatisticTreeNode*)[aNode Right];
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
    [n1 setOsSize:[aNode osSize]];
    [aNode setOsSize:[NSNumber numberWithInt:[[(OrderStatisticTreeNode*)[aNode Left] osSize] intValue]+ [[(OrderStatisticTreeNode*)[aNode Right] osSize] intValue] +1]];
}

-(void)rightRotate:(OrderStatisticTreeNode *)aNode{
    OrderStatisticTreeNode *n1 = (OrderStatisticTreeNode*)[aNode Left];
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
    [n1 setOsSize:[aNode osSize]];
    [aNode setOsSize:[NSNumber numberWithInt:[[(OrderStatisticTreeNode*)[aNode Left] osSize] intValue]+ [[(OrderStatisticTreeNode*)[aNode Right] osSize] intValue] +1]];
}

@end
