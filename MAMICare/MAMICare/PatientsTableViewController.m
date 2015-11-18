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
        Patient *testPatient[5];
        testPatient[0] = [[Patient alloc] initWithPid: 1 name:@"Natalia" lastName:@"Garcia Torres" oid:1 age:21 street:@"Villa Chipinque" streetNumber:318 municipality:@"San Pedro Garza Garcia" city:@"Monterrey" state:@"Nuevo Leon" createdAt: [[NSDate alloc]init] babiesDelivered:1 status:@"Bueno" community:@"Caracol" photo:[UIImage imageNamed:@"w1.png"]];
        
        testPatient[1] = [[Patient alloc] initWithPid: 1 name:@"Paulina" lastName:@"Escalante Campbell" oid:2 age:21 street:@"Jeronimo Siller" streetNumber:207 municipality:@"San Pedro Garza Garcia" city:@"Monterrey" state:@"Nuevo Leon" createdAt: [[NSDate alloc]init] babiesDelivered:2 status:@"Regular" community:@"Caracol" photo:[UIImage imageNamed:@"w2.png"]];
        
        testPatient[2] = [[Patient alloc] initWithPid: 1 name:@"Juno" lastName:@"Carrera Rodriguez" oid:1 age:21 street:@"Paseo Junquera" streetNumber:93 municipality:@"Catí" city:@"Catí" state:@"Puebla" createdAt: [[NSDate alloc]init] babiesDelivered:0 status:@"Regular" community:@"Caracol" photo:[UIImage imageNamed:@"w3.png"]];
        
        testPatient[3] = [[Patient alloc] initWithPid: 1 name:@"Obdulia" lastName:@"Rosado Candelaria" oid:1 age:21 street:@"Herrería" streetNumber:91 municipality:@"Monachil" city:@"Monachil" state:@"Yucatán" createdAt: [[NSDate alloc]init] babiesDelivered:5 status:@"Malo" community:@"Caracol" photo:[UIImage imageNamed:@"w4.png"]];
        
        self.patients = [NSMutableArray arrayWithObjects:testPatient[0], testPatient[1], testPatient[2], testPatient[3], testPatient[4], nil];

    _resultsTableController = [[ResultsTableController alloc] init];
    _searchController = [[UISearchController alloc]
                         initWithSearchResultsController:self.resultsTableController];
    self.searchController.searchResultsUpdater = self;
    [self.searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    // we want to be the delegate for our filtered table so didSelectRowAtIndexPath is called for both tables
    self.resultsTableController.tableView.delegate = self;
    self.searchController.delegate = self;
    self.searchController.dimsBackgroundDuringPresentation = NO; // default is YES
    self.searchController.searchBar.delegate = self; // so we can monitor text changes + others
    self.definesPresentationContext = YES;
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
    return self.patients.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PatientTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PatientCell" forIndexPath:indexPath];
    Patient *patient = self.patients[indexPath.row];
    [self configureCell:cell forPatient:patient];
    return cell;
}

- (void)configureCell:(PatientTableViewCell *)cell forPatient:(Patient *)patient {
# warning Implement configureCell method
    cell.lblPatientName.text = patient.getFullName;
    cell.imgPatientImage.image = patient.photo;
}

//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    Patient *selectedPatient = (tableView == self.tableView) ?
//        self.patients[indexPath.row] : self.resultsTableController.filteredPatients[indexPath.row];
//    ViewControllerDetalle *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
//    detailViewController.patient = selectedPatient; // hand off the current product to the detail view controller
//    [self.navigationController pushViewController:detailViewController animated:YES];
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
        ViewControllerDetalle *viewPacientes= [segue destinationViewController];
        viewPacientes.strSegue = self.strSegue;
    }
    
    if ([[segue identifier] isEqualToString: @"agregaPaciente"]) {
        ViewControllerNuevoPaciente *agregaPacientes= [segue destinationViewController];
        agregaPacientes.strSegue = self.strSegue;
    }
    
}

@end
