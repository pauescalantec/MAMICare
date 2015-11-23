//
//  PatientsTableViewController.h
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientsTableViewController : UITableViewController<UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

// outlets
@property (weak, nonatomic) IBOutlet UISearchBar *sbPatientSearchBar;

@property (nonatomic, strong) NSString *strSegue;

@end
