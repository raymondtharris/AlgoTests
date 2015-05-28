//
//  main.m
//  AlgoTests
//
//  Created by Tim Harris on 12/29/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SortLib.h"
#import "Heap.h"

#import "Stack.h"
#import "Queue.h"
#import "Node.h"

#import "HashObject.h"
#import "HashTable.h"
#import "LinkList.h"

#import "GraphNode.h"
#import "Graph.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        /*
        NSMutableArray *Arr = [[NSMutableArray alloc]initWithArray:@[@2,@4,@5,@7,@1,@8,@3,@6]];
        NSMutableArray *Arr2 = [[NSMutableArray alloc]initWithArray:@[@7,@3,@2,@4,@1]];
        NSMutableArray *Arr3 = [[NSMutableArray alloc] initWithArray:@[@13, @-3, @-25, @20, @-3, @-16, @-23, @18, @20, @-7, @12, @-5, @-22, @15, @-4, @7]];
        NSMutableArray *Arr4= [[NSMutableArray alloc] initWithArray:@[@16, @4, @10, @14, @7,@9, @3, @2, @8, @1]];
        NSMutableArray *Arr5 = [[NSMutableArray alloc ] initWithArray:@[@4,@1,@3,@2,@16,@9,@10,@14,@8,@7]];
        NSMutableArray *Arr6 = [[NSMutableArray alloc] initWithArray:@[@2,@8,@7,@1,@3,@5,@6,@4]];
        
        Heap *myHeap = [[Heap alloc]initWithArray:@[@4,@1,@3,@2,@16,@9,@10,@14,@8,@7]];
        
        NSMutableArray *Arr7 = [[NSMutableArray alloc] initWithArray:@[@2,@5,@3,@0,@2,@3,@0,@3]];
        NSMutableArray *Arr8 = [[NSMutableArray alloc]init];
        
        NSMutableArray *Arr9 = [[NSMutableArray alloc]initWithArray:@[@329,@457,@657,@839,@436,@720,@335]];

        NSMutableArray *Arr10 = [[NSMutableArray alloc] initWithArray:@[@.78,@.17,@.39,@.26,@.72,[NSNumber numberWithFloat:.94],@.21,@.12,@.23,@.68]];
        
        SortLib *Sorter = [[SortLib alloc]init];
         
         */
        //Arr = [SortLib InsertionSort:Arr];
       // NSLog(@"%lu", (unsigned long)Arr.count);
        //Arr = [SortLib MergeSort:Arr atKey:1 withLength:Arr.count];
        //Arr = [SortLib BubbleSort:Arr];
        //Arr3 = [SortLib findMaxSubArray:Arr3 withLow:0 andHigh:(int)Arr3.count-1 ];
        //NSLog(@"Final: %i, %i, %i", [Arr3[0] intValue] ,[Arr3[1] intValue] ,[Arr3[2] intValue]);
        //Arr2 = [SortLib permuteBySorting:Arr2];
       // Arr2 = [SortLib radomizeInPlace:Arr2];
        //[Sorter setHeapsize:[NSNumber numberWithInt: (int)Arr4.count]];
        
        //[Sorter maxHeapify:Arr4 atIndex:2];
        //[Sorter buildMaxHeap:Arr5];
        //[Sorter HeapSort:Arr5];
        //NSNumber * max = [Sorter heapExtractMax:Arr5];
        //[Sorter heapIncreaseKey:Arr5 atIndex:9 withKey:@15];
        //[Sorter maxHeapInsert:Arr5 withKey:@15];
        //[Sorter Quicksort:Arr6 withFirst:1 andLast:(int)Arr6.count];
        //[Sorter randomizedQuicksort:Arr6 withFirst:1 andLast:(int)Arr6.count];
        //NSLog(@"%@", Arr6);
        //[Sorter Countingsort:Arr7 withOutputArray:Arr8 andKey:5];
        //[Sorter Radixsort:Arr9 withDigits:3];

        //[Sorter Bucketsort:Arr10];
        //NSLog(@"%@", Arr10);
        
        //[Sorter Minimum:Arr5];

        //int val = [[Sorter randomizedSelect:Arr5 withFirst:1 andLast: (int)Arr5.count andIndex:1] intValue];
        //NSLog(@"%i", val);
       /*
        NSLog(@"\n\nStack");
        Stack *myStack = [[Stack alloc]initWithKeys:@[@3,@5,@1,@6,@8,@7,@10]];
        Node * curr = [myStack top];
        while ([curr predecessor] !=nil) {
            curr= [myStack pop];
            [curr printNode];
        }
        NSLog(@"\n\nQueue");
        Queue *myQueue = [[Queue alloc] initWithKeys:@[@6,@4,@8,@1]];
        curr = [myQueue Head];
        while ([curr successor] != nil) {
            curr = [myQueue dequeue];
            [curr printNode];
            
        }
        */
        /*
        LinkList *tList = [[LinkList alloc] init];
        
        Node *l1 =[[Node alloc]initWithKey:@12];
        [tList insertNode:l1];
        Node *l2 = [[Node alloc] initWithKey:@20];
        [tList insertNode:l2];
        
        [tList printList];
        */
        /*
        HashTable *myHash = [[HashTable alloc]init];
        
        [myHash chainedHashInsert:[[HashObject alloc] initWithKey:@12 andValue:@"hey"]];
        [myHash chainedHashInsert:[[HashObject alloc] initWithKey:@20 andValue:@"blasters"]];
        [myHash chainedHashInsert:[[HashObject alloc] initWithKey:@6 andValue:@"hey"]];
        [myHash chainedHashInsert:[[HashObject alloc] initWithKey:@14 andValue:@"hey"]];
        [myHash chainedHashInsert:[[HashObject alloc] initWithKey:@22 andValue:@"hey"]];
        [myHash chainedHashInsert:[[HashObject alloc] initWithKey:@50 andValue:@"hey"]];
        [myHash chainedHashInsert:[[HashObject alloc] initWithKey:@32 andValue:@"hey"]];


        NSLog(@"%@", myHash);
        
        NSLog(@"%@", [myHash chainedHashSearh:@20]);
        
        HashTable *h2 = [[HashTable alloc] initWithMaxIndex:@20];
        NSLog(@"%@", h2);
        */
        
        GraphNode *g1 = [[GraphNode alloc]initWithKey:@4];
        GraphNode *g2 = [[GraphNode alloc]initWithKey:@1];
        GraphNode *g3 = [[GraphNode alloc]initWithKey:@3];
        GraphNode *g4 = [[GraphNode alloc]initWithKey:@8];
        GraphNode *g5 = [[GraphNode alloc]initWithKey:@6];
        
        Graph *gr =[[Graph alloc]init];
        
        [gr insertVertex:g1];
        [gr insertVertex:g2];
        [gr insertVertex:g3];
        [gr insertVertex:g4];
        [gr insertVertex:g5];
        
        [gr insertEdge:g2 connectingToVertex:g1];
        
        [gr insertEdge:g3 connectingToVertex:g4];
        [gr insertEdge:g3 connectingToVertex:g1];
        
        [gr insertEdge:g4 connectingToVertex:g3];
        
        [gr insertEdge:g1 connectingToVertex:g2];
        [gr insertEdge:g1 connectingToVertex:g3];
        
        [gr insertEdge:g5 connectingToVertex:g4];
        [gr insertEdge:g4 connectingToVertex:g5];
        
       // NSLog(@"%@", gr);
        [gr BreadthFirstSearch:(GraphNode*)[gr.vertexList[2] Head]];
        //[gr DepthFirstSearch];
        NSLog(@"%@", gr.descriptionBFS);
        
    }
    return 0;
}
