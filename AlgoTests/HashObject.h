//
//  HashObject.h
//  AlgoTests
//
//  Created by Tim Harris on 1/13/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashObject : NSObject{
    NSNumber * key;
    NSString * value;
}
@property NSNumber* key;
@property NSString *value;
-(id)initWithKey:(NSNumber*) aKey andValue:(NSString*) aValue;
-(NSString *)description;
@end
