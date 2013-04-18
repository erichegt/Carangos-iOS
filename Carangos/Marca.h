//
//  Marca.h
//  Pods
//
//  Created by Erich Egert on 3/1/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Marca : NSManagedObject

@property (nonatomic, retain) NSString * nome;

+(Marca*) marcaWithNome: (NSString*) nome andDetachedFromContext: (NSManagedObjectContext*) ctx;

+(Marca*) marcaWithNome: (NSString*) nome andFromContext: (NSManagedObjectContext*) ctx;

+(NSArray*) todosWithContext: (NSManagedObjectContext*) ctx;

@end
