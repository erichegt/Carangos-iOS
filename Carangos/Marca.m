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

+(Marca*) marcaWithContext: (NSManagedObjectContext*) ctx andNome: (NSString*) nome{
    Marca *marca = (Marca*) [Marca managedObjectWithContext:ctx andClassName:@"Marca"];
    [marca setNome:nome];
    
    return marca;
}

+(Marca*) marcaWithContext: (NSManagedObjectContext*) ctx andNome: (NSString*) nome attached: (BOOL) attached {
    Marca *marca = (Marca*) [Marca managedObjectWithContext:ctx andClassName:@"Marca" attached: attached];
    [marca setNome:nome];
    
    return marca;
}

-(NSString*) description {
    return [self nome];
}


+(NSArray*) todosWithContext: (NSManagedObjectContext*) ctx {
    NSFetchRequest *fetch = [Marca createFetch:ctx andClassName:@"Marca"];
    
    return [ctx executeFetchRequest:fetch error:nil];
}



@end
