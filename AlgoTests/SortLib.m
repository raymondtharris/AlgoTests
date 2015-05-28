//
//  SortLib.m
//  AlgoTests
//
//  Created by Tim Harris on 12/29/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import "SortLib.h"
#import "Heap.h"

@implementation SortLib

@synthesize heapsize = _heapsize;

#pragma mark - Insertion Sort

-(NSMutableArray*)InsertionSort:(NSMutableArray*)Arr{
    int temp;
    for (int j = 1; j<Arr.count; j++) {
        temp = [Arr[j] intValue];
        int i = j-1;
        while (i>-1 && [Arr[i]intValue] > temp) {
            
            [Arr setObject:Arr[i] atIndexedSubscript:i+1];
            i=i-1;
        }
        [Arr setObject:[NSNumber numberWithInt:temp] atIndexedSubscript:i+1];
    }
    return Arr;
}

#pragma mark - Merge Sort

-(NSMutableArray*)Merge:(NSMutableArray*)Arr begining:(int) first end:(int) last current:(int) key{
    int leftN = last - first +1;
    int rightN = key - last;
    
    NSMutableArray * lArr  = [[NSMutableArray alloc]init];
    NSMutableArray * rArr  = [[NSMutableArray alloc]init];
    int i ,j;
        
    for (i= 0; i< leftN; i++) {
        [lArr addObject: Arr[first+i-1]];
    }
    for ( j= 0; j< rightN; j++) {
        [rArr addObject: Arr[last+j]];
    }
    
    [lArr addObject:@INTMAX_MAX];
    [rArr addObject:@INTMAX_MAX];
        
    i=0;
    j=0;
        
    for (int k = first-1; k<key ; k++) {
        if (lArr[i] <= rArr[j]) {
            Arr[k] = lArr[i];
            i=i+1;
        }
        else{
            Arr[k] = rArr[j];
            j=j+1;
        }
    }
    return Arr;
}
-(NSMutableArray*)MergeSort:(NSMutableArray*) Arr atKey:(int) key withLength:(int) length{
    int q;
    if (key < length) {
        q = (length+key)/2;
        [self MergeSort:Arr atKey:key withLength:q];
        [self MergeSort:Arr atKey:(q+1) withLength:length];
        [self Merge:Arr begining:key end:q current:length];

    }
    return Arr;
}

#pragma mark - Bubble Sort

-(NSMutableArray *)BubbleSort:(NSMutableArray *)Arr{
    NSNumber *temp;
    for (int i = 0; i< Arr.count; i++) {
        for (int j = (int)Arr.count-1; j> i; j--) {
            if (Arr[j] < Arr[j-1]) {
                temp = Arr[j];
                Arr[j] = Arr[j-1];
                Arr[j-1] = temp;
            }
        }
    }
    return Arr;
}

#pragma mark - Max Subarray

-(NSMutableArray*)MaxCrossingSubarray:(NSMutableArray*) Arr withLow:(int) low andMid:(int) mid andHigh:(int) high{
    long leftSum  =-INTMAX_MAX;
    int sum = 0;
    int maxLeft, maxRight;
    for (int i = mid; i>low; i--) {
        sum = sum + [Arr[i] intValue];
        if (sum > leftSum) {
            leftSum = sum;
            maxLeft = i;
        }
    }
    long rightSum = -INTMAX_MAX;
    sum = 0;
    for (int j =mid+1; j< high; j++) {
        sum = sum + [Arr[j] intValue];
        if (sum > rightSum) {
            rightSum = sum;
            maxRight = j;
        }
    }
    
    NSMutableArray* Arr2 = [NSMutableArray array];
    [Arr2 addObject:[NSNumber numberWithInt:maxLeft]];
    [Arr2 addObject:[NSNumber numberWithInt:maxRight]];
    [Arr2 addObject:[NSNumber numberWithLongLong:leftSum+rightSum]];

    return Arr2;
}

-(NSMutableArray*) findMaxSubArray:(NSMutableArray*) Arr withLow:(int) low andHigh:(int) high{
    if (low == high) {
        NSMutableArray *Arr2 = [NSMutableArray array];
        [Arr2 addObject:[NSNumber numberWithInt:low]];
        [Arr2 addObject:[NSNumber numberWithInt:high]];
        [Arr2 addObject:[NSNumber numberWithInt:[Arr[low] intValue]]];
        return Arr2;
    }
    else{
        int mid = (low +high)/2;
        NSMutableArray *lArr = [self findMaxSubArray:Arr withLow:low andHigh:mid];
        NSMutableArray *rArr = [self findMaxSubArray:Arr withLow:mid+1 andHigh:high];
        NSMutableArray *cArr = [self MaxCrossingSubarray:Arr withLow:low andMid:mid andHigh:high];

        if ([lArr[2] intValue] >= [rArr[2] intValue] && [lArr[2] intValue] >= [cArr[2] intValue]) {
            return lArr;
        }
        else if ([rArr[2] intValue] >= [lArr[2] intValue] && [rArr[2] intValue] >= [cArr[2] intValue]){
            return rArr;
        }
        else {
            return cArr;
        }
    }
}

