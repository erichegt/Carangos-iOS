//
//  Automovel.m
//  Carangos
//
//  Created by Erich Egert on 3/1/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "Automovel.h"
#import "NSManagedObject+ComFacilitadores.h"


@implementation Automovel

@dynamic ano, cor, modelo;


+(Automovel*) automovelWithContext: (NSManagedObjectContext*) ctx
                         andModelo: (ModeloDeAutomovel*) modelo
                            andCor: (NSString*) cor
                            andAno: (int) ano {
    
    Automovel *automovel = (Automovel*) [Automovel managedObjectWithContext:ctx andClassName:@"Automovel"];
    
    [automovel setModelo:modelo];
    [automovel setCor:cor];
    [automovel setAno:[NSNumber numberWithInt:ano]];
    
    return automovel;
}

-(NSString*) description {
    return [[self modelo] description];
}

@end
