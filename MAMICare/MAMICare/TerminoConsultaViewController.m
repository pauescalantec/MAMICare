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

- (IBAction)btnMenu:(UIBarButtonItem *)sender {
    [self popView];
}

- (void) popView {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
