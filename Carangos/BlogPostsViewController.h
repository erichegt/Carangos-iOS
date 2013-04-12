//
//  BlogPostsViewController.h
//  Carangos
//
//  Created by Osni Oliveira on 12/04/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlogPostsViewController : UIViewController <UITableViewDataSource> {
    __weak IBOutlet UITableView *blogPostsTableView;
    
    NSArray *blogPosts;
}

@end
