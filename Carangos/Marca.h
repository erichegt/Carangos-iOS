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

+(Marca*) marcaWithContext: (NSManagedObjectContext*) ctx andNome: (NSString*) nome;

+(Marca*) marcaWithContext: (NSManagedObjectContext*) ctx andNome: (NSString*) nome attached: (BOOL) attached;

+(NSArray*) todosWithContext: (NSManagedObjectContext*) ctx;

@end
