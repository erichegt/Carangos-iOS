//
//  PopulaBanco.h
//  Carangos
//
//  Created by Erich Egert on 3/5/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PopulaBanco : NSObject

+(void) executa: (NSManagedObjectContext*) ctx andSaveAction:(void (^)(bool ok))block;

@end
