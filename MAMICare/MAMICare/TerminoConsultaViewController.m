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
    [self configureUserInfoInView];
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

#pragma mark - View Helper Functions

- (void)configureUserInfoInView {
    self.labelFirstName.text = self.patient.name;
    self.labelLastName.text = self.patient.getFullName;
    self.picturePatient.image = [HelperVC getPhotoForUser:self.patient];
}

- (IBAction)btnMenu:(UIBarButtonItem *)sender {
    [self popView];
}

- (void) popView {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
