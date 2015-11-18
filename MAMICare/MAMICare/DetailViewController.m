//
//  DetailViewController.m
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/5/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView {
    if (self.patient){
        self.imgPatientImage.image = self.patient.photo;
        self.lblPatientName.text = [self.patient getFullName];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
