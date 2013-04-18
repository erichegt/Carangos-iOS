//
//  Autor.m
//  Carangos
//
//  Created by Erich Egert on 4/18/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "Autor.h"
#import "NSManagedObject+ComFacilitadores.h"


@implementation Autor

@dynamic nome;
@dynamic avatar;

+(Autor*) autorWithNome: (NSString*) nome andAvatar: (NSString*) avatar andDetachedFromContext:(NSManagedObjectContext*) ctx{
    Autor *a = (Autor*)[self detachedManagedObjectWithContext:ctx];
    [a setNome:nome];
    [a setAvatar:avatar];
    
    return a;
}

@end
