//
//  BlogPost.h
//  Carangos
//
//  Created by Erich Egert on 4/12/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Autor.h"

@interface BlogPost : NSObject

@property (nonatomic, strong) NSString *mensagem;
@property (nonatomic, strong) Autor *autor;

-(id) initWithMensagem: (NSString*) mensagem andAutor: (Autor*) autor;

@end
