//
//  Stack.h
//  AlgoTests
//
//  Created by Tim Harris on 1/12/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;

@interface Stack : NSObject{
    Node * top;
}

@property Node *top;

-(id)init;
-(id)initWithKeys:(NSArray*)keys;
-(BOOL)stackEmpty;
-(void)push:(NSNumber*) key;
-(Node*)pop;

@end