#pragma mark - Permute By Sorting

-(NSMutableArray *)permuteBySorting:(NSMutableArray *)Arr{
    
    NSMutableArray *permuteKeys = [[NSMutableArray alloc]init];
    for (int i = 0; i< Arr.count; i++) {
        int temp = arc4random_uniform(pow(Arr.count, 3)) + 1;
        [permuteKeys addObject: [NSNumber numberWithInt:temp] ];
    }
    //NSLog(@"%@", permuteKeys);
    //Sort Array By Permute
    Arr = [self sortArray:Arr withPermuteKeys:permuteKeys];
    return Arr;
}

-(NSMutableArray *)sortArray:(NSMutableArray *)Arr withPermuteKeys:(NSMutableArray *)permuteKeys{
    //using bubble sort will be changed to quicksort
   /* NSNumber *temp, *tempKey;
    for (int i = 0; i< Arr.count; i++) {
        for (int j = (int)Arr.count-1; j> i; j--) {
            if (permuteKeys[j] < permuteKeys[j-1]) {
                temp = Arr[j];
                Arr[j] = Arr[j-1];
                Arr[j-1] = temp;
                
                tempKey = permuteKeys[j];
                permuteKeys[j] = permuteKeys[j-1];
                permuteKeys[j-1] = tempKey;
                
            }
        }
    }
    */
    int temp;
    for (int j = 1; j<Arr.count; j++) {
        temp = [Arr[j] intValue];
        int i = j-1;
        while (i>-1 && [Arr[i]intValue] > temp) {
            
            [Arr setObject:Arr[i] atIndexedSubscript:i+1];
            i=i-1;
        }
        [Arr setObject:[NSNumber numberWithInt:temp] atIndexedSubscript:i+1];
    }
    

    return Arr;
}

-(NSMutableArray *)radomizeInPlace:(NSMutableArray *)Arr{
    NSNumber *temp;
    int tempIndex;
    for (int i= 0; i<Arr.count; i++) {
        tempIndex = arc4random_uniform((int)Arr.count);
        temp = Arr[i];
        Arr[i] = Arr[tempIndex];
        Arr[tempIndex] = temp;
        
    }
    return Arr;
}

#pragma mark - Heap Sort

-(int)parent:(int)i{
    return i/2;
}
-(int)left:(int)i{
    return 2*i;
}
-(int)right:(int)i{
    return 2*i + 1;
}



//+(int)heapsize:(NSMutableArray*) Arr{
   // return (int)Arr.count;
//}

-(NSNumber *)heapsize{
    return _heapsize;
}

-(void)setHeapsize:(NSNumber *)heapsize{
   // NSLog(@"%i", [heapsize intValue]);
    _heapsize = heapsize;
}



-(NSMutableArray*) maxHeapify:(NSMutableArray*) Arr atIndex:(int) index{
    //NSLog(@"in %i", index);
    //NSLog(@"%@ %@", Arr , [self heapsize]);
    
    int l = [self left:index];
    int r = [self right:index];
    //NSLog(@"l = %i  r = %i ", l,r );
    int largest;
    if (l <= [[self heapsize] intValue] && Arr[l-1] > Arr[index-1]) {
        //NSLog(@"l");
        largest = l;
        //NSLog(@"l %i", largest);
    }
    else{
        //NSLog(@"else");
        largest = index;
    }
    if (r <= [[self heapsize] intValue]  && Arr[r-1] > Arr[largest-1]) {
        largest = r;
        //NSLog(@"r %i", largest);

    }
    if (largest != index) {
        NSNumber *temp;
        temp = Arr[index-1];
        Arr[index-1] = Arr[largest-1];
        Arr[largest-1] = temp;
        //NSLog(@"%i", largest);
        [self maxHeapify:Arr atIndex:largest];
    }
    
    return Arr;
}

-(NSMutableArray *)buildMaxHeap:(NSMutableArray *)Arr{
    [self setHeapsize:[NSNumber numberWithInteger: Arr.count]];
    for (int i = (int)Arr.count/2; i>0;  i--) {
        [self maxHeapify:Arr atIndex:i];
    }
    return Arr;
}


