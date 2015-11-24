//
//  ViewControllerLogin.m
//  MAMICare
//
//  Created by Pau Escalante on 10/8/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "ViewControllerLogin.h"
#import "ViewControllerDashboard.h"

@interface ViewControllerLogin ()

@end
SocialWorker *currentUser;
@implementation ViewControllerLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //button formatting
    self.outBtnNext.layer.cornerRadius = 5;
    self.outShadow.layer.cornerRadius = 5;
    self.outShadow.layer.masksToBounds = YES;
    
    //Back box formatting
    self.outBackBox.layer.cornerRadius = 5;
    self.outBackBox.layer.masksToBounds = YES;
    self.labWarning.hidden = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(removeKb)];
    
    [self.view addGestureRecognizer:tap];
    [self registerForKeyboardNotifications];
    
    //set user
    self.txtUser.text = self.strUser;
    self.outPassword.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

<<<<<<< HEAD
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
=======

#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}*/

>>>>>>> 56aacd0e054afc37dfb3ff7b77e78ad258563fd6

//validate segue if user has not entered username
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    //local variables
    BOOL missing = NO;
    
    if ([identifier isEqualToString:@"login"])  {
        //missing username
        if ([self.txtUser.text isEqualToString:@"Usuario"]){
            self.labWarning.text = @"Escribe usuario antes de seguir.";
            missing = YES;
        }
        
        //missing password
        else if ([self.txtPassword.text isEqualToString:@""]){
            self.labWarning.text = @"Escribe contraseña antes de seguir.";
            missing = YES;
        }
        
        //missing password
        if ([self.txtPassword.text isEqualToString:@""] && [self.txtUser.text isEqualToString:@"Usuario"]){
            self.labWarning.text = @"Escribe usuario y contraseña antes de seguir.";
            missing = YES;
        }
        
        if (missing){
            //show warning
            self.labWarning.hidden = NO;
            return NO;
        }
        
        if(![SocialWorker loginwithName:self.txtUser.text andPassword:self.txtPassword.text]) {
            self.labWarning.text = @"No existe ese usuario con esa contraseña.";
            self.labWarning.hidden = NO;
            return NO;
        }
    }
    return YES;
}

- (IBAction)actEditing:(UITextField *)sender {
    self.activeField = sender;
    //check if there is previous user input
    if ([self.txtPassword.text isEqualToString:@""]){
        self.outPassword.hidden = YES;
    }
}

- (IBAction)actFinishEdit:(UITextField *)sender {
    self.activeField = nil;
    //check length of text for format
    if (self.txtPassword.text.length <= 0){
        self.outPassword.hidden = NO;
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
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGRect bkgndRect = self.activeField.superview.frame;
    bkgndRect.size.height += kbSize.height;
    [self.activeField.superview setFrame:bkgndRect];
    NSInteger status = self.activeField.frame.origin.y;
    NSInteger difference = status - 200;
    [self.outScroller setContentOffset:CGPointMake(0.0, difference) animated:YES];
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGRect bkgndRect = self.activeField.superview.frame;
    bkgndRect.size.height -= kbSize.height;
    [self.activeField.superview setFrame:bkgndRect];
    [self.outScroller setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
}

- (IBAction)actEditingUser:(UITextField *)sender {
    self.activeField = sender;
    //check if there is previous user input
    if ([self.txtUser.text isEqualToString:@"Usuario"]){
        //empty text
        self.txtUser.text = @"";
        //turn to color black
        self.txtUser.textColor = [UIColor blackColor];
    }
}

- (IBAction)actFinishEditUser:(UITextField *)sender {
    self.activeField = nil;
    //check length of text for format
    if (self.txtUser.text.length <= 0){
        //change text
        self.txtUser.text = @"Usuario";
        //turn to color black
        self.txtUser.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
    }
}
@end
