//
//  HashObject.m
//  AlgoTests
//
//  Created by Tim Harris on 1/13/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "HashObject.h"

@implementation HashObject

@synthesize key=_key, value=_value;
-(id)initWithKey:(NSNumber *)aKey andValue:(NSString *)aValue{
    self = [super init];
    if (self) {
        _key = aKey;
        _value = aValue;
    }
    return self;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"(%@ : %@)", _key, _value];
}


@end
