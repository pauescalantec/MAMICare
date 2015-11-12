//
//  ViewControllerNuevoPaciente.h
//  MAMICare
//
//  Created by Pau Escalante on 10/22/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerNuevoPaciente : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)botNuevaFoto:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *outBotNuevaFoto;

@property (strong, nonatomic) IBOutlet UIImageView *outFoto;

@end
