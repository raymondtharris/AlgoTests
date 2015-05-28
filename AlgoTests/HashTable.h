//
//  HashTable.h
//  AlgoTests
//
//  Created by Tim Harris on 1/13/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HashObject;

@interface HashTable : NSObject{
    NSMutableArray * Table;
}
@property NSMutableArray *Table;
@property NSNumber *length;
@property BOOL fixed;

-(id)init;
-(id)initWithMaxIndex:(NSNumber*) maxIndex;

#pragma mark - Direct Addressing Array
-(HashObject*)directAddressSearch:(NSNumber*) key;
-(void)directAddressInsert:(HashObject*) newObj;
-(void)directAddressDelete:(HashObject*) objToDelete;

#pragma mark - Chaining Hash Table
-(void)chainedHashInsert:(HashObject*) newObj;
-(HashObject*)chainedHashSearh:(NSNumber*) key;
-(void)chainedHashDelete:(HashObject*) objToDelete;

-(NSString *)description;

@end
