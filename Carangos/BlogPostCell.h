//
//  BlogPostCell.h
//  Carangos
//
//  Created by Erich Egert on 4/18/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogPost.h"

@interface BlogPostCell : UITableViewCell

-(void) configureWith:(BlogPost*) post;

- (id)initWithFavoriteCallback:(void (^)(BlogPost* post))block;

@end
