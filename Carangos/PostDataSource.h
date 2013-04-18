//
//  PostDataSource.h
//  Carangos
//
//  Created by Erich Egert on 4/15/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSource.h"
#import "BlogPost.h"

@protocol PostDelegate <NSObject>

- (void) recebePosts: (NSArray *) posts;
- (void) problemaParaBuscarPosts;

@end

@interface PostDataSource : NSObject<DataSourceDelegate>

-(void) buscaPosts;
-(id) initWithDelegate: (id<PostDelegate>) delegatePosts andContext: (NSManagedObjectContext*) ctx;

@end
