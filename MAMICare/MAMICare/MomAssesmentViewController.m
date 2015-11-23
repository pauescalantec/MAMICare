//
//  MomAssesmentViewController.m
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/18/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "MomAssesmentViewController.h"

@interface MomAssesmentViewController ()

@end

@implementation MomAssesmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // init the assesment if not yet initialized
    if (!self.assessment) {
        self.assessment = [[Assessment alloc] init];
    }
    
    [self setStartTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Helper Functions

- (void)retrieveDataFromFormToAssessment {
    self.assessment.weight = [self.tffundalHeight.text doubleValue];
    self.assessment.pulse = [self.tfPulse.text integerValue];
    self.assessment.systolicHeartRate = [self.tfSystolicHeartRate.text integerValue];
    self.assessment.diastolicHeartRate = [self.tfDiastolicHeartRate.text integerValue];
    self.assessment.fundalHeight = [self.tffundalHeight.text doubleValue];
    
    self.assessment.urineTest = [self.tfUrineTest.text doubleValue];
    self.assessment.basalGlucose = [self.tfBasalGlucose.text integerValue];
    self.assessment.oxygen = [self.tfOxygen.text integerValue];
    
    self.assessment.fetalHeartBeat = [self.tfFetalHeartBeat.text integerValue];
    self.assessment.fetalRegion = [self.tfFetalRegion.text integerValue];
    self.assessment.contractionsExist = [self.swtcontractionsExist isOn];
    self.assessment.contractionsTime = [self.tfContractionsTime.text integerValue];
    self.assessment.observations = self.tvObservations.text;
}

#pragma mark - Date Helper Functions

- (void)setStartTime {
    self.assessment.startTime = [NSDate date];
}

#pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier
                                  sender:(id)sender {
    // validates all data from the object...
    [self retrieveDataFromFormToAssessment];
    return [self.assessment physicalFieldsCompleted] &&
           [self.assessment chemicalFieldsCompleted] &&
           [self.assessment fetusFieldsCompleted];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // sets the assesment for the next part of the form
    [[segue destinationViewController] setAssessment:self.assessment];
}

@end
