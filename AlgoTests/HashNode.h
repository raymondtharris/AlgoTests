//
//  HashNode.h
//  AlgoTests
//
//  Created by Tim Harris on 1/14/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "Node.h"
@class HashObject;

@interface HashNode : Node{
    HashObject *obj;
}
@property HashObject *obj;

-(NSString *)description;
@end
