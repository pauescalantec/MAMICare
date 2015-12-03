//
//  PatientsTableViewController.m
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "PatientsTableViewController.h"
#import "PatientTableViewCell.h"
#import "Patient.h"
#import "ViewControllerDetalle.h"
#import "ViewControllerNuevoPaciente.h"
#import "ResultsTableController.h"
#import "HelperVC.h"
#import "DBManager.h"

@interface PatientsTableViewController () <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property (nonatomic, strong) NSMutableArray *patients;

@property (nonatomic, strong) NSArray *filteredPatients;

@property BOOL searchActive;

@property (nonatomic, strong) UISearchController *searchController;

// our secondary search results table view
@property (nonatomic, strong) ResultsTableController *resultsTableController;

// for state restoration
@property BOOL searchControllerWasActive;
@property BOOL searchControllerSearchFieldWasFirstResponder;

@end

@implementation PatientsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Patient loadAllPatients];
    self.patients = patientArray;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // restore the searchController's active state
    if (self.searchControllerWasActive) {
        self.searchController.active = self.searchControllerWasActive;
        _searchControllerWasActive = NO;
        
        if (self.searchControllerSearchFieldWasFirstResponder) {
            [self.searchController.searchBar becomeFirstResponder];
            _searchControllerSearchFieldWasFirstResponder = NO;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

#pragma mark - UISearchControllerDelegate

- (void)presentSearchController:(UISearchController *)searchController {
    
}

- (void)willPresentSearchController:(UISearchController *)searchController {
    // do something before the search controller is presented
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    // do something after the search controller is presented
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    // do something before the search controller is dismissed
}

- (void)didDismissSearchController:(UISearchController *)searchController {
    // do something after the search controller is dismissed
}

#pragma Search Bar Filtering and Delegate

//- (void)filterPatients:(NSString*)searchText scope:(NSString*)scope {
//    NSPredicate *predicate = [NSPredicate
//                              predicateWithFormat:@"name contains[c] %@", searchText];
//    self.filteredPatients = [self.patients filteredArrayUsingPredicate:predicate];
//}
//
//- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
//    
//    NSInteger index = [self.searchDisplayController.searchBar selectedScopeButtonIndex];
//    NSArray *scopes = [self.searchDisplayController.searchBar scopeButtonTitles];
//    [self filterPatients:searchString scope:[scopes objectAtIndex:index]];
//    return YES;
//}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return patientArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PatientTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PatientCell" forIndexPath:indexPath];
    Patient *patient = patientArray[indexPath.row];
    [self configureCell:cell forPatient:patient withIndex:indexPath.row];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)configureCell:(PatientTableViewCell *)cell forPatient:(Patient *)patient
            withIndex:(NSInteger)index{
# warning Implement configureCell method
    cell.lblPatientName.text = [NSString stringWithFormat:@"%@ %@",
                                patient.name, [patient getFullName]];
    
    // start babies delivered loops
    int numBabies = [cell.lblBabiesCollection count];
    int i = 0;
    for (; i <= index; i++) {
        [cell.lblBabiesCollection[i] setHidden:NO];
        [cell.lblBabiesCollection[i] layer].cornerRadius = 8.0;
        [cell.lblBabiesCollection[i] layer].masksToBounds = YES;
        [cell.lblVisitsCollection[i] setHidden:NO];
        [cell.lblVisitsCollection[i] layer].cornerRadius = 8.0;
        [cell.lblVisitsCollection[i] layer].masksToBounds = YES;
    }
    for (; i < numBabies; i++) {
        [cell.lblBabiesCollection[i] setHidden:YES];
        [cell.lblVisitsCollection[i] setHidden:YES];
    }
    
    cell.imgPatientImage.image = [HelperVC getPhotoForUser:patient];
}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {    
//    
//}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    // update the filtered array based on the search text
    NSString *searchText = searchController.searchBar.text;
    NSPredicate *predicate = [NSPredicate
                              predicateWithFormat:@"name contains[c] %@", searchText];
    self.filteredPatients = [self.patients filteredArrayUsingPredicate:predicate];
    
    // hand over the filtered results to our search results table
    ResultsTableController *tableController = (ResultsTableController *)self.searchController.searchResultsController;
    tableController.filteredPatients = self.filteredPatients;
    [tableController.tableView reloadData];
}

#pragma mark - UIStateRestoration

// we restore several items for state restoration:
//  1) Search controller's active state,
//  2) search text,
//  3) first responder

NSString *const ViewControllerTitleKey = @"ViewControllerTitleKey";
NSString *const SearchControllerIsActiveKey = @"SearchControllerIsActiveKey";
NSString *const SearchBarTextKey = @"SearchBarTextKey";
NSString *const SearchBarIsFirstResponderKey = @"SearchBarIsFirstResponderKey";

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    
    // encode the view state so it can be restored later
    
    // encode the title
    [coder encodeObject:self.title forKey:ViewControllerTitleKey];
    
    UISearchController *searchController = self.searchController;
    
    // encode the search controller's active state
    BOOL searchDisplayControllerIsActive = searchController.isActive;
    [coder encodeBool:searchDisplayControllerIsActive forKey:SearchControllerIsActiveKey];
    
    // encode the first responser status
    if (searchDisplayControllerIsActive) {
        [coder encodeBool:[searchController.searchBar isFirstResponder] forKey:SearchBarIsFirstResponderKey];
    }
    
    // encode the search bar text
    [coder encodeObject:searchController.searchBar.text forKey:SearchBarTextKey];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
    
    // restore the title
    self.title = [coder decodeObjectForKey:ViewControllerTitleKey];
    
    // restore the active state:
    // we can't make the searchController active here since it's not part of the view
    // hierarchy yet, instead we do it in viewWillAppear
    //
    _searchControllerWasActive = [coder decodeBoolForKey:SearchControllerIsActiveKey];
    
    // restore the first responder status:
    // we can't make the searchController first responder here since it's not part of the view
    // hierarchy yet, instead we do it in viewWillAppear
    //
    _searchControllerSearchFieldWasFirstResponder = [coder decodeBoolForKey:SearchBarIsFirstResponderKey];
    
    // restore the text in the search field
    self.searchController.searchBar.text = [coder decodeObjectForKey:SearchBarTextKey];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //detail view controller
    
    if ([[segue identifier] isEqualToString: @"detallePaciente"]) {
        ViewControllerDetalle *viewPacientes = [segue destinationViewController];
        viewPacientes.strSegue = self.strSegue;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Patient *patient = [patientArray objectAtIndex:indexPath.row];
        NSString *defaultURL = @"UsuarioDefault";
        [[segue destinationViewController] setImageTaken:[UIImage imageNamed:defaultURL]];
        [viewPacientes setPatient:patient];
        
    }
    
    if ([[segue identifier] isEqualToString: @"agregaPaciente"]) {
        ViewControllerNuevoPaciente *agregaPacientes = [segue destinationViewController];
        agregaPacientes.strSegue = self.strSegue;
    }
    
}

@end
