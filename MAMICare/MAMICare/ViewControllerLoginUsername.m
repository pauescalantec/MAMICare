//
//  ViewControllerLoginUsername.m
//  MAMICare
//
//  Created by Pau Escalante on 11/13/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "ViewControllerLoginUsername.h"
#import "ViewControllerLogin.h"

@interface ViewControllerLoginUsername ()

@end

@implementation ViewControllerLoginUsername

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //button formatting
    self.outBtnNext.layer.cornerRadius = 5;
    self.outShadow.layer.masksToBounds = YES;
    self.outShadow.layer.cornerRadius = 5;
    
    //Back box formatting
    self.outBackBox.layer.masksToBounds = YES;
    self.outBackBox.layer.cornerRadius = 5;
    self.labWarning.hidden = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(removeKb)];
    
    [self.view addGestureRecognizer:tap];
    [self registerForKeyboardNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //send username to next view controller
    if ([[segue identifier] isEqualToString: @"login"]) {
        ViewControllerLogin *viewLogin = [segue destinationViewController];
        viewLogin.strUser = self.txtUser.text;
    }
}

//validate segue if user has not entered username
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"login"])  {
        if ([self.txtUser.text isEqualToString:@"Usuario"]){
            self.labWarning.hidden = NO;
            return NO;
        }
        return YES;
    }
    else {
        return YES;
    }
}

// Editing User TF
- (IBAction)actEditing:(UITextField *)sender {
    self.activeField = sender;
    //check if there is previous user input
    if ([self.txtUser.text isEqualToString:@"Usuario"]){
        //empty text
        self.txtUser.text = @"";
        //turn to color black
        self.txtUser.textColor = [UIColor blackColor];
    }
}

// Editing User TF
- (IBAction)actFinishEdit:(UITextField *)sender {
    self.activeField = nil;
    //check length of text for format
    if (self.txtUser.text.length <= 0){
        //change text
        self.txtUser.text = @"Usuario";
        //turn to color black
        self.txtUser.textColor = [UIColor colorWithRed:(191/255.0f) green:(190/255.0f) blue:(192/255.0f) alpha:1];
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

@end
