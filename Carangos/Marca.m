//
//  Marca.m
//  Pods
//
//  Created by Erich Egert on 3/1/13.
//
//

#import "Marca.h"


@implementation Marca

@dynamic nome;

+(Marca*) marcaWithContext: (NSManagedObjectContext*) ctx andNome: (NSString*) nome{
    Marca *marca = (Marca*) [Marca managedObjectWithContext:ctx andClassName:@"Marca"];
    [marca setNome:nome];
    
    return marca;
}



@end
