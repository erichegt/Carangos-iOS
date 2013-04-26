//
//  NovoBlogPostViewController.m
//  Carangos
//
//  Created by Erich Egert on 4/25/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "NovoBlogPostViewController.h"
#import "BlogPost.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"


@interface NovoBlogPostViewController ()

@end

@implementation NovoBlogPostViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Enviar" style:UIBarButtonItemStylePlain target:self action:@selector(enviaMensagem)]];
    
    
}

-(void) enviaMensagem {
//    BlogPost *post = [BlogPost blogPostWithMensagem:[self.mensagem text] andAutor:nil andDetachedFromContext:[self context]];
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080"];
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    NSData *imageData = UIImageJPEGRepresentation(self.botaoFoto.imageView.image, 0.5);
    
    NSMutableURLRequest *request = [httpClient multipartFormRequestWithMethod:@"POST" path:@"/upload/image" parameters:nil constructingBodyWithBlock: ^(id <AFMultipartFormData>formData) {
        
        [formData appendPartWithFileData:imageData name:@"file" fileName:@"avatar.jpg" mimeType:@"image/jpeg"];
    }];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        NSLog(@"Sent %lld of %lld bytes", totalBytesWritten, totalBytesExpectedToWrite);
    }];
    [httpClient enqueueHTTPRequestOperation:operation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *imagem = [info objectForKey:UIImagePickerControllerOriginalImage];

    
    [self.botaoFoto setImage:imagem forState:UIControlStateNormal];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)capturaFoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
}
@end
