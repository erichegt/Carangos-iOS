//
//  MarcaRepository.m
//  Carangos
//
//  Created by Erich Egert on 3/1/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "MarcaRepository.h"

@interface MarcaRepository()

@property (nonatomic, strong) NSManagedObjectContext* context;

@end

@implementation MarcaRepository

-(id) initWithContext: (NSManagedObjectContext*) ctx {
    self = [super initWithClassName:@"Marca"];
    if (self) {
        [self setContext:ctx];
    }
    return self;
}



@end
