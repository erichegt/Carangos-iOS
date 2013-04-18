//
//  NSManagedObject+ComFacilitadores.m
//  Carangos
//
//  Created by Erich Egert on 4/17/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "NSManagedObject+ComFacilitadores.h"

@implementation NSManagedObject (ComFacilitadores)

+(NSManagedObject*) managedObjectWithContext:(NSManagedObjectContext*) context
                                andClassName: (NSString*) className{
    
    return [NSEntityDescription insertNewObjectForEntityForName: className
                                         inManagedObjectContext: context];
}

+(NSManagedObject*) managedObjectWithContext:(NSManagedObjectContext*) context
                                andClassName: (NSString*) className attached: (BOOL) attached{
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:className
                                              inManagedObjectContext:context];
    
    return [[NSManagedObject alloc] initWithEntity:entity
                    insertIntoManagedObjectContext:attached ? context : nil];
    
}

+(NSFetchRequest*) createFetch:(NSManagedObjectContext*) context
                  andClassName: (NSString*) className{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity =
    [NSEntityDescription entityForName: className inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    return fetchRequest;
}

@end
