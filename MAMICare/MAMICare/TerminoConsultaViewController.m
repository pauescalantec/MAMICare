//
//  TerminoConsultaViewController.m
//  MAMICare
//
//  Created by Pau Escalante on 11/23/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "TerminoConsultaViewController.h"

@interface TerminoConsultaViewController ()

@end

@implementation TerminoConsultaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.picturePatient.layer.cornerRadius = self.picturePatient.frame.size.width/2;
    self.picturePatient.layer.masksToBounds = YES;
    [self configureUserInfoInView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    // sets the assesment for the next part of the form
    [[segue destinationViewController] setAssessment:self.assessment];
    [[segue destinationViewController] setPatient:self.patient];
    [[segue destinationViewController] setImageTaken:self.imageTaken];
}


#pragma mark - View Helper Functions

- (void)configureUserInfoInView {
    self.labelFirstName.text = self.patient.name;
    self.labelLastName.text = self.patient.getFullName;
    self.picturePatient.image = self.imageTaken;
    //self.picturePatient.image = [HelperVC getPhotoForUser:self.patient];
}

- (IBAction)btnMenu:(UIBarButtonItem *)sender {
    [self popView];
}

- (void) popView {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
