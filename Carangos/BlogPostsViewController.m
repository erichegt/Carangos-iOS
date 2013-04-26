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
#import "NovoBlogPostViewController.h"


@interface BlogPostsViewController ()
@end

@implementation BlogPostsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Novo Post" style:UIBarButtonSystemItemAdd target:self action:@selector(irParaFormBlogPost)]];
    
    blogPosts = [[NSMutableArray alloc] init];
    
    PostDataSource *datasource = [[PostDataSource alloc] initWithDelegate:self andContext:[self context]];
    [datasource buscaPosts];

    [blogPostsTableView addInfiniteScrollingWithActionHandler:^{
        BOOL precisaBuscarMais = YES; //TODO infinito mesmo?
        
        if (precisaBuscarMais) {
            [datasource buscaPosts];
        }
    }];
    
    blogPostsTableView.rowHeight = 100; //TODO serio mesmo?
    
    UINib *blogPostCell = [UINib nibWithNibName:@"BlogPostCell" bundle:nil];
    [blogPostsTableView registerNib:blogPostCell forCellReuseIdentifier:@"BlogPostCellReuseIdentifer"];
}
-(void) irParaFormBlogPost {
    NovoBlogPostViewController *controller = [[NovoBlogPostViewController alloc] init];
    
    [self.navigationController pushViewController:controller animated:YES];

}

- (void) recebePosts: (NSArray*) posts {
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
    static NSString *reuseIdentifier = @"BlogPostCellReuseIdentifer";
    BlogPostCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    BlogPost *post = [blogPosts objectAtIndex:[indexPath row]];
    [cell configureWith:post andCallbackFavoritar:^(BlogPost * blogPost) {
        NSLog(@"Favoritado Blog Post: %@", blogPost);
    }];
        
    return cell;
}

@end
