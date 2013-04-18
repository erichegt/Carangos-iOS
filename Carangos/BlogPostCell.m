//
//  BlogPostCell.m
//  Carangos
//
//  Created by Erich Egert on 4/18/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "BlogPostCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface BlogPostCell()
    @property(nonatomic, strong) BlogPost* item;
    @property(unsafe_unretained, nonatomic)  UIImageView *imagem; //strong?
    @property(unsafe_unretained, nonatomic)  UITextView *autor; //strong?
    @property(unsafe_unretained, nonatomic)  UITextView *mensagem; //strong?
    @property(nonatomic, strong) void (^callback)(BlogPost *);
@end

@implementation BlogPostCell

@synthesize item;

- (id)initWithFavoriteCallback:(void (^)(BlogPost* post))block {
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"BlogPostCell"
                                                             owner:nil options:nil];
    self = [topLevelObjects objectAtIndex:0];

    if (self) {
        [self setImagem:(UIImageView*)[self viewWithTag:60]];
        [self setAutor:(UITextView*) [self viewWithTag:61]];
        [self setMensagem:(UITextView*) [self viewWithTag:62]];
    }
    
    return self;
}

-(void) configureWith:(BlogPost*) post{
    [[self autor] setText:[[post autor] nome]];
    [[self mensagem] setText:[post mensagem]];
    
    [self.imagem setImageWithURL:[NSURL URLWithString:@"http://cinemagrafado.files.wordpress.com/2010/07/v-de-vinganca-2.jpg"]
                placeholderImage:[UIImage imageNamed:@"no_image.png"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
