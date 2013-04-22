//
//  BlogPostsViewController.h
//  Carangos
//
//  Created by Osni Oliveira on 12/04/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostDataSource.h"


@interface BlogPostsViewController : UIViewController <UITableViewDataSource, PostDelegate> {
    __weak IBOutlet UITableView *blogPostsTableView;
    NSMutableArray *blogPosts;
}

@end
