//
//  PostDataSource.m
//  Carangos
//
//  Created by Erich Egert on 4/15/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "PostDataSource.h"

@interface PostDataSource()

@property(nonatomic, unsafe_unretained) id<PostDelegate> delegate;
@property(nonatomic, strong) DataSource *dataSource;

@end


@implementation PostDataSource

@synthesize delegate, dataSource;

-(id) initWithDelegate: (id<PostDelegate>) delegatePosts {
    self = [super init];
    
    if (self) {
        [self setDelegate:delegatePosts];
        [self setDataSource: [[DataSource alloc] initWithDelegate:self]];
    }
    
    return self;
}

-(void) buscaPosts {
    [self.dataSource inicializaConexao];
}

- (NSString *) getURL {
    return @"http://23.21.248.134:8080/Carangus/post/list";
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
}
- (void) problemaComunicacao {
    NSLog(@"DADOS DE RETORNO ZICA!!!!");
}


@end
