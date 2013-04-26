//
//  NovoBlogPostViewController.h
//  Carangos
//
//  Created by Erich Egert on 4/25/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NovoBlogPostViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *botaoFoto;

- (IBAction)capturaFoto:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *mensagem;
@end