-(NSMutableArray *)HeapSort:(NSMutableArray *)Arr{
    
    [self buildMaxHeap:Arr];
    //NSLog(@"%@", Arr);

    //int n = 1;
    for (int i = (int)Arr.count; i>1; i--) {
        //NSLog(@"%@", Arr);

        NSNumber * temp;
        temp = Arr[0];
        Arr[0] = Arr[i-1];
        Arr[i-1] = temp;
        //Arr.count = Arr.count -1;
        int t = [[self heapsize] intValue];
        [self setHeapsize:[NSNumber numberWithInteger:t - 1]];
        [self maxHeapify:Arr atIndex:1];
        //n++;
    }
    return Arr;
}

-(NSNumber *)heapMaximum:(NSMutableArray *)Arr{
    return Arr[0];
}
-(NSNumber *)heapExtractMax:(NSMutableArray *)Arr{
    NSNumber *max;
    [self setHeapsize:[ NSNumber numberWithInteger: Arr.count ]];
    if ([[self heapsize] intValue]< 1) {
        NSLog(@"heap underflow");
    }
    
        max = Arr[0];
        Arr[0] = Arr[[self.heapsize intValue] -1];
        [Arr removeObjectAtIndex:[[self heapsize] intValue] -1] ;
        [self setHeapsize: [NSNumber numberWithInteger:[[self heapsize] intValue] -1]];
    
        //NSLog(@"%@", [self heapsize]);
        [self maxHeapify:Arr atIndex:1];
        return max;
    
    //return max;
}

-(void)heapIncreaseKey:(NSMutableArray *)Arr atIndex:(int)index withKey:(NSNumber *)key{
    if ([key intValue] < [Arr[index-1] intValue]) {
        NSLog(@"new key is smaller than current key");
    }
    Arr[index-1] = key;
    //NSLog(@"%@  %@", Arr[index-1], Arr);
    //NSLog(@"%i", [self parent:index]);
    while (index >1 && Arr[[self parent:index]] < Arr[index-1]) {
        //NSLog(@"%@", Arr);
        NSNumber *temp;
        temp = Arr[index-1];
        Arr[index-1] = Arr[[self parent:index]-1];
        Arr[[self parent:index]-1]  = temp;
        index = [self parent:index];
    }
    
}

-(void)maxHeapInsert:(NSMutableArray *)Arr withKey:(NSNumber *)key{
    [self setHeapsize: [NSNumber numberWithInt:(int)Arr.count]];
    Arr[[[self heapsize] intValue]-1] = @-INTMAX_MAX;
    [self heapIncreaseKey:Arr atIndex: [[self heapsize] intValue] withKey:key];
    
    
}

#pragma mark - Quick Sort

-(void)Quicksort:(NSMutableArray *)Arr withFirst:(int)first andLast:(int)last{
    int mid;
    if (first < last) {
        mid = [self Partition:Arr withFirst:first andLast:last];
        [self Quicksort:Arr withFirst:first andLast:mid-1];
        [self Quicksort:Arr withFirst:mid+1 andLast:last];
    }
}

-(int)Partition:(NSMutableArray *)Arr withFirst:(int)first andLast:(int)last{
    NSNumber * temp = Arr[last-1];
    int i = first-1;
    for (int j =  first; j < last; j++) {
        if ([Arr[j-1] intValue] <= [temp intValue] ) {
            i = i+1;

            NSNumber *tempNum;
            tempNum = Arr[i-1];
            Arr[i-1] = Arr[j-1];
            Arr[j-1] = tempNum;
        }
    }
    NSNumber * tempNum2;
    tempNum2 = Arr[i];
    Arr[i] = Arr[last-1];
    Arr[last-1] = tempNum2;
    return i+1;
}


-(int)randomizedPartion:(NSMutableArray *)Arr withFirst:(int)first andLast:(int)last{
    int i = arc4random_uniform(last)+first;
    //NSLog(@"%i", i);
    if (i> last) {
        i = last;
    }
    NSNumber *temp;
    temp = Arr[i-1];
    Arr[i-1] = Arr[last-1];
    Arr[last-1] = temp;
    return [self Partition:Arr withFirst:first andLast:last];
}

-(void)randomizedQuicksort:(NSMutableArray *)Arr withFirst:(int)first andLast:(int)last{
    int mid;
    if (first< last) {
        mid = [self randomizedPartion:Arr withFirst:first andLast:last];
        [self randomizedQuicksort:Arr withFirst:first andLast:mid-1];
        [self randomizedQuicksort:Arr withFirst:mid+1 andLast:last];
    }
}

#pragma  mark - Counting Sort

