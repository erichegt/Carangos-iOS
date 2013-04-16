//
//  Pagina.m
//  Carangos
//
//  Created by Erich Egert on 4/16/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "Pagina.h"

@interface Pagina() {
    int numero;
    int tamanho;
}

@end

@implementation Pagina

-(id) init {
    self = [super init];
    if (self) {
        numero = 1;
        tamanho = 15;
    }
    return self;
}

-(void) proxima {
    numero++;
}

-(NSString*) description {
    return [NSString stringWithFormat:@"pagina.tamanho=%d&pagina.numero=%d", tamanho, numero];
}

@end
