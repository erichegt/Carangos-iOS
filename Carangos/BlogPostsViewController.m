//
//  BlogPostsViewController.m
//  Carangos
//
//  Created by Osni Oliveira on 12/04/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "BlogPostsViewController.h"



#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define kBlogPostsListURL [NSURL URLWithString:@"http://23.21.248.134:8080/Carangus/post/list"]

@interface BlogPostsViewController ()

@end

@implementation BlogPostsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    PostDataSource *datasource = [[PostDataSource alloc] initWithDelegate:self];
    [datasource buscaPosts];
    
//    dispatch_async(kBgQueue, ^{
//        NSData *data = [NSData dataWithContentsOfURL:kBlogPostsListURL];
//        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
//    });
}

- (void) recebePosts: (NSArray*) posts {
    NSLog(@"Recebendo posts: %@", posts);
    blogPosts = posts;
    [blogPostsTableView reloadData];
}

- (void) problemaParaBuscarPosts {
    NSLog(@"ZICA BUSCANDO POSTS -> CONTROLLER");
}

//- (void)fetchedData:(NSData *)responseData {
//    NSError *error;
//    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
//    blogPosts = [json objectForKey:@"list"];
//    
//    [blogPostsTableView reloadData];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"pool";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }
    
//    NSDictionary *blogPostInfo = [blogPosts objectAtIndex:indexPath.row];
//    NSDictionary *blogPostAuthor = [blogPostInfo objectForKey:@"autor"];
//    cell.textLabel.text = [blogPostInfo objectForKey:@"mensagem"];
//    cell.detailTextLabel.text = [blogPostAuthor objectForKey:@"nome"];

    BlogPost *post = [blogPosts objectAtIndex:[indexPath row]];
    cell.textLabel.text = [post mensagem];
    cell.detailTextLabel.text = [[post autor]nome];
    
    return cell;
}

@end
