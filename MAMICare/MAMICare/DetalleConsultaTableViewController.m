//
//  DetalleConsultaTableViewController.m
//  MAMICare
//
//  Created by Pau Escalante on 12/2/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "DetalleConsultaTableViewController.h"
#import "ConsultaCustomTableCell.h"
#import "FieldConsulta.h"
#import "HelperVC.h"

@interface DetalleConsultaTableViewController ()

@property NSMutableArray *listaFieldsConsulta;

@end

@implementation DetalleConsultaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Configure user
    self.lblFirst.text = self.patient.name;
    self.lblLast.text = self.patient.getFullName;
    self.imagePaciente.image = [HelperVC getPhotoForUser:self.patient];
    
    FieldConsulta *f1 = [[FieldConsulta alloc] initWithField:@"Peso"
                            dato:[NSString stringWithFormat: @"%.2f", self.assessment.weight]];
    
    FieldConsulta *f2 = [[FieldConsulta alloc] initWithField:@"Pulso"
                            dato:[NSString stringWithFormat: @"%i", self.assessment.pulse]];
    
    FieldConsulta *f3 = [[FieldConsulta alloc] initWithField:@"Altura Fondo Uterino"
                            dato:[NSString stringWithFormat: @"%.2f", self.assessment.fundalHeight]];
    
    FieldConsulta *f4 = [[FieldConsulta alloc] initWithField:@"Ritmo Cardiaco Sistólico"
                            dato:[NSString stringWithFormat: @"%i", self.assessment.systolicHeartRate]];
    
    FieldConsulta *f5 = [[FieldConsulta alloc] initWithField:@"Ritmo Cardiaco Diastólico"
                            dato:[NSString stringWithFormat: @"%i", self.assessment.diastolicHeartRate]];
    
    FieldConsulta *f6 = [[FieldConsulta alloc] initWithField:@"Prueba de Urina"
                            dato:[NSString stringWithFormat: @"%.2f", self.assessment.urineTest]];
    
    FieldConsulta *f7 = [[FieldConsulta alloc] initWithField:@"Nivel de Glucosa Basal"
                            dato:[NSString stringWithFormat: @"%i", self.assessment.basalGlucose]];
    
    FieldConsulta *f8 = [[FieldConsulta alloc] initWithField:@"Nivel de Oxigeno en la Sangre"
                            dato:[NSString stringWithFormat: @"%i", self.assessment.oxygen]];
    
    FieldConsulta *f9 = [[FieldConsulta alloc] initWithField:@"Ritmo Cardíaco Fetal"
                            dato:[NSString stringWithFormat: @"%i", self.assessment.fetalHeartBeat]];
    
    FieldConsulta *f10 = [[FieldConsulta alloc] initWithField:@"Región Fetal"
                          dato:[NSString stringWithFormat: @"%i", self.assessment.fetalRegion]];
    
    FieldConsulta *f11;
    
    //si existen contracciones
    if (self.assessment.contractionsExist){
        f11 = [[FieldConsulta alloc] initWithField:@"Tiempo entre contracciones"
                          dato:[NSString stringWithFormat: @"%i", self.assessment.contractionsTime]];
    }
    
    else{
        f11 = [[FieldConsulta alloc] initWithField:@"No existen contracciones" dato:@"--"];
    }
    
    FieldConsulta *f12 = [[FieldConsulta alloc] initWithField:@"Observaciones"
                          dato:@"Abrir"];
                            
    self.listaFieldsConsulta = [[NSMutableArray alloc] initWithObjects: f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, nil];


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
    return self.listaFieldsConsulta.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ConsultaCustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.userInteractionEnabled = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.verObservaciones.hidden = YES;
//    cell.verObservaciones.enabled = NO;
//    
//    if ([cell.lblField.text isEqualToString:@"Observaciones"]){
//        cell.verObservaciones.hidden = NO;
//        cell.verObservaciones.enabled = YES;
    
//        cell.userInteractionEnabled = YES;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        
//        //set the position of the button
//        self.verObservaciones = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        self.verObservaciones.frame = CGRectMake(873, 20, 132, 50);
//        [self.verObservaciones setTitle:@"Abrir" forState:UIControlStateNormal];
//        UIFont *font = [UIFont systemFontOfSize:20];
//        self.verObservaciones.titleLabel.font = font;
//        [self.verObservaciones setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        
//        self.verObservaciones.backgroundColor= [UIColor clearColor];
//        self.verObservaciones.enabled = YES;
//        [cell addSubview:self.verObservaciones];
//        [self.verObservaciones addTarget:self action:@selector(btnObservaciones:) forControlEvents:UIControlEventTouchUpInside];
    //}
    
    FieldConsulta *object = self.listaFieldsConsulta[indexPath.row];
    NSString *objField = object.field;
    NSString *objDato = object.dato;
    
    cell.lblField.text = objField;
    cell.lblDato.text = objDato;
    //cell.observationText = self.assessment.observations;

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
    
    FieldConsulta *obj = self.listaFieldsConsulta[index.row];
    NSString *txt = obj.field;
    
    if ([txt isEqualToString:@"Observaciones"]){
        //alert error
        UIAlertController *alert =  [UIAlertController alertControllerWithTitle:@"Observaciones"
                                                                        message:self.assessment.observations
                                                                 preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}



@end
