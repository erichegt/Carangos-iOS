//
//  BlogPostCell.m
//  Carangos
//
//  Created by Erich Egert on 4/18/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "BlogPostCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface BlogPostCell() {
    void (^callbackFavoritar)(BlogPost *);
}

    @property(weak, nonatomic) BlogPost* item;
@end

@implementation BlogPostCell

- (void)awakeFromNib {
    self.estrela.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *onTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(favoritar)];
    [onTap setNumberOfTapsRequired:1];
    
    [self.estrela addGestureRecognizer:onTap];
}

- (void)favoritar {
    callbackFavoritar([self item]);
}

- (void)configureWith:(BlogPost *)post andCallbackFavoritar:(void (^)(BlogPost *))callback {
    self.item = post;
    
    self.autor.text = self.item.autor.nome;
    self.mensagem.text = self.item.mensagem;
    
    [self.imagem setImageWithURL:[NSURL URLWithString:self.item.autor.avatar]
                placeholderImage:[UIImage imageNamed:@"no_image.png"]];
    callbackFavoritar = callback;
}

@end
