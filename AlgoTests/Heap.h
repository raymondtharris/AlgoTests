//
//  Heap.h
//  AlgoTests
//
//  Created by Tim Harris on 1/10/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 Heap data structure using an NSMutableArray to store the keys in the heap.
*/

@interface Heap : NSObject{
    NSMutableArray *keyArray;
    
}

@property int heapsize; // property to store the heapsize of the heap
@property NSMutableArray* keyArray; // property to quickly access the keyArray

-(id)initWithArray:(NSArray*) newArray; // function to init heap with an NSArray

@end
