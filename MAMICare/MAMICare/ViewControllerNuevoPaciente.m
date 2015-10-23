//
//  ViewControllerNuevoPaciente.m
//  MAMICare
//
//  Created by Pau Escalante on 10/22/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "ViewControllerNuevoPaciente.h"

@interface ViewControllerNuevoPaciente ()

@end

@implementation ViewControllerNuevoPaciente

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)botNuevaFoto:(id)sender {
    [self accesoFotos];
}

- (void)accesoFotos {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    self.outBotNuevaFoto.hidden = YES;
    self.outFoto.image = chosenImage;
    self.outFoto.hidden = NO;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)tomarFoto {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
@end
