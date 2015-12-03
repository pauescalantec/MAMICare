//
//  ViewControllerNuevoPaciente.h
//  MAMICare
//
//  Created by Pau Escalante on 10/22/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerNuevoPaciente : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate> {
    UIDatePicker *datePicker;}

// outlets
@property (strong, nonatomic) IBOutlet UIButton *outBotNuevaFoto;
@property (strong, nonatomic) IBOutlet UIImageView *outFoto;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnSave;
@property (nonatomic, strong) NSString *strSegue;
@property (strong, nonatomic) IBOutlet UIScrollView *outScroller;
@property (nonatomic, strong) UITextField *activeField;
@property (strong, nonatomic) IBOutlet UIView *ChoosePictureMode;
@property (strong, nonatomic) IBOutlet UIButton *btnChoosePhoto;
@property (strong, nonatomic) IBOutlet UIButton *btnTakePhoto;
@property (strong, nonatomic) IBOutlet UIButton *btnCancelar;

// properties
@property UIVisualEffect *blurEffect;
@property (nonatomic, strong) NSString *picture;
@property UIVisualEffectView *visualEffectView;
@property (nonatomic, strong) NSString *patientImageAssetURL; // important


// actions
- (IBAction)takePhoto:(UIButton *)sender;
- (IBAction)choosePhoto:(UIButton *)sender;
- (IBAction)cancelarFoto:(UIButton *)sender;
- (IBAction)botNuevaFoto:(id)sender;


//text fields and iPad position while editing
@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;
- (IBAction)txtFNEnd:(UITextField *)sender;
- (IBAction)txtFNBegin:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtFirstLastName;
- (IBAction)txtFLNEnd:(UITextField *)sender;
- (IBAction)txtFLNBegin:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtSecLastName;
- (IBAction)txtSLNEnd:(UITextField *)sender;
- (IBAction)txtSLNBegin:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtAddress1;
- (IBAction)txtA1End:(UITextField *)sender;
- (IBAction)txtA1Begin:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtAddress2;
- (IBAction)txtA2End:(UITextField *)sender;
- (IBAction)txtA2Begin:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtCiudad;
- (IBAction)txtCiuEnd:(UITextField *)sender;
- (IBAction)txtCiuBegin:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtEstado;
- (IBAction)txtEstEnd:(UITextField *)sender;
- (IBAction)txtEstBegin:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtCodigo;
- (IBAction)txtCodEnd:(UITextField *)sender;
- (IBAction)txtCodBegin:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtPais;
- (IBAction)txtPaisEnd:(UITextField *)sender;
- (IBAction)txtPaisBegin:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtCorreo;
- (IBAction)txtCorEnd:(UITextField *)sender;
- (IBAction)txtCorBegin:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtNacimiento;
- (IBAction)txtNacEnd:(UITextField *)sender;
- (IBAction)txtNacBegin:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtCURP;
- (IBAction)txtCURPEnd:(UITextField *)sender;
- (IBAction)txtCURPBegin:(UITextField *)sender;

@end
