//
//  GraphNode.m
//  AlgoTests
//
//  Created by Tim Harris on 4/6/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "GraphNode.h"

@implementation GraphNode

@synthesize directed=_directed;
@synthesize indexKey = _indexKey;
@synthesize nodeColor =_nodeColor;
@synthesize distance=_distance, f=_f;


-(id)initWithKey:(NSNumber *)newKey{
    self = [super init];
    if (self) {
        self.key= newKey;
        self.directed = NO;
    }
    return self;
}

-(id)initWithKey:(NSNumber *)newKey isDirected:(BOOL)aDirected{
    self = [super init];
    if (self) {
        self.key = newKey;
        self.directed = aDirected;
    }
    return self;
}

-(id)initWithKey:(NSNumber *)newKey andIndexKey:(int)inKey{
    self = [super init];
    if (self) {
        self.key= newKey;
        self.directed = NO;
        self.indexKey = (int)inKey;
    }
    return self;
}

-(BOOL)isDirected{
    return self.directed;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"%@: %li/%li",self.key, self.distance,self.f];
}

@end
