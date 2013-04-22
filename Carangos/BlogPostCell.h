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

@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UILabel *autor;
@property (weak, nonatomic) IBOutlet UILabel *mensagem;
@property (weak, nonatomic) IBOutlet UIImageView *estrela;

- (void)configureWith:(BlogPost*)post andCallbackFavoritar:(void (^)(BlogPost *))callback;

@end
