//
//  HelperVC.m
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/27/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "HelperVC.h"

@interface HelperVC ()

@end

@implementation HelperVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User Helper Functions

+ (UIImage *)getPhotoForUser:(Patient *)patient {
    NSString *photoURL = [patient getPhotoURL];
    NSString *defaultURL = @"UsuarioDefault";
    UIImage *patientPhoto = [UIImage imageNamed:photoURL];
    return (patientPhoto) ? patientPhoto : [UIImage imageNamed:defaultURL];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
