//
//  HashNode.m
//  AlgoTests
//
//  Created by Tim Harris on 1/14/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "HashNode.h"
#import "HashObject.h"

@implementation HashNode
@synthesize obj = _obj;

-(NSString *)description{
    return [NSString stringWithFormat:@"(%i : %@)", [[self key] intValue], [_obj value] ];
}

@end
