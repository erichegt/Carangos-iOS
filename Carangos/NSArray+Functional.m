//
//  NSArray+Functional.m
//  Carangos
//
//  Created by Erich Egert on 4/16/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "NSArray+Functional.h"

@implementation NSArray (Functional)

-(NSArray *)map:(id (^)(id obj))block;
{
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:self.count];
    for ( id obj in self ) [newArray addObject:block(obj)];
    return newArray;
}

-(NSArray *)filter:(BOOL (^)(id obj))block {
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for ( id obj in self ) {
        if (block(obj)) [newArray addObject:obj];
    }
    return newArray;
}


@end
