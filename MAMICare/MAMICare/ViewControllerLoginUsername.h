//
//  ViewControllerLoginUsername.h
//  MAMICare
//
//  Created by Pau Escalante on 11/13/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerLoginUsername : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *txtUser;

- (IBAction)actEditing:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UIButton *outBtnNext;

@property (strong, nonatomic) IBOutlet UILabel *outShadow;

@property (strong, nonatomic) IBOutlet UILabel *outBackBox;

- (IBAction)actFinishEdit:(UITextField *)sender;

@property (nonatomic, strong) UITextField *activeField;

@property (strong, nonatomic) IBOutlet UIScrollView *outScroller;

@property (strong, nonatomic) IBOutlet UILabel *labWarning;



@end
