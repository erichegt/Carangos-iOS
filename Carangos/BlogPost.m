//
//  BlogPost.m
//  Carangos
//
//  Created by Erich Egert on 4/12/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

@synthesize mensagem, autor;

-(id) initWithMensagem: (NSString*) _mensagem andAutor: (Autor*) _autor {
    self = [self init];
    
    if (self) {
        [self setMensagem:_mensagem];
        [self setAutor:_autor];
    }
    
    return self;
}

-(NSString*) description {
    return [self mensagem];
}

@end
