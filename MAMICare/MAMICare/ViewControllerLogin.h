//
//  ViewControllerLogin.h
//  MAMICare
//
//  Created by Pau Escalante on 10/8/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialWorker.h"

extern SocialWorker *currentUser;

@interface ViewControllerLogin : UIViewController

@property (nonatomic, strong) NSString *strUser;

@property (nonatomic, strong) NSString *strPassword;

@property (strong, nonatomic) IBOutlet UITextField *txtUser;

@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

@property (strong, nonatomic) IBOutlet UIButton *outBtnNext;

@property (strong, nonatomic) IBOutlet UILabel *outShadow;

@property (strong, nonatomic) IBOutlet UILabel *outBackBox;

- (IBAction)actEditing:(UITextField *)sender;

- (IBAction)actFinishEdit:(UITextField *)sender;

@property (nonatomic, strong) UITextField *activeField;

@property (strong, nonatomic) IBOutlet UIScrollView *outScroller;

- (IBAction)actEditingUser:(UITextField *)sender;

- (IBAction)actFinishEditUser:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UILabel *outPassword;

@property (strong, nonatomic) IBOutlet UILabel *labWarning;

@end
