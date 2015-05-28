//
//  Heap.m
//  AlgoTests
//
//  Created by Tim Harris on 1/10/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "Heap.h"

@implementation Heap

@synthesize keyArray=_keyArray, heapsize =_heapsize; //synthesize the two properties in the heap


-(id)initWithArray:(NSArray *)newArray{
    self = [super init];
    if (self) {
        
        // allocation for keyArray and init with the NSArray passed in to the function
        _keyArray = [[NSMutableArray alloc] initWithArray:newArray];
        
        // setting the heapsize to the count of the keyArray
        _heapsize = (int)_keyArray.count;
    }
    
    return self; 
}

@end
