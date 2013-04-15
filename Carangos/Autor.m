//
//  Autor.m
//  Carangos
//
//  Created by Erich Egert on 4/12/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "Autor.h"

@implementation Autor

@synthesize nome;


-(id) initWithNome: (NSString*) _nome {
    self = [self init];
    
    if (self) {
        [self setNome:_nome];
    }
    
    return self;
}

@end
