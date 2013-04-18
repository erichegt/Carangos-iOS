//
//  Autor.h
//  Carangos
//
//  Created by Erich Egert on 4/18/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Autor : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * avatar;

+(Autor*) autorWithNome: (NSString*) nome andAvatar: (NSString*) avatar andDetachedFromContext:(NSManagedObjectContext*) ctx;

@end
