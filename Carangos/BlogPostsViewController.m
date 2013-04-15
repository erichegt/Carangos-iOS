//
//  BlogPostsViewController.m
//  Carangos
//
//  Created by Osni Oliveira on 12/04/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "BlogPostsViewController.h"


@interface BlogPostsViewController ()

@end

@implementation BlogPostsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    PostDataSource *datasource = [[PostDataSource alloc] initWithDelegate:self];
    [datasource buscaPosts];
}

- (void) recebePosts: (NSArray*) posts {
    NSLog(@"Recebendo posts: %@", posts);
    blogPosts = posts;
    [blogPostsTableView reloadData];
}

- (void) problemaParaBuscarPosts {
    NSLog(@"ZICA BUSCANDO POSTS -> CONTROLLER");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"pool";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }

    BlogPost *post = [blogPosts objectAtIndex:[indexPath row]];
    cell.textLabel.text = [post mensagem];
    cell.detailTextLabel.text = [[post autor]nome];
    
    return cell;
}

@end
