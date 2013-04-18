//
//  BlogPost.h
//  Carangos
//
//  Created by Erich Egert on 4/18/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Autor.h"

@interface BlogPost : NSManagedObject

@property (nonatomic, retain) NSString * mensagem;
@property (nonatomic, retain) Autor *autor;

+(BlogPost*) blogPostWithMensagem: (NSString*) mensagem andAutor: (Autor*) autor andDetachedFromContext:(NSManagedObjectContext*) ctx;

@end
