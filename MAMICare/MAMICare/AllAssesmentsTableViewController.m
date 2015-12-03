//
//  AllAssesmentsTableViewController.m
//  MAMICare
//
//  Created by Pau Escalante on 12/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "AllAssesmentsTableViewController.h"
#import "HelperVC.h"
#import "HistorialTableViewCell.h"
#import "Assessment.h"

@interface AllAssesmentsTableViewController ()

@end

@implementation AllAssesmentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listaConsultas = self.patient.loadAllAssessments;
    
    self.lblFirst.text = self.patient.name;
    self.lblLast.text = self.patient.getFullName;
    self.imgPatient.image = [HelperVC getPhotoForUser:self.patient];
    
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
    return self.listaConsultas.count;
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
     Assessment *a = self.listaConsultas[indexPath.row];
     self.assessment = a;
     
     [[segue destinationViewController] setPatient:self.patient];
     [[segue destinationViewController] setImageTaken:self.imgPatient.image];
     [[segue destinationViewController] setAssessment:self.assessment];
 }



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HistorialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    Assessment *obj = self.listaConsultas[indexPath.row];
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *objConsulta = [NSString stringWithFormat:@"%@",
                               [formatter stringFromDate:obj.startTime]];
    NSString *result = [@"Consulta con fecha: " stringByAppendingString:objConsulta];
    cell.txtConsulta.text = result;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


@end
