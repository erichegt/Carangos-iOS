//
//  NSArray+Functional.h
//  Carangos
//
//  Created by Erich Egert on 4/16/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Functional)

-(NSArray *)map:(id (^)(id obj))block;

-(NSArray *)filter:(BOOL (^)(id obj))block;

@end
