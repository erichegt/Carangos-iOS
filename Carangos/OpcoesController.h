//
//  OpcoesController.h
//  Carangos
//
//  Created by Erich Egert on 3/2/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpcoesController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

- (id)initWithValores: (NSArray*) opcoes andCallback:(void (^)(NSInteger selecionado))block;

@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@end
