//
//  ResultsTableController.m
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/5/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "ResultsTableController.h"
#import "PatientTableViewCell.h"
#import "Patient.h"

@interface ResultsTableController ()

@end

@implementation ResultsTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredPatients.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PatientTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PatientCell" forIndexPath:indexPath];
    
    Patient *patient = self.filteredPatients[indexPath.row];
    [self configureCell:cell forPatient:patient];
    
    return cell;
}

- (void)configureCell:(PatientTableViewCell *)cell forPatient:(Patient *)patient {
# warning Implement configureCell method
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
