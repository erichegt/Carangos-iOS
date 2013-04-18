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
#import "Marca.h"

@interface DetailViewController ()

@property (nonatomic, strong) ModeloDeAutomovel* modelo;
@property (nonatomic, strong) Marca* fabricante;
@property (nonatomic) NSInteger litros;
@property (nonatomic) NSInteger cilindros;
@property (nonatomic) NSInteger combustivel;

@end

@implementation DetailViewController

@synthesize modelo;
@synthesize fabricante, litros, cilindros, combustivel;

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

-(void) viewDidLoad {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Salvar" style:UIBarButtonItemStylePlain target:self action:@selector(salvar)];
    
    [super viewDidLoad];
}

-(void) salvar {
    NSLog(@"SALVANDO NOVO MODELO!");
    
    if(!modelo) {
        [self setModelo:[ModeloDeAutomovel modeloWithContext:[self context]]];
    }
    
    [modelo updateAtributesWithNome:[[self nome] text]
                      andFabricante:[self fabricante]
                  andMotorComLitros:[self litros]
                     andCombustivel:[self combustivel]];
    
    [self saveManagedContext];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NovoModeloDeCarro" object:nil];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)escolherFabricante:(id)sender {
    NSLog(@"Fabricante clicado %@", sender);
    
    DetailViewController *_self = self;
    
    NSArray *marcas = [Marca todosWithContext:[self context]];
    
    OpcoesController *controller = [[OpcoesController alloc] initWithValores:marcas andCallback:
                                        ^(NSInteger selecionado) {
                                            [_self setFabricante:[marcas objectAtIndex:selecionado]];
                                        }];
    
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];

    [popover presentPopoverFromView:sender];
    
}

- (IBAction)escolherCilindros:(id)sender {
    DetailViewController *_self = self;
    
    OpcoesController *controller = [[OpcoesController alloc] initWithValores:[ModeloDeAutomovel cilindradasDeMotores] andCallback:
                                    ^(NSInteger selecionado) {
                                        [_self setCilindros:selecionado];
                                    }];
    
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];
    
    [popover presentPopoverFromView:sender];
}

- (IBAction)escolherLitrosMotor:(id)sender {
    DetailViewController *_self = self;
    
    OpcoesController *controller = [[OpcoesController alloc] initWithValores: [ModeloDeAutomovel litrosMotorizacoes] andCallback:
                                    ^(NSInteger selecionado) {
                                        [_self setLitros:selecionado];
                                    }];
    
    FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:controller];
    
    [popover presentPopoverFromView:sender];
}

- (IBAction)toqueNoFundoDaTela:(id)sender {
    [[self view] endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self setModelo:nil];
}
							
@end
