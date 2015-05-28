//
//  Node.h
//  AlgoTests
//
//  Created by Tim Harris on 1/12/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject{
    NSNumber * key;
    Node * successor, *predecessor;
}

@property NSNumber *key;
@property Node * successor, *predecessor;

-(id)initWithKey:(NSNumber*)newKey;
-(void)printNode;
@end
