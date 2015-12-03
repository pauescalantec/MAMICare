//
//  ViewControllerNuevoPaciente.m
//  MAMICare
//
//  Created by Pau Escalante on 10/22/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import "ViewControllerNuevoPaciente.h"
#import "ViewControllerDetalle.h"
#import "DBManager.h"

@interface ViewControllerNuevoPaciente ()

@end

@implementation ViewControllerNuevoPaciente

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.picture = @"";
    
    datePicker = [[UIDatePicker alloc]init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [self.txtNacimiento setInputView:datePicker];
    
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.txtNacimiento setInputAccessoryView:toolBar];
    
    [self.outScroller setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
    
    self.outBotNuevaFoto.hidden = NO;
    self.btnSave.enabled = NO;
    self.outFoto.layer.cornerRadius = self.outFoto.frame.size.width / 2;
    self.outFoto.layer.masksToBounds = YES;
    
    self.btnChoosePhoto.layer.cornerRadius = 5;
    self.btnTakePhoto.layer.cornerRadius = 5;
    self.btnCancelar.layer.cornerRadius = 5;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(removeKb)];
    [self.view addGestureRecognizer:tap];
    [self registerForKeyboardNotifications];
    
    [self.txtFirstName setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [self.txtFirstLastName setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [self.txtSecLastName setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [self.txtCiudad setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [self.txtEstado setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [self.txtPais setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [self.txtAddress1 setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [self.txtAddress2 setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [self.txtCURP setAutocapitalizationType:UITextAutocapitalizationTypeAllCharacters];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ShowSelectedDate
{
    self.txtNacimiento.text=[NSString stringWithFormat:@"%@",[Patient setDateFormatWithDate:datePicker.date]];
    [self.txtNacimiento resignFirstResponder];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString: @"detalleNuevo"]) {
        ViewControllerDetalle *patientView = [segue destinationViewController];
        patientView.strSegue = self.strSegue;
        patientView.strNuevo = @"Nuevo";
        
        // TODO: completar este método
        Patient *newPatient = [self savePatient];
        [patientView setPatient:newPatient];
    }
}

#pragma mark - Patient Save Methods and Helpers

- (Patient *)savePatient {
    // creating the address first
    Address *addr = [[Address alloc] init];
    addr.addressLine1 = self.txtAddress1.text;
    addr.addressLine2 = self.txtAddress2.text;
    addr.city = self.txtCiudad.text;
    addr.state = self.txtEstado.text;
    addr.zipCode = [self.txtCodigo.text integerValue];
    addr.country = self.txtPais.text;
    
    Patient *newPatient = [[Patient alloc] init];
    newPatient.name = self.txtFirstName.text;
    newPatient.lastname1 = self.txtFirstLastName.text;
    newPatient.lastname2 = self.txtSecLastName.text;
    newPatient.pAddress = addr;
    newPatient.email = self.txtCorreo.text;
    newPatient.curp = self.txtCURP.text;
    newPatient.imageAssetURL = self.patientImageAssetURL; // new
    
    [newPatient save];
    
    return newPatient;
}


#pragma mark - Validations and Keyboard Slide

//validate segue if user has not entered username
- (BOOL)checkEnabled{
    //local variables
    BOOL done = YES;
    
    if ([self.txtFirstName.text isEqualToString:@"Nombres"]){
        done = NO;
    }
    
    if ([self.txtFirstLastName.text isEqualToString:@"Apellido Paterno"]){
        done = NO;
    }
    
    if ([self.txtSecLastName.text isEqualToString:@"Apellido Materno"]){
        done = NO;
    }
    
    if ([self.txtNacimiento.text isEqualToString:@"Fecha de Nacimiento"]){
        done = NO;
    }
    
    if ([self.txtAddress1.text isEqualToString:@"Domicilio (Calle y Número)"]){
        done = NO;
    }
    
    if ([self.txtAddress2.text isEqualToString:@"Colonia"]){
        done = NO;
    }
    
    if ([self.txtCiudad.text isEqualToString:@"Ciudad"]){
        done = NO;
    }
    
    if ([self.txtEstado.text isEqualToString:@"Estado"]){
        done = NO;
    }
    
    if ([self.txtCodigo.text isEqualToString:@"Código Postal"]){
        done = NO;
    }
    
    if ([self.txtPais.text isEqualToString:@"País"]){
        done = NO;
    }
    
    if ([self.picture isEqualToString:@""]){
        done = NO;
    }
    return done;
}

- (IBAction)botNuevaFoto:(id)sender {

    //select picture
    self.ChoosePictureMode.hidden = NO;
    [self removeKb];
    
    self.blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:self.blurEffect];
    self.visualEffectView.alpha = 0.5;
    
    self.visualEffectView.frame = self.outScroller.bounds;
    [self.outScroller addSubview:self.visualEffectView];
}

- (void)accesoFotos {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    picker.modalPresentationStyle = UIModalPresentationPopover;
    picker.popoverPresentationController.sourceView = self.outBotNuevaFoto;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    //self.outBotNuevaFoto.hidden = YES;
    self.outFoto.image = chosenImage;
    self.picture = @"PictureChosen";
    
    //if all options done, enable button
    if ([self checkEnabled]){
        self.btnSave.enabled = YES;
    }
    
    else {
        self.btnSave.enabled = NO;
    }
    
    //only if new
    if ([picker sourceType] == UIImagePickerControllerSourceTypeCamera) {
        UIImageWriteToSavedPhotosAlbum(self.outFoto.image, nil, nil, nil);
    }
    
    
    // get the ref url of the picked user image
    NSURL *refURL = [info valueForKey:UIImagePickerControllerReferenceURL];
    self.patientImageAssetURL = [refURL absoluteString];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)tomarFoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    picker.modalPresentationStyle = UIModalPresentationPopover;
    picker.popoverPresentationController.sourceView = self.outBotNuevaFoto;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)takePhoto:(UIButton *)sender {
    self.ChoosePictureMode.hidden = YES;
    [self.visualEffectView removeFromSuperview];
    [self tomarFoto];
}

- (IBAction)choosePhoto:(UIButton *)sender {
    self.ChoosePictureMode.hidden = YES;
    [self.visualEffectView removeFromSuperview];
    [self accesoFotos];
}

- (IBAction)cancelarFoto:(UIButton *)sender {
    //select picture
    self.ChoosePictureMode.hidden = YES;
    [self.visualEffectView removeFromSuperview];
}

- (IBAction)txtFNEnd:(id)sender {
    self.activeField = nil;
    //check length of text for format
    if (self.txtFirstName.text.length <= 0){
        //change text
        self.txtFirstName.text = @"Nombres";
        //turn to color black
        self.txtFirstName.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
    }
    
    //if all options done, enable button
    if ([self checkEnabled]){
        self.btnSave.enabled = YES;
    }
    
    else {
        self.btnSave.enabled = NO;
    }
}

- (IBAction)txtFNBegin:(UITextField *)sender {
    self.activeField = sender;
    if ([self.txtFirstName.text isEqualToString:@"Nombres"]){
        //empty text
        self.txtFirstName.text = @"";
        //turn to color black
        self.txtFirstName.textColor = [UIColor blackColor];
    }
}

- (IBAction)txtFLNEnd:(UITextField *)sender {
    self.activeField = nil;
    //check length of text for format
    if (self.txtFirstLastName.text.length <= 0){
        //change text
        self.txtFirstLastName.text = @"Apellido Paterno";
        //turn to color black
        self.txtFirstLastName.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
    }
    
    //if all options done, enable button
    if ([self checkEnabled]){
        self.btnSave.enabled = YES;
    }
    
    else {
        self.btnSave.enabled = NO;
    }
}

- (IBAction)txtFLNBegin:(UITextField *)sender {
    self.activeField = sender;
    if ([self.txtFirstLastName.text isEqualToString:@"Apellido Paterno"]){
        //empty text
        self.txtFirstLastName.text = @"";
        //turn to color black
        self.txtFirstLastName.textColor = [UIColor blackColor];
    }
}

- (IBAction)txtSLNEnd:(UITextField *)sender {
    self.activeField = nil;
    if (self.txtSecLastName.text.length <= 0){
        //change text
        self.txtSecLastName.text = @"Apellido Materno";
        //turn to color black
        self.txtSecLastName.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
    }
    
    //if all options done, enable button
    if ([self checkEnabled]){
        self.btnSave.enabled = YES;
    }
    
    else {
        self.btnSave.enabled = NO;
    }
}

- (IBAction)txtSLNBegin:(UITextField *)sender {
    self.activeField = sender;
    if ([self.txtSecLastName.text isEqualToString:@"Apellido Materno"]){
        //empty text
        self.txtSecLastName.text = @"";
        //turn to color black
        self.txtSecLastName.textColor = [UIColor blackColor];
    }
}

// Remove Keyboard
- (void) removeKb
{
    [self.view endEditing: YES];
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name: UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name: UIKeyboardWillHideNotification object:nil];
}

// Called when the UIKeyboardDidShowNotification is sent.
// Called an when a txt field is active
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGRect bkgndRect = self.activeField.superview.frame;
    
    //check if scroller is needed to move
    if ((self.activeField.frame.origin.y + self.activeField.frame.size.height+20) > (768 - kbSize.height)){
        bkgndRect.size.height += kbSize.height;
        [self.activeField.superview setFrame:bkgndRect];
        NSInteger status = self.activeField.frame.origin.y;
        NSInteger difference = status - 250;
        [self.outScroller setContentOffset:CGPointMake(0.0, difference) animated:YES];
    }
    
}

// Called when the UIKeyboardWillHideNotification is sent
// Called after remove Keyboard to return scroller to its position
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGRect bkgndRect = self.activeField.superview.frame;
    bkgndRect.size.height -= kbSize.height;
    [self.activeField.superview setFrame:bkgndRect];
    [self.outScroller setContentOffset:CGPointMake(0.0, -65) animated:YES];
}


- (IBAction)txtA1End:(UITextField *)sender {
    self.activeField = nil;
    if (self.txtAddress1.text.length <= 0){
        //change text
        self.txtAddress1.text = @"Domicilio (Calle y Número)";
        //turn to color black
        self.txtAddress1.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
    }
    
    //if all options done, enable button
    if ([self checkEnabled]){
        self.btnSave.enabled = YES;
    }
    
    else {
        self.btnSave.enabled = NO;
    }
}

- (IBAction)txtA1Begin:(UITextField *)sender {
    self.activeField = sender;
    if ([self.txtAddress1.text isEqualToString:@"Domicilio (Calle y Número)"]){
        //empty text
        self.txtAddress1.text = @"";
        //turn to color black
        self.txtAddress1.textColor = [UIColor blackColor];
    }
}

- (IBAction)txtA2End:(UITextField *)sender {
    self.activeField = nil;
    if (self.txtAddress2.text.length <= 0){
        //change text
        self.txtAddress2.text = @"Colonia";
        //turn to color black
        self.txtAddress2.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
    }
    
    //if all options done, enable button
    if ([self checkEnabled]){
        self.btnSave.enabled = YES;
    }
    
    else {
        self.btnSave.enabled = NO;
    }
}

- (IBAction)txtA2Begin:(UITextField *)sender {
    self.activeField = sender;
    if ([self.txtAddress2.text isEqualToString:@"Colonia"]){
        //empty text
        self.txtAddress2.text = @"";
        //turn to color black
        self.txtAddress2.textColor = [UIColor blackColor];
    }
}

- (IBAction)txtCiuEnd:(UITextField *)sender {
    self.activeField = nil;
    if (self.txtCiudad.text.length <= 0){
        //change text
        self.txtCiudad.text = @"Ciudad";
        //turn to color black
        self.txtCiudad.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
    }
    
    //if all options done, enable button
    if ([self checkEnabled]){
        self.btnSave.enabled = YES;
    }
    
    else {
        self.btnSave.enabled = NO;
    }
}

- (IBAction)txtCiuBegin:(UITextField *)sender {
    self.activeField = sender;
    if ([self.txtCiudad.text isEqualToString:@"Ciudad"]){
        //empty text
        self.txtCiudad.text = @"";
        //turn to color black
        self.txtCiudad.textColor = [UIColor blackColor];
    }
}

- (IBAction)txtEstEnd:(UITextField *)sender {
    self.activeField = nil;
    if (self.txtEstado.text.length <= 0){
        //change text
        self.txtEstado.text = @"Estado";
        //turn to color black
        self.txtEstado.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
    }
    
    //if all options done, enable button
    if ([self checkEnabled]){
        self.btnSave.enabled = YES;
    }
    
    else {
        self.btnSave.enabled = NO;
    }
}

- (IBAction)txtEstBegin:(UITextField *)sender {
    self.activeField = sender;
    if ([self.txtEstado.text isEqualToString:@"Estado"]){
        //empty text
        self.txtEstado.text = @"";
        //turn to color black
        self.txtEstado.textColor = [UIColor blackColor];
    }
}

- (IBAction)txtCodEnd:(UITextField *)sender {
    self.activeField = nil;
    if (self.txtCodigo.text.length <= 0){
        //change text
        self.txtCodigo.text = @"Código Postal";
        //turn to color black
        self.txtCodigo.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
    }
    
    //if all options done, enable button
    if ([self checkEnabled]){
        self.btnSave.enabled = YES;
    }
    
    else {
        self.btnSave.enabled = NO;
    }
}

- (IBAction)txtCodBegin:(UITextField *)sender {
    self.activeField = sender;
    if ([self.txtCodigo.text isEqualToString:@"Código Postal"]){
        //empty text
        self.txtCodigo.text = @"";
        //turn to color black
        self.txtCodigo.textColor = [UIColor blackColor];
    }
}

- (IBAction)txtPaisEnd:(UITextField *)sender {
    self.activeField = nil;
    if (self.txtPais.text.length <= 0){
        //change text
        self.txtPais.text = @"País";
        //turn to color black
        self.txtPais.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
    }
    
    //if all options done, enable button
    if ([self checkEnabled]){
        self.btnSave.enabled = YES;
    }
    
    else {
        self.btnSave.enabled = NO;
    }
}

- (IBAction)txtPaisBegin:(UITextField *)sender {
    self.activeField = sender;
    if ([self.txtPais.text isEqualToString:@"País"]){
        //empty text
        self.txtPais.text = @"";
        //turn to color black
        self.txtPais.textColor = [UIColor blackColor];
    }
}
- (IBAction)txtCorEnd:(UITextField *)sender {
    self.activeField = nil;
    if (self.txtCorreo.text.length <= 0){
        //change text
        self.txtCorreo.text = @"Correo Electrónico";
        //turn to color black
        self.txtCorreo.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
    }
}

- (IBAction)txtCorBegin:(UITextField *)sender {
    self.activeField = sender;
    if ([self.txtCorreo.text isEqualToString:@"Correo Electrónico"]){
        //empty text
        self.txtCorreo.text = @"";
        //turn to color black
        self.txtCorreo.textColor = [UIColor blackColor];
    }
}
- (IBAction)txtNacEnd:(UITextField *)sender {
    self.activeField = nil;
    if (self.txtNacimiento.text.length <= 0){
        //change text
        self.txtNacimiento.text = @"Fecha de Nacimiento";
        //turn to color black
        self.txtNacimiento.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
    }
    
    //if all options done, enable button
    if ([self checkEnabled]){
        self.btnSave.enabled = YES;
    }
    
    else {
        self.btnSave.enabled = NO;
    }
}

- (IBAction)txtNacBegin:(UITextField *)sender {
    self.activeField = sender;
    if ([self.txtNacimiento.text isEqualToString:@"Fecha de Nacimiento"]){
        //empty text
        self.txtNacimiento.text = @"";
        //turn to color black
        self.txtNacimiento.textColor = [UIColor blackColor];
    }
}

- (IBAction)txtCURPEnd:(UITextField *)sender {
    self.activeField = nil;
    if (self.txtCURP.text.length <= 0){
        //change text
        self.txtCURP.text = @"CURP";
        //turn to color black
        self.txtCURP.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
    }
}

- (IBAction)txtCURPBegin:(UITextField *)sender {
    self.activeField = sender;
    if ([self.txtCURP.text isEqualToString:@"CURP"]){
        //empty text
        self.txtCURP.text = @"";
        //turn to color black
        self.txtCURP.textColor = [UIColor blackColor];
    }
}
@end
