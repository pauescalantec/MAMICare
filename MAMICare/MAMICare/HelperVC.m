//
//  HelperVC.m
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/27/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "HelperVC.h"
#import <AssetsLibrary/AssetsLibrary.h>

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

    __block UIImage *patientPhoto;
    NSString *defaultURL = @"UsuarioDefault";
    NSURL *refURL = [NSURL URLWithString:patient.imageAssetURL];
    
    // block to call when we get the asset based on the url (below)
    ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *imageAsset) {
        patientPhoto = [self imageFromAsset:imageAsset];
    };
    // get the asset library and fetch the asset based on the ref url (pass in block above)
    ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init];
    [assetslibrary assetForURL:refURL resultBlock:resultblock failureBlock:nil];

    return (patientPhoto) ? patientPhoto : [UIImage imageNamed:defaultURL];
}

+ (UIImage *)imageFromAsset:(ALAsset *)asset {
    ALAssetRepresentation *representation = [asset defaultRepresentation];
    return [UIImage imageWithCGImage:representation.fullResolutionImage
                               scale:[representation scale]
                         orientation:(UIImageOrientation)[representation orientation]];
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
