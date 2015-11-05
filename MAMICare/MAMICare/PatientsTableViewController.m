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

@interface PatientsTableViewController ()

@property (nonatomic, strong) NSMutableArray *patients;
@property (nonatomic, strong) NSArray *filteredPatients;

@end

@implementation PatientsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        Patient *testPatient[5];
        testPatient[0] = [[Patient alloc] initWithPid: 1 name:@"Natalia" lastName:@"Garcia" oid:1 age:21 street:@"Villa Chipinque" streetNumber:318 municipality:@"San Pedro Garza Garcia" city:@"Monterrey" state:@"Nuevo Leon" createdAt: [[NSDate alloc]init] babiesDelivered:1 status:@"Bueno" community:@"Caracol" photo:[UIImage imageNamed:@"w1.png"]];
        
        testPatient[1] = [[Patient alloc] initWithPid: 1 name:@"Paulina" lastName:@"Escalante" oid:2 age:21 street:@"Jeronimo Siller" streetNumber:207 municipality:@"San Pedro Garza Garcia" city:@"Monterrey" state:@"Nuevo Leon" createdAt: [[NSDate alloc]init] babiesDelivered:2 status:@"Regular" community:@"Caracol" photo:[UIImage imageNamed:@"w2.png"]];
        
        testPatient[2] = [[Patient alloc] initWithPid: 1 name:@"Juno" lastName:@"Carrera" oid:1 age:21 street:@"Paseo Junquera" streetNumber:93 municipality:@"Catí" city:@"Catí" state:@"Puebla" createdAt: [[NSDate alloc]init] babiesDelivered:0 status:@"Regular" community:@"Caracol" photo:[UIImage imageNamed:@"w3.png"]];
        
        testPatient[3] = [[Patient alloc] initWithPid: 1 name:@"Obdulia" lastName:@"Rosado Candelaria" oid:1 age:21 street:@"Herrería" streetNumber:91 municipality:@"Monachil" city:@"Monachil" state:@"Yucatán" createdAt: [[NSDate alloc]init] babiesDelivered:5 status:@"Malo" community:@"Caracol" photo:[UIImage imageNamed:@"w4.png"]];
        
        self.patients = [NSMutableArray arrayWithObjects:testPatient[0], testPatient[1], testPatient[2], testPatient[3], testPatient[4], nil];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma Search Bar Filtering and Delegate

- (void)filterPatients:(NSString*)searchText scope:(NSString*)scope {
    NSPredicate *predicate = [NSPredicate
                              predicateWithFormat:@"name contains[c] %@", searchText];
    self.filteredPatients = [self.patients filteredArrayUsingPredicate:predicate];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    
    NSInteger index = [self.searchDisplayController.searchBar selectedScopeButtonIndex];
    NSArray *scopes = [self.searchDisplayController.searchBar scopeButtonTitles];
    [self filterPatients:searchString scope:[scopes objectAtIndex:index]];
    return YES;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    #warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    #warning Incomplete implementation, return the number of rows
        return self.patients.count;
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


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
