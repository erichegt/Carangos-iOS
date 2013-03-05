//
//  DetailViewController.h
//  Carangos
//
//  Created by Erich Egert on 3/1/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModeloDeAutomovel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nome;

-(id) initWithModelo: (ModeloDeAutomovel*) _modelo;

- (IBAction)escolherFabricante:(id)sender;
- (IBAction)escolherCilindros:(id)sender;
- (IBAction)escolherLitrosMotor:(id)sender;


- (IBAction)toqueNoFundoDaTela:(id)sender;


@end
