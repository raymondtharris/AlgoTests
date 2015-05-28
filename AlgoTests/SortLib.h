//
//  SortLib.h
//  AlgoTests
//
//  Created by Tim Harris on 12/29/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//



#import <Foundation/Foundation.h>
@class Heap;

@interface SortLib : NSObject

@property NSNumber* heapsize;

-(NSMutableArray*)InsertionSort:(NSMutableArray*)Arr;

-(NSMutableArray*)MergeSort:(NSMutableArray*) Arr atKey:(int) key withLength:(int) length;
-(NSMutableArray*)Merge:(NSMutableArray*)Arr begining:(int) first end:(int) last current:(int) key;

-(NSMutableArray*)BubbleSort:(NSMutableArray*)Arr;

-(NSMutableArray*)MaxCrossingSubarray:(NSMutableArray*) Arr withLow:(int) low andMid:(int) mid andHigh:(int) high;
-(NSMutableArray*) findMaxSubArray:(NSMutableArray*) Arr withLow:(int) low andHigh:(int) high;

-(NSMutableArray*) permuteBySorting:(NSMutableArray*) Arr;
-(NSMutableArray*) sortArray:(NSMutableArray*) Arr withPermuteKeys:(NSMutableArray*) permuteKeys;

-(NSMutableArray*)radomizeInPlace:(NSMutableArray*) Arr;

-(NSMutableArray*) maxHeapify:(NSMutableArray*) Arr atIndex:(int) index;
-(NSMutableArray*) buildMaxHeap:(NSMutableArray*) Arr;
-(NSMutableArray*) HeapSort:(NSMutableArray*) Arr;
-(NSNumber *)heapsize;
-(void)setHeapsize:(NSNumber *)heapsize;
-(NSNumber*)heapMaximum:(NSMutableArray*) Arr;
-(NSNumber*)heapExtractMax:(NSMutableArray*) Arr;
-(void) heapIncreaseKey:(NSMutableArray*) Arr atIndex:(int) index withKey:(NSNumber*) key;
-(void)maxHeapInsert:(NSMutableArray*) Arr withKey:(NSNumber*) key;

-(void) Quicksort:(NSMutableArray*) Arr withFirst:(int) first andLast:(int) last;
-(int) Partition:(NSMutableArray*) Arr withFirst:(int) first andLast:(int) last;
-(int) randomizedPartion:(NSMutableArray*) Arr withFirst:(int) first andLast:(int) last;
-(void)randomizedQuicksort:(NSMutableArray*) Arr withFirst:(int) first andLast:(int) last;

-(void)Countingsort:(NSMutableArray*) Arr withOutputArray:(NSMutableArray*) Arr2 andKey:(int) key;

-(void)Radixsort:(NSMutableArray*) Arr withDigits:(int) digits;

-(void)Bucketsort:(NSMutableArray*) Arr;

-(id) Minimum:(NSMutableArray*) Arr;

-(NSNumber*) randomizedSelect:(NSMutableArray *) Arr withFirst:(int) first andLast:(int) last andIndex:(int) index;

@end
