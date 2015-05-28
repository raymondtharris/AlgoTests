//
//  GraphNode.h
//  AlgoTests
//
//  Created by Tim Harris on 4/6/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "Node.h"

@interface GraphNode : Node{
    BOOL directed;
    NSString *nodeColor;
}
@property BOOL directed;
@property int indexKey;
@property NSString *nodeColor;
@property long distance, f;

-(id)initWithKey:(NSNumber *)newKey;
-(id)initWithKey:(NSNumber *)newKey isDirected:(BOOL) aDirected;
-(id)initWithKey:(NSNumber *)newKey andIndexKey:(int) inKey;
-(BOOL)isDirected;
-(NSString *)description;
@end
