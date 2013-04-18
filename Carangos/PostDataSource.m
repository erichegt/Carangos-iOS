//
//  PostDataSource.m
//  Carangos
//
//  Created by Erich Egert on 4/15/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "PostDataSource.h"
#import "Pagina.h"
#import "Autor.h"
#import "BlogPost.h"

@interface PostDataSource()

@property(nonatomic, unsafe_unretained) id<PostDelegate> delegate;
@property(nonatomic, strong) DataSource *dataSource;
@property(nonatomic, strong) Pagina *paginaAtual;
@property(nonatomic, unsafe_unretained) NSManagedObjectContext *context;

@end


@implementation PostDataSource

@synthesize delegate, dataSource;

-(id) initWithDelegate: (id<PostDelegate>) delegatePosts andContext: (NSManagedObjectContext*) ctx {
    self = [super init];
    
    if (self) {
        [self setPaginaAtual:[[Pagina alloc] init]];
        [self setDelegate:delegatePosts];
        [self setDataSource: [[DataSource alloc] initWithDelegate:self]];
        [self setContext:ctx];
    }
    
    return self;
}

-(void) buscaPosts {
    [self.dataSource inicializaConexao];
}

- (NSString *) getURL {
    return [NSString stringWithFormat:@"http://carangos.herokuapp.com/post/list?%@", [[self paginaAtual] description]];
}
- (void) parsearDados: (NSDictionary *) dados {
    NSMutableArray *posts = [[NSMutableArray alloc] init];
    
    for(NSDictionary *post in [dados objectForKey:@"list"]) {
        NSString *mensagemPost = [post objectForKey:@"mensagem"];
        NSString *nomeAutor = [[post objectForKey:@"autor"] objectForKey:@"nome"];
        //TODO pegar do JSON!!!
        NSString *avatarAutor = @"http://cinemagrafado.files.wordpress.com/2010/07/v-de-vinganca-2.jpg";
        
        Autor *autor = [Autor autorWithNome:nomeAutor andAvatar:avatarAutor andDetachedFromContext:[self context]];
        BlogPost *blogPost = [BlogPost blogPostWithMensagem:mensagemPost andAutor:autor andDetachedFromContext:[self context]];
        [posts addObject:blogPost];
    }
    
    [self.delegate recebePosts:posts];
    [[self paginaAtual] proxima];
}
- (void) problemaComunicacao {
    NSLog(@"DADOS DE RETORNO ZICA!!!!");
}


@end
