//
//  OrderStatisticTree.h
//  AlgoTests
//
//  Created by Tim Harris on 1/27/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>
@class OrderStatisticTreeNode;

@interface OrderStatisticTree : NSObject{
    OrderStatisticTreeNode * root;
    OrderStatisticTreeNode * tNil;
}

@property OrderStatisticTreeNode *root, *tNil;

-(OrderStatisticTreeNode *)osSelect:(OrderStatisticTreeNode*) aNode andKey:(NSNumber*) aKey;
-(NSNumber*) osRank:(OrderStatisticTreeNode*) aNode;

-(void)leftRotate:(OrderStatisticTreeNode*) aNode;
-(void)rightRotate:(OrderStatisticTreeNode*) aNode;

@end
