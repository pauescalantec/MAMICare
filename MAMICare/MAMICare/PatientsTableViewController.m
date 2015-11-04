//
//  PatientsTableViewController.m
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "PatientsTableViewController.h"

@interface PatientsTableViewController ()

@property (nonatomic, strong) NSMutableArray *patients;
@property (nonatomic, strong) NSArray *filteredPatients;

@end

@implementation PatientsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PatientCell" forIndexPath:indexPath];
    
    #warning We're missing the patient class implementation
    // Configure the cell...
    
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
