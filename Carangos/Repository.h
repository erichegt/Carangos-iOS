//
//  Repository.h
//  Carangos
//
//  Created by Erich Egert on 3/1/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Repository : NSObject

-(id) initWithClassName: (NSString*) className;

-(NSFetchRequest*) createFetch:(NSManagedObjectContext*) context;

-(NSManagedObject*) managedObjectWithContext:(NSManagedObjectContext*) context;

@end
