//
//  Node.m
//  AlgoTests
//
//  Created by Tim Harris on 1/12/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "Node.h"

@implementation Node

@synthesize key=_key, successor=_successor, predecessor=_predecessor;


-(id)initWithKey:(NSNumber *)newKey{
    self = [super init];
    if (self) {
        [self setKey:newKey];
    }
    return self;
}

-(void)printNode{
    NSLog(@"%@", _key);
}
-(NSString *)description{
    return [NSString stringWithFormat:@"%@",_key];
}
@end
