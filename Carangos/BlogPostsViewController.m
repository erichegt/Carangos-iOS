//
//  BlogPostsViewController.m
//  Carangos
//
//  Created by Osni Oliveira on 12/04/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "BlogPostsViewController.h"
#import "UIScrollView+SVInfiniteScrolling.h"
#import "BlogPostCell.h"

@interface BlogPostsViewController ()

@end

@implementation BlogPostsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    blogPosts = [[NSMutableArray alloc] init];
    
    PostDataSource *datasource = [[PostDataSource alloc] initWithDelegate:self];
    [datasource buscaPosts];
    

    [blogPostsTableView addInfiniteScrollingWithActionHandler:^{
        BOOL precisaBuscarMais = YES; //TODO infinito mesmo?
        
        if (precisaBuscarMais) {
            [datasource buscaPosts];
        }
    }];
    
    blogPostsTableView.rowHeight = 100; //TODO serio mesmo?
}

- (void) recebePosts: (NSArray*) posts {
    NSLog(@"Recebendo posts: %@", posts);
    [blogPosts addObjectsFromArray:posts];
    [blogPostsTableView reloadData];
    [[blogPostsTableView infiniteScrollingView] stopAnimating];
}

- (void) problemaParaBuscarPosts {
    NSLog(@"ZICA BUSCANDO POSTS -> CONTROLLER");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"BlogPost";
    BlogPostCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[BlogPostCell alloc] initWithFavoriteCallback:^(BlogPost *post) {
            NSLog(@"Favoritando %@", [post mensagem]);
        }];
    }

    BlogPost *post = [blogPosts objectAtIndex:[indexPath row]];
    [cell configureWith:post];
    
    return cell;
}

@end
