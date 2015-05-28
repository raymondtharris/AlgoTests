//
//  HashTable.m
//  AlgoTests
//
//  Created by Tim Harris on 1/13/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "HashTable.h"
#import "HashObject.h"
#import "LinkList.h"
#import "Node.h"
#import "HashNode.h"

@implementation HashTable

@synthesize Table=_Table, length=_length, fixed=_fixed;

-(id)init{
    self = [super init];
    if (self) {
        _Table = [[NSMutableArray alloc]init];
        _length = @0;
        _fixed = NO;
    }
    return self;
}

-(id)initWithMaxIndex:(NSNumber *)maxIndex{
    self = [super init];
    if (self) {
        _Table = [[NSMutableArray alloc] init];
        _length = maxIndex;
        _fixed = YES;
        for (int i = 0; i <= [maxIndex intValue]; i++) {
            [_Table addObject:[NSNull null]];
        }
    }
    return self;
}

-(HashObject*)directAddressSearch:(NSNumber *)key{
    return _Table[[key intValue]-1];
}

#pragma mark - Direct Address Table

-(void)directAddressInsert:(HashObject *)newObj{
    if ([[newObj key] intValue] >= [_length intValue]) {
        for (int i = [_length intValue]; i< [[newObj key] intValue]; i++) {
            [_Table addObject:[NSNull null]];
        }
        //NSLog(@"%@", _Table);
        [_Table insertObject:newObj atIndex:[[newObj key] intValue]];
        _length = [NSNumber numberWithInt:[[newObj key] intValue]];
    }
    else{
        [_Table replaceObjectAtIndex:[[newObj key] intValue] withObject:newObj];
    }
}

-(void)directAddressDelete:(HashObject *)objToDelete{
    _Table[[[objToDelete key] intValue]-1] = nil;
}

#pragma mark - Chained Hash Table

-(void)chainedHashInsert:(HashObject *)newObj{
    if ([self fixed]) {
        int hashedkey = [self hashkey:[newObj key]];
        
    }
    else{
        int hashedKey = [HashTable hashKey:[newObj key]];
        //NSLog(@"length: %@", _length);
        if (hashedKey > [_length intValue]) {
            //NSLog(@"hash key %i length: %@", hashedKey, _length);
            if (hashedKey >[_length intValue]+1) {
                for (int i = [_length intValue]; i< hashedKey; i++) {
                    //NSLog(@"%i", i);
                    [_Table addObject:[NSNull null]];
                }
            }
            //NSLog(@"Adding at %i" ,hashedKey);
            LinkList *newList = [[LinkList alloc] init];
            HashNode *newNode = [[HashNode alloc] initWithKey:[newObj key]];
            [newNode setObj:newObj];
            [newList insertNode:newNode];
            [_Table addObject: newList];
            //NSLog(@"Table count %i", (int)[_Table count]);
            //[newNode printNode];
            //[newList printList];
            _length = [NSNumber numberWithInt:hashedKey];
        }
        else{
            if ([_Table[hashedKey] isKindOfClass:[NSNull class]]) {
                //NSLog(@"Exisiting Adding at %i", hashedKey);
            
                LinkList *newList = [[LinkList alloc]init];
                HashNode *newNode = [[HashNode alloc] initWithKey:[newObj key]];
                [newNode setObj:newObj];
                [newList insertNode:newNode];
                [_Table replaceObjectAtIndex:hashedKey withObject:newList];
            
            }
            else{
                //NSLog(@"LL");
                LinkList *temp = _Table[hashedKey];
                HashNode *newNode = [[HashNode alloc] initWithKey:[newObj key]];
                [newNode setObj:newObj];
                [temp insertNode:newNode];
            
            }
        }
    
    //NSLog(@"%@", _Table);
    }
}

-(HashObject *)chainedHashSearh:(NSNumber *)key{
    HashObject *objToReturn;
    int hashedKey = [HashTable hashKey:key];
    LinkList *temp = _Table[hashedKey];
    HashNode *tNode = (HashNode*)[temp Search:key];
    objToReturn = [tNode obj];
    return objToReturn;
}

-(void)chainedHashDelete:(HashObject *)objToDelete{
    int hashKey = [HashTable hashKey:[objToDelete key]];
    if ([_Table[hashKey] isKindOfClass:[LinkList class]]) {
        LinkList *temp = _Table[hashKey];
        [temp deleteNode:[temp Search:[objToDelete key]]];
    }
    else{
        NSLog(@"NIL key");
    }
}

+(int)hashKey:(NSNumber *) key{
    return [key intValue] % 7;
}

-(int)hashkey:(NSNumber*) key{
    return [key intValue] % [_length intValue];
}

-(NSString *)description{
    NSString *returnString;
    NSMutableArray * tab = _Table;
    returnString = [NSString stringWithFormat:@"[\n"];
    NSString *lists = [NSString stringWithFormat:@""];
    for (int i=0; i<= [[self length] intValue]; i++) {
        LinkList *list =  tab[i];
        if (![tab[i] isKindOfClass:[NSNull class]]) {
            if (i== [[self length] intValue]) {
                lists = [NSString stringWithFormat:@"%@ %@\n", lists , list];
            }
            else
                lists = [NSString stringWithFormat:@"%@ %@,\n", lists , list];
        }
        else{
            if (i== [[self length] intValue]) {
                lists = [NSString stringWithFormat:@"%@ %@\n", lists , tab[i]];
            }
            lists = [NSString stringWithFormat:@"%@ %@,\n", lists , tab[i]];
        }
    }
    returnString = [NSString stringWithFormat:@"%@%@]", returnString, lists];

    return returnString;
}
@end
