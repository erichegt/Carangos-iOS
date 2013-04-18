//
//  BlogPost.m
//  Carangos
//
//  Created by Erich Egert on 4/18/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "BlogPost.h"
#import "NSManagedObject+ComFacilitadores.h"


@implementation BlogPost

@dynamic mensagem;
@dynamic autor;

+(BlogPost*) blogPostWithMensagem: (NSString*) mensagem andAutor: (Autor*) autor andDetachedFromContext:(NSManagedObjectContext*) ctx{
    BlogPost *post = (BlogPost*)[self detachedManagedObjectWithContext:ctx];
    
    [post setMensagem:mensagem];
    [post setAutor:autor];
    
    return post;
}

@end
