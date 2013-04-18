//
//  Marca.m
//  Pods
//
//  Created by Erich Egert on 3/1/13.
//
//

#import "Marca.h"
#import "NSManagedObject+ComFacilitadores.h"


@implementation Marca

@dynamic nome;

+(Marca*) marcaWithNome: (NSString*) nome andDetachedFromContext: (NSManagedObjectContext*) ctx{
    Marca *nova = (Marca*)[self detachedManagedObjectWithContext:ctx];
    [nova setNome:nome];
    
    return nova;
}

+(Marca*) marcaWithNome: (NSString*) nome andFromContext: (NSManagedObjectContext*) ctx{
    Marca *nova = (Marca*)[self managedObjectWithContext:ctx];
    [nova setNome:nome];
    
    return nova;
}

+(NSArray*) todosWithContext: (NSManagedObjectContext*) ctx {
    return [self allWithContext:ctx];
}

-(NSString*) description {
    return [self nome];
}

@end
