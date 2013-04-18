//
//  NSManagedObject+ComFacilitadores.h
//  Carangos
//
//  Created by Erich Egert on 4/17/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (ComFacilitadores)

+(NSManagedObject*) managedObjectWithContext:(NSManagedObjectContext*) context
                                andClassName: (NSString*) className;

+(NSFetchRequest*) createFetch:(NSManagedObjectContext*) context
                  andClassName: (NSString*) className;

+(NSManagedObject*) managedObjectWithContext:(NSManagedObjectContext*) context
                                andClassName: (NSString*) className attached: (BOOL) attached;


@end