-(void)Countingsort:(NSMutableArray *)Arr withOutputArray:(NSMutableArray *)Arr2 andKey:(int)key{
    NSMutableArray *Arr3 = [[NSMutableArray alloc]init];
    for (int i = 0; i<= key; i++) {
        [Arr3 addObject:[NSNumber numberWithInt:0]];
    }
    for (int j = 1; j <= Arr.count; j++) {
        int temp = [Arr[j-1] intValue];
        Arr3[temp] = [NSNumber numberWithInt: [Arr3[temp] intValue] +1];
        [Arr2 addObject:[NSNumber numberWithInt:0]];
    }
    for (int i=1; i<=key; i++) {
        Arr3[i] = [NSNumber numberWithInt: [Arr3[i] intValue] + [Arr3[i-1] intValue]];
    }
    for (int j = (int)Arr.count; j>=1; j--) {
        int Aj = [Arr[j-1] intValue];
        int CAj = [Arr3[Aj] intValue];
        
        Arr2[CAj-1] = [NSNumber numberWithInt:Aj];
        
        Arr3[Aj] = [NSNumber numberWithInt: CAj - 1];

    }
}

#pragma mark - Radix Sort

-(void)Radixsort:(NSMutableArray *)Arr withDigits:(int)digits{
    for (int i = 1; i<= digits; i++) {
        //NSLog(@"%i", i);
        //using bubble currently
        NSNumber *temp;
        for (int a = 0; a< Arr.count; a++) {
            for (int j = (int)Arr.count-1; j> a; j--) {
                if ([Arr[j] intValue] % (int)pow(10, i)  <  [Arr[j-1] intValue] % (int)pow(10, i) ) {
                    temp = Arr[j];
                    Arr[j] = Arr[j-1];
                    Arr[j-1] = temp;
                }
            }
        }
        //NSLog(@"%@", Arr);
    }
}

-(void)Bucketsort:(NSMutableArray *)Arr{
    NSMutableArray *Arr2 = [[NSMutableArray alloc] init];
    int length = (int)Arr.count;
    for (int i = 0; i<=length-1; i++) {  // create buckets
        NSMutableArray *list = [[NSMutableArray alloc]init];
        [Arr2 addObject:list];
    }
    for (int i = 1; i<=length; i++) { // insert values in buckets
        int temp = (int) floorf(length *[Arr[i-1] doubleValue]);
        [Arr2[temp] addObject:Arr[i-1]];
    }
    for (int i = 0; i<=length-1; i++) { //Sorting buckets
        NSMutableArray *ArrT = Arr2[i];
        float temp;
        for (int j = 1; j< [ArrT count]; j++) {
            temp = [ArrT[j] floatValue];
            int k = j-1;
            while (k >-1 && [ArrT[k] floatValue] > temp) {
                [ArrT setObject:ArrT[k] atIndexedSubscript:k+1];
                k=k-1;
            }
            [ArrT setObject:[NSNumber numberWithFloat:temp] atIndexedSubscript:k+1];
        }
    }
    int key = 0;
    for (int i = 0; i< length; i++) { // insert sorted buckets in to the array
        NSMutableArray *ArrT = Arr2[i];
        for (NSNumber * num in ArrT) {
            Arr[key] = num;
            key++;
        }
    }
    
}

-(id)Minimum:(NSMutableArray *)Arr{
    id min = Arr[0];
    int myType;
    if (strcmp([Arr[0] objCType], @encode(int)) == 0) {
        //NSLog(@"int");
        myType = 1;
    }
    else if (strcmp([Arr[0] objCType], @encode(float)) == 0){
        //NSLog(@"float");
        myType = 2;
    }
    else if (strcmp([Arr[0] objCType], @encode(double)) == 0){
        //NSLog(@"double");
        myType = 3;
    }
    else
        NSLog(@"none");
    
    for (int i =2; i<= Arr.count; i++) {
        switch (myType ) {
            case 1:
                if ([min intValue] < [Arr[i-1] intValue]) {
                    min = Arr[i-1];
                }
                break;
            case 2:
                if ([min floatValue] < [Arr[i-1] floatValue]) {
                    min = Arr[i-1];
                }
                break;
            case 3:
                if ([min doubleValue] < [Arr[i-1] doubleValue]) {
                    min = Arr[i-1];
                }
                break;
            default:
                break;
        }
        
    }
    
    NSLog(@"%@", min);
    return min;
}

-(NSNumber *)randomizedSelect:(NSMutableArray *)Arr withFirst:(int)first andLast:(int)last andIndex:(int)index{
    if (first == last) {
        return Arr[first-1];
    }
    int mid = [self randomizedPartion:Arr withFirst:first andLast:last];
    int  key = mid - first + 1;
    if (index == key) {
        return Arr[mid-1];
    }
    else if (index < key){
        return [self randomizedSelect:Arr withFirst:first andLast:mid -1 andIndex:index];
    }
    else{
        return [self randomizedSelect:Arr withFirst:mid+1 andLast:last andIndex:index-key];
    }
}


@end
