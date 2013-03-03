//
//  DetailViewController.m
//  Carangos
//
//  Created by Erich Egert on 3/1/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "DetailViewController.h"
#import "FPPopoverController.h"
#import "OpcoesController.h"

@interface DetailViewController ()

@property (nonatomic, strong) ModeloDeAutomovel* modelo;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

-(id) init {
    self = [super initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
    
    if (self) {
        
    }
    
    return self;
}

-(id) initWithModelo: (ModeloDeAutomovel*) modeloCarro {
    self = [super initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
    
    if (self) {
        [self setModelo:modeloCarro];
    }
    
    return self;
}

- (IBAction)escolherFabricante:(id)sender {
    OpcoesController *controller = [[OpcoesController alloc] init];
    
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];
    
    //the popover will be presented from the okButton view
    [popover presentPopoverFromView:sender];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self setModelo:nil];
}
							
@end
