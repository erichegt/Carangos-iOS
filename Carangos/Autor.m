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
    Autor *novo = (Autor*)[self detachedManagedObjectWithContext:ctx];
    [novo setNome:nome];
    [novo setAvatar:avatar];
    
    return novo;
}

-(Autor*) salvaOuBuscaNoContext: (NSManagedObjectContext*) ctx {
    NSFetchRequest *fetch = [Autor createFetch:ctx];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nome = %@" argumentArray:@[ [self nome] ]];
    [fetch setPredicate:predicate];
    
    NSError *error;
    NSArray *result =[ctx executeFetchRequest:fetch error:&error];
    
    NSLog(@"Aeeeeeeeee: %@ ---> %@", result, error);
    
    if (result && [result objectAtIndex:0]) {
        return [result objectAtIndex:0];
    } else {
        [ctx insertObject:self];
        return self;
    }
}


@end
