//
//  PostDataSource.m
//  Carangos
//
//  Created by Erich Egert on 4/15/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "PostDataSource.h"
#import "Pagina.h"

@interface PostDataSource()

@property(nonatomic, unsafe_unretained) id<PostDelegate> delegate;
@property(nonatomic, strong) DataSource *dataSource;
@property(nonatomic, strong) Pagina *paginaAtual;

@end


@implementation PostDataSource

@synthesize delegate, dataSource;

-(id) initWithDelegate: (id<PostDelegate>) delegatePosts {
    self = [super init];
    
    if (self) {
        [self setPaginaAtual:[[Pagina alloc] init]];
        [self setDelegate:delegatePosts];
        [self setDataSource: [[DataSource alloc] initWithDelegate:self]];
    }
    
    return self;
}

-(void) buscaPosts {
    [self.dataSource inicializaConexao];
}

- (NSString *) getURL {
    return [NSString stringWithFormat:@"http://23.21.248.134:8080/Carangus/post/list?%@", [[self paginaAtual] description]];
}
- (void) parsearDados: (NSDictionary *) dados {
    NSMutableArray *posts = [[NSMutableArray alloc] init];
    
    for(NSDictionary *post in [dados objectForKey:@"list"]) {
        NSString *nomeAutor = [[post objectForKey:@"autor"] objectForKey:@"nome"];
        Autor *autor = [[Autor alloc] initWithNome:nomeAutor];
        BlogPost *blogPost = [[BlogPost alloc] initWithMensagem:[post objectForKey:@"mensagem"] andAutor:autor];
        [posts addObject:blogPost];
    }
    
    [self.delegate recebePosts:posts];
    [[self paginaAtual] proxima];
}
- (void) problemaComunicacao {
    NSLog(@"DADOS DE RETORNO ZICA!!!!");
}


@end
