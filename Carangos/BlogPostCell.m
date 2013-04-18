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
    @property(unsafe_unretained, nonatomic) BlogPost* item;
    @property(unsafe_unretained, nonatomic)  UIImageView *imagem;
    @property(unsafe_unretained, nonatomic)  UILabel *autor;
    @property(unsafe_unretained, nonatomic)  UILabel *mensagem;
    @property(unsafe_unretained, nonatomic)  UIImageView *estrela;
    @property(nonatomic, strong) void (^callback)(BlogPost *);
@end

@implementation BlogPostCell

@synthesize item, imagem, mensagem, autor, estrela;

- (id)initWithFavoriteCallback:(void (^)(BlogPost* post))block {
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"BlogPostCell"
                                                             owner:nil options:nil];
    self = [topLevelObjects objectAtIndex:0];

    if (self) {
        [self setImagem:(UIImageView*)[self viewWithTag:60]];
        [self setAutor:(UILabel*) [self viewWithTag:61]];
        [self setMensagem:(UILabel*) [self viewWithTag:62]];
        [self setEstrela:(UIImageView*)[self viewWithTag:63]];
        [self setCallback:block];
        
        UITapGestureRecognizer *onTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(favoritar)];
        
        [onTap setNumberOfTapsRequired:1];
        
        [self.estrela addGestureRecognizer:onTap];
        [self.estrela setUserInteractionEnabled:YES];

    }
    
    return self;
}

-(void) favoritar {
    self.callback([self item]);
}

-(void) configureWith:(BlogPost*) post{
    Autor *a = [post autor];
    [[self autor] setText:[a nome]];
    [[self mensagem] setText:[post mensagem]];
    
    [self.imagem setImageWithURL:[NSURL URLWithString:[[post autor] avatar]]
                placeholderImage:[UIImage imageNamed:@"no_image.png"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
