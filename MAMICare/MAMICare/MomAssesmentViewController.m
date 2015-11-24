//
//  MomAssesmentViewController.m
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/18/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "MomAssesmentViewController.h"

@interface MomAssesmentViewController ()

@end

@implementation MomAssesmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(removeKb)];
    [self.view addGestureRecognizer:tap];
    
    self.btnCancel.enabled = YES;
    
    [self registerForKeyboardNotifications];
    
    [self createScrollMenu];
    
    // init the assesment if not yet initialized
    if (!self.assessment) {
        self.assessment = [[Assessment alloc] init];
    }
    
    [self setStartTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Helper Functions

- (void)retrieveDataFromFormToAssessment {
    self.assessment.weight = [self.tffundalHeight.text doubleValue];
    self.assessment.pulse = [self.tfPulse.text integerValue];
    self.assessment.systolicHeartRate = [self.tfSystolicHeartRate.text integerValue];
    self.assessment.diastolicHeartRate = [self.tfDiastolicHeartRate.text integerValue];
    self.assessment.fundalHeight = [self.tffundalHeight.text doubleValue];
    
    self.assessment.urineTest = [self.tfUrineTest.text doubleValue];
    self.assessment.basalGlucose = [self.tfBasalGlucose.text integerValue];
    self.assessment.oxygen = [self.tfOxygen.text integerValue];
    
    self.assessment.fetalHeartBeat = [self.tfFetalHeartBeat.text integerValue];
    self.assessment.fetalRegion = [self.tfFetalRegion.text integerValue];
    self.assessment.contractionsExist = [self.swtcontractionsExist isOn];
    self.assessment.contractionsTime = [self.tfContractionsTime.text integerValue];
    //validate for default
    self.assessment.observations = (self.tvObservations.text);
}

#pragma mark - Date Helper Functions

- (void)setStartTime {
    self.assessment.startTime = [NSDate date];
}

#pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier
                                  sender:(id)sender {
    // validates all data from the object...
    [self retrieveDataFromFormToAssessment];
    bool pass=  [self.assessment physicalFieldsCompleted] &&
           [self.assessment chemicalFieldsCompleted] &&
           [self.assessment fetusFieldsCompleted];
    return pass;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // sets the assesment for the next part of the form
    [[segue destinationViewController] setAssessment:self.assessment];
}

// Remove Keyboard
- (void) removeKb
{
    [self.view endEditing: YES];
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name: UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name: UIKeyboardWillHideNotification object:nil];
}

// Called when the UIKeyboardDidShowNotification is sent.
// Called an when a txt field is active
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSInteger status = 300;
    NSInteger difference = status - 150;
    [self.outScroll setContentOffset:CGPointMake(0.0, difference) animated:YES];
    
    
}

// Called when the UIKeyboardWillHideNotification is sent
// Called after remove Keyboard to return scroller to its position
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [self.outScroll setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
}


- (void)createScrollMenu
{
    
    int x = (self.view.frame.size.width/2) - 224;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 185, self.view.frame.size.width, 510)];
    scrollView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:0];
    UIFont *font = [UIFont systemFontOfSize:20];
    
    for (int i = 1; i <= 23; i++) {
        //create view
        UIView *backgroundLabel = [[UIView alloc] initWithFrame:CGRectMake(x, 0, 448, 400)];
        UIColor *topColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:.88];
        UIColor *bottomColor = [UIColor colorWithRed:130.0/255.0 green:130.0/255.0 blue:130.0/255.0 alpha:.6];
        backgroundLabel.backgroundColor = topColor;
        backgroundLabel.layer.cornerRadius = 5;
        backgroundLabel.layer.masksToBounds = YES;
        
        // Create Text Fields
        if (i ==1){
            self.tfWeight = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 448, 400)];
            [self.tfWeight setTextAlignment:NSTextAlignmentCenter];
            [self.tfWeight setBackgroundColor:[UIColor clearColor]];
            self.tfWeight.font = font;
            [self.tfWeight setKeyboardType:UIKeyboardTypeNumberPad];
            self.tfWeight.keyboardAppearance = UIKeyboardAppearanceDark;
            self.tfWeight.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Introducir Peso" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
            
            UITextField *line= [[UITextField alloc] initWithFrame:CGRectMake(0, 10, 448, 400)];
            [line setBackgroundColor:[UIColor clearColor]];
            [line setTextAlignment:NSTextAlignmentCenter];
            line.font = font;
            [line setText:@"_____________________________"];
            
            self.l1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 418, 40)];
            [self.l1 setTextAlignment:NSTextAlignmentCenter];
            self.l1.backgroundColor = bottomColor;
            self.l1.layer.cornerRadius = 5;
            self.l1.layer.masksToBounds =YES;
            self.l1.text = @"Peso";
            self.l1.font = font;
            self.l1.hidden = YES;
            
            [backgroundLabel addSubview:self.l1];
            [backgroundLabel addSubview:line];
            line.enabled = NO;
            [backgroundLabel addSubview:self.tfWeight];
            
            [self.tfWeight addTarget:self
                          action:@selector(tfWeightDone:)
                forControlEvents:UIControlEventEditingDidEnd];
        }
        
        if (i ==3){
            self.tfPulse= [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 448, 400)];
            [self.tfPulse setTextAlignment:NSTextAlignmentCenter];
            [self.tfPulse setBackgroundColor:bottomColor];
            self.tfPulse.font = font;
            [self.tfPulse setKeyboardType:UIKeyboardTypeNumberPad];
            self.tfPulse.keyboardAppearance = UIKeyboardAppearanceDark;
            self.tfPulse.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Introducir Pulso" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
            self.tfPulse.enabled = NO;
            
            UITextField *line= [[UITextField alloc] initWithFrame:CGRectMake(0, 10, 448, 400)];
            [line setBackgroundColor:[UIColor clearColor]];
            [line setTextAlignment:NSTextAlignmentCenter];
            line.font = font;
            [line setText:@"_____________________________"];
            line.enabled = NO;
            
            self.l3 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 418, 40)];
            [self.l3 setTextAlignment:NSTextAlignmentCenter];
            self.l3.backgroundColor = bottomColor;
            self.l3.layer.cornerRadius = 5;
            self.l3.layer.masksToBounds =YES;
            self.l3.text = @"Pulso";
            self.l3.font = font;
            self.l3.hidden = YES;
            
            [backgroundLabel addSubview:self.l3];
            [backgroundLabel addSubview:line];
            [backgroundLabel addSubview:self.tfPulse];
            
            [self.tfPulse addTarget:self
                              action:@selector(tfPulseDone:)
                    forControlEvents:UIControlEventEditingDidEnd];
            
        }
        
        if (i ==5){
            self.tffundalHeight = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 448, 400)];
            [self.tffundalHeight setBackgroundColor:bottomColor];
            [self.tffundalHeight setTextAlignment:NSTextAlignmentCenter];
            self.tffundalHeight.font = font;
            [self.tffundalHeight setKeyboardType:UIKeyboardTypeNumberPad];
            self.tffundalHeight.keyboardAppearance = UIKeyboardAppearanceDark;
            self.tffundalHeight.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Introducir Altura Fondo Uterino" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
            self.tffundalHeight.enabled = NO;
            
            UITextField *line= [[UITextField alloc] initWithFrame:CGRectMake(0, 10, 448, 400)];
            [line setBackgroundColor:[UIColor clearColor]];
            [line setTextAlignment:NSTextAlignmentCenter];
            line.font = font;
            [line setText:@"_______________________________________"];
            
            self.l5 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 418, 40)];
            [self.l5 setTextAlignment:NSTextAlignmentCenter];
            self.l5.backgroundColor = bottomColor;
            self.l5.layer.cornerRadius = 5;
            self.l5.layer.masksToBounds =YES;
            self.l5.text = @"Altura Fondo Uterino";
            self.l5.font = font;
            self.l5.hidden = YES;
            
            [backgroundLabel addSubview:self.l5];
            [backgroundLabel addSubview:line];
            line.enabled = NO;
            [backgroundLabel addSubview:self.tffundalHeight];
            
            [self.tffundalHeight addTarget:self
                             action:@selector(tfFundalDone:)
                   forControlEvents:UIControlEventEditingDidEnd];
        }
        
        if (i ==7){
            self.tfSystolicHeartRate = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 448, 400)];
            [self.tfSystolicHeartRate setBackgroundColor:bottomColor];
            [self.tfSystolicHeartRate setTextAlignment:NSTextAlignmentCenter];
            self.tfSystolicHeartRate.font = font;
            [self.tfSystolicHeartRate setKeyboardType:UIKeyboardTypeNumberPad];
            self.tfSystolicHeartRate.keyboardAppearance = UIKeyboardAppearanceDark;
            self.tfSystolicHeartRate.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Introducir Ritmo Cardiaco Sistólico" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
            self.tfSystolicHeartRate.enabled = NO;
            
            UITextField *line= [[UITextField alloc] initWithFrame:CGRectMake(0, 10, 448, 400)];
            [line setBackgroundColor:[UIColor clearColor]];
            [line setTextAlignment:NSTextAlignmentCenter];
            line.font = font;
            [line setText:@"_________________________________________"];
            
            self.l7 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 418, 40)];
            [self.l7 setTextAlignment:NSTextAlignmentCenter];
            self.l7.backgroundColor = bottomColor;
            self.l7.layer.cornerRadius = 5;
            self.l7.layer.masksToBounds =YES;
            self.l7.text = @"Ritmo Cardiaco Sistólico";
            self.l7.font = font;
            self.l7.hidden = YES;
            
            [backgroundLabel addSubview:self.l7];
            [backgroundLabel addSubview:line];
            line.enabled = NO;
            [backgroundLabel addSubview:self.tfSystolicHeartRate];
            
            [self.tfSystolicHeartRate addTarget:self
                             action:@selector(tfSystolicDone:)
                   forControlEvents:UIControlEventEditingDidEnd];
        }
        
        if (i ==9){
            self.tfDiastolicHeartRate = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 448, 400)];
            [self.tfDiastolicHeartRate setBackgroundColor:bottomColor];
            [self.tfDiastolicHeartRate setTextAlignment:NSTextAlignmentCenter];
            self.tfDiastolicHeartRate.font = font;
            [self.tfDiastolicHeartRate setKeyboardType:UIKeyboardTypeNumberPad];
            self.tfDiastolicHeartRate.keyboardAppearance = UIKeyboardAppearanceDark;
            self.tfDiastolicHeartRate.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Introducir Ritmo Cardiaco Diastólico" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
            self.tfDiastolicHeartRate.enabled = NO;
            
            UITextField *line= [[UITextField alloc] initWithFrame:CGRectMake(0, 10, 448, 400)];
            [line setBackgroundColor:[UIColor clearColor]];
            [line setTextAlignment:NSTextAlignmentCenter];
            line.font = font;
            [line setText:@"_________________________________________"];
            
            self.l9 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 418, 40)];
            [self.l9 setTextAlignment:NSTextAlignmentCenter];
            self.l9.backgroundColor = bottomColor;
            self.l9.layer.cornerRadius = 5;
            self.l9.layer.masksToBounds =YES;
            self.l9.text = @"Ritmo Cardiaco Diastólico";
            self.l9.font = font;
            self.l9.hidden = YES;
            
            [backgroundLabel addSubview:self.l9];
            [backgroundLabel addSubview:line];
            line.enabled = NO;
            [backgroundLabel addSubview:self.tfDiastolicHeartRate];
            
            [self.tfDiastolicHeartRate addTarget:self
                             action:@selector(tfDiastolicDone:)
                   forControlEvents:UIControlEventEditingDidEnd];
        }
        
        if (i ==11){
            self.tfUrineTest = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 448, 400)];
            [self.tfUrineTest setBackgroundColor:bottomColor];
            [self.tfUrineTest setTextAlignment:NSTextAlignmentCenter];
            self.tfUrineTest.font = font;
            [self.tfUrineTest setKeyboardType:UIKeyboardTypeNumberPad];
            self.tfUrineTest.keyboardAppearance = UIKeyboardAppearanceDark;
            self.tfUrineTest.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Resultados de Prueba de Urina" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
            self.tfUrineTest.enabled = NO;
            
            UITextField *line= [[UITextField alloc] initWithFrame:CGRectMake(0, 10, 448, 400)];
            [line setBackgroundColor:[UIColor clearColor]];
            [line setTextAlignment:NSTextAlignmentCenter];
            line.font = font;
            [line setText:@"_________________________________________"];
            
            
            self.l11 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 418, 40)];
            [self.l11 setTextAlignment:NSTextAlignmentCenter];
            self.l11.backgroundColor = bottomColor;
            self.l11.layer.cornerRadius = 5;
            self.l11.layer.masksToBounds =YES;
            self.l11.text = @"Prueba de Urina";
            self.l11.font = font;
            self.l11.hidden = YES;
            
            [backgroundLabel addSubview:self.l11];
            [backgroundLabel addSubview:line];
            line.enabled = NO;
            [backgroundLabel addSubview:self.tfUrineTest];
            
            [self.tfUrineTest addTarget:self
                             action:@selector(tfUrineDone:)
                   forControlEvents:UIControlEventEditingDidEnd];
        }
        
        if (i ==13){
            self.tfBasalGlucose = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 448, 400)];
            [self.tfBasalGlucose setBackgroundColor:bottomColor];
            [self.tfBasalGlucose setTextAlignment:NSTextAlignmentCenter];
            self.tfBasalGlucose.font = font;
            [self.tfBasalGlucose setKeyboardType:UIKeyboardTypeNumberPad];
            self.tfBasalGlucose.keyboardAppearance = UIKeyboardAppearanceDark;
            self.tfBasalGlucose.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Nivel de Glucosa Basal" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
            self.tfBasalGlucose.enabled = NO;
            
            UITextField *line= [[UITextField alloc] initWithFrame:CGRectMake(0, 10, 448, 400)];
            [line setBackgroundColor:[UIColor clearColor]];
            [line setTextAlignment:NSTextAlignmentCenter];
            line.font = font;
            [line setText:@"______________________________________"];
            
            self.l13 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 418, 40)];
            [self.l13 setTextAlignment:NSTextAlignmentCenter];
            self.l13.backgroundColor = bottomColor;
            self.l13.layer.cornerRadius = 5;
            self.l13.layer.masksToBounds =YES;
            self.l13.text = @"Nivel de Glucosa Basal";
            self.l13.font = font;
            self.l13.hidden = YES;
            
            [backgroundLabel addSubview:self.l13];
            [backgroundLabel addSubview:line];
            line.enabled = NO;
            [backgroundLabel addSubview:self.tfBasalGlucose];
            
            [self.tfBasalGlucose addTarget:self
                             action:@selector(tfBasalDone:)
                   forControlEvents:UIControlEventEditingDidEnd];
        }
        
        if (i ==15){
            self.tfOxygen = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 448, 400)];
            [self.tfOxygen setBackgroundColor:bottomColor];
            [self.tfOxygen setTextAlignment:NSTextAlignmentCenter];
            self.tfOxygen.font = font;
            [self.tfOxygen setKeyboardType:UIKeyboardTypeNumberPad];
            self.tfOxygen.keyboardAppearance = UIKeyboardAppearanceDark;
            self.tfOxygen.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Nivel de Oxigeno en la Sangre" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
            self.tfOxygen.enabled = NO;
            
            UITextField *line= [[UITextField alloc] initWithFrame:CGRectMake(0, 10, 448, 400)];
            [line setBackgroundColor:[UIColor clearColor]];
            [line setTextAlignment:NSTextAlignmentCenter];
            line.font = font;
            [line setText:@"______________________________________"];
            
            self.l15 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 418, 40)];
            [self.l15 setTextAlignment:NSTextAlignmentCenter];
            self.l15.backgroundColor = bottomColor;
            self.l15.layer.cornerRadius = 5;
            self.l15.layer.masksToBounds =YES;
            self.l15.text = @"Nivel de Oxigeno en la Sangre";
            self.l15.font = font;
            self.l15.hidden = YES;
            
            [backgroundLabel addSubview:self.l15];
            [backgroundLabel addSubview:line];
            line.enabled = NO;
            [backgroundLabel addSubview:self.tfOxygen];
            
            [self.tfOxygen addTarget:self
                             action:@selector(tfOxygenDone:)
                   forControlEvents:UIControlEventEditingDidEnd];
        }
        
        if (i ==17){
            self.tfFetalHeartBeat = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 448, 400)];
            [self.tfFetalHeartBeat setBackgroundColor:bottomColor];
            [self.tfFetalHeartBeat setTextAlignment:NSTextAlignmentCenter];
            self.tfFetalHeartBeat.font = font;
            [self.tfFetalHeartBeat setKeyboardType:UIKeyboardTypeNumberPad];
            self.tfFetalHeartBeat.keyboardAppearance = UIKeyboardAppearanceDark;
            self.tfFetalHeartBeat.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Introducir Ritmo Cardiaco Fetal" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
            self.tfFetalHeartBeat.enabled = NO;
            
            UITextField *line= [[UITextField alloc] initWithFrame:CGRectMake(0, 10, 448, 400)];
            [line setBackgroundColor:[UIColor clearColor]];
            [line setTextAlignment:NSTextAlignmentCenter];
            line.font = font;
            [line setText:@"______________________________________"];
            
            self.l17 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 418, 40)];
            [self.l17 setTextAlignment:NSTextAlignmentCenter];
            self.l17.backgroundColor = bottomColor;
            self.l17.layer.cornerRadius = 5;
            self.l17.layer.masksToBounds =YES;
            self.l17.text = @"Ritmo Cardiaco Fetal";
            self.l17.font = font;
            self.l17.hidden = YES;
            
            [backgroundLabel addSubview:self.l17];
            
            [backgroundLabel addSubview:line];
            line.enabled = NO;
            [backgroundLabel addSubview:self.tfFetalHeartBeat];
            
            [self.tfFetalHeartBeat addTarget:self
                             action:@selector(tfFHeartDone:)
                   forControlEvents:UIControlEventEditingDidEnd];
        }
        
        if (i ==19){
            self.tfFetalRegion = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 448, 400)];
            [self.tfFetalRegion setBackgroundColor:bottomColor];
            [self.tfFetalRegion setTextAlignment:NSTextAlignmentCenter];
            self.tfFetalRegion.font = font;
            [self.tfFetalRegion setKeyboardType:UIKeyboardTypeNumberPad];
            self.tfFetalRegion.keyboardAppearance = UIKeyboardAppearanceDark;
            self.tfFetalRegion.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Introducir Region Fetal" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
            self.tfFetalRegion.enabled = NO;
            
            UITextField *line= [[UITextField alloc] initWithFrame:CGRectMake(0, 10, 448, 400)];
            [line setBackgroundColor:[UIColor clearColor]];
            [line setTextAlignment:NSTextAlignmentCenter];
            line.font = font;
            [line setText:@"______________________________________"];
            
            self.l19 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 418, 40)];
            [self.l19 setTextAlignment:NSTextAlignmentCenter];
            self.l19.backgroundColor = bottomColor;
            self.l19.layer.cornerRadius = 5;
            self.l19.layer.masksToBounds =YES;
            self.l19.text = @"Region Fetal";
            self.l19.font = font;
            self.l19.hidden = YES;
            
            [backgroundLabel addSubview:self.l19];
            [backgroundLabel addSubview:line];
            line.enabled = NO;
            [backgroundLabel addSubview:self.tfFetalRegion];
            
            [self.tfFetalRegion addTarget:self
                             action:@selector(tfFRegionDone:)
                   forControlEvents:UIControlEventEditingDidEnd];
        }

        if (i ==21){
            self.labelContraction = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,448, 400)];
            self.labelContraction.backgroundColor = bottomColor;
            
            int xpos = (backgroundLabel.frame.size.width/2) - 15;
            int ypos = (backgroundLabel.frame.size.height/2) - 15;
            self.swtcontractionsExist = [[UISwitch alloc] initWithFrame:CGRectMake(xpos, ypos, 50, 50)];
            [self.swtcontractionsExist addTarget: self action: @selector(flip:) forControlEvents:UIControlEventValueChanged];
            self.swtcontractionsExist.on = YES;
            self.swtcontractionsExist.enabled = NO;
            
            self.labelContractions = [[UILabel alloc] initWithFrame:CGRectMake(0, ypos-100, 448, 100)];
            [self.labelContractions setTextAlignment:NSTextAlignmentCenter];
            self.labelContractions.text = @"¿Existen Contracciones?";
            self.labelContractions.font = font;
            
            self.tfContractionsTime = [[UITextField alloc] initWithFrame:CGRectMake(0, 60, 448, 400)];
            [self.tfContractionsTime setBackgroundColor:[UIColor clearColor]];
            [self.tfContractionsTime setTextAlignment:NSTextAlignmentCenter];
            self.tfContractionsTime.font = font;
            [self.tfContractionsTime setKeyboardType:UIKeyboardTypeNumberPad];
            self.tfContractionsTime.keyboardAppearance = UIKeyboardAppearanceDark;
            self.tfContractionsTime.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Tiempo entre Contracciones" attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
            self.tfContractionsTime.enabled = NO;
            
            self.lineCon= [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 448, 400)];
            [self.lineCon setBackgroundColor:[UIColor clearColor]];
            [self.lineCon setTextAlignment:NSTextAlignmentCenter];
            self.lineCon.font = font;
            [self.lineCon setText:@"__________________________________"];
            self.lineCon.enabled = NO;
            
            [backgroundLabel addSubview:self.labelContraction];
            [backgroundLabel addSubview:self.lineCon];
            [backgroundLabel addSubview:self.tfContractionsTime];
            [backgroundLabel addSubview:self.labelContractions];
            [backgroundLabel addSubview:self.swtcontractionsExist];
            
            [self.tfContractionsTime addTarget:self
                                   action:@selector(tfContractionDone)
                         forControlEvents:UIControlEventEditingDidEnd];
        }
        
        if (i ==23){
            self.tvObservations = [[UITextView alloc] initWithFrame:CGRectMake(50, 50, 348, 310)];
            self.tvObservations.backgroundColor = bottomColor;
            [self.tvObservations setTextAlignment:NSTextAlignmentLeft];
            self.tvObservations.font = font;
            [self.tvObservations setKeyboardType:UIKeyboardTypeAlphabet];
            self.tvObservations.keyboardAppearance = UIKeyboardAppearanceDark;
            self.tvObservations.text = @"Observaciones";
            self.tvObservations.editable = NO;

            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:self.tvObservations];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:self.tvObservations];
            
            [backgroundLabel addSubview:self.tvObservations];
        }

        if ((i%2)== 0) {
            backgroundLabel.frame = CGRectMake(x, 0, 200, 400);
            backgroundLabel.backgroundColor = [UIColor clearColor];
            backgroundLabel.layer.cornerRadius = 5;
            backgroundLabel.layer.masksToBounds = YES;
            
            UIImageView *someImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 150, 150, 150)];
            someImageView.image =  [UIImage imageNamed:@"transition.png"];
            someImageView.contentMode = UIViewContentModeScaleAspectFit;
            
            [backgroundLabel addSubview:someImageView];
        }
        
        //add to scroller
        [scrollView addSubview:backgroundLabel];
        
        x += (backgroundLabel.frame.size.width + 30);
    }
    
    scrollView.contentSize = CGSizeMake(x, scrollView.frame.size.height);
    
    [self.outScroll addSubview:scrollView];
    
}

//cambia el switch
- (IBAction)flip:(UISwitch *)sender {
    if (sender.on){
        self.lineCon.hidden = NO;
        self.tfContractionsTime.hidden = NO;
    }
    
    else{
        self.lineCon.hidden = YES;
        self.tfContractionsTime.hidden = YES;
    }
    
    [self tfContractionDone];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([self.tvObservations.text isEqualToString:@"Observaciones"]){
        //empty text
        self.tvObservations.text = @"";
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([self.tvObservations.text isEqualToString:@""]) {
        self.tvObservations.text = @"Observaciones";
    }
}

- (void)tfWeightDone:(UITextView *)textView
{
    if (![self.tfWeight.text isEqualToString:@""]) {
        self.tfPulse.enabled = YES;
        self.tfPulse.backgroundColor = [UIColor clearColor];
        self.l1.hidden = NO;
    }
    else{
        self.l1.hidden = YES;
    }
}

- (void)tfPulseDone:(UITextView *)textView
{
    if (![self.tfPulse.text isEqualToString:@""]) {
        self.tffundalHeight.enabled = YES;
        self.tffundalHeight.backgroundColor = [UIColor clearColor];
        self.l3.hidden = NO;
    }
    else{
        self.l3.hidden = YES;
    }
}

- (void)tfFundalDone:(UITextView *)textView
{
    if (![self.tffundalHeight.text isEqualToString:@""]) {
        self.tfSystolicHeartRate.enabled = YES;
        self.tfSystolicHeartRate.backgroundColor = [UIColor clearColor];
        self.l5.hidden = NO;
    }
    else{
        self.l5.hidden = YES;
    }
}

- (void)tfSystolicDone:(UITextView *)textView
{
    if (![self.tfSystolicHeartRate.text isEqualToString:@""]) {
        self.tfDiastolicHeartRate.enabled = YES;
        self.tfDiastolicHeartRate.backgroundColor = [UIColor clearColor];
        self.l7.hidden = NO;
    }
    else{
        self.l7.hidden = YES;
    }
}

- (void)tfDiastolicDone:(UITextView *)textView
{
    if (![self.tfDiastolicHeartRate.text isEqualToString:@""]) {
        self.tfUrineTest.enabled = YES;
        self.tfUrineTest.backgroundColor = [UIColor clearColor];
        self.l9.hidden = NO;
    }
    else{
        self.l9.hidden = YES;
    }
}

- (void)tfUrineDone:(UITextView *)textView
{
    if (![self.tfUrineTest.text isEqualToString:@""]) {
        self.tfBasalGlucose.enabled = YES;
        self.tfBasalGlucose.backgroundColor = [UIColor clearColor];
        self.l11.hidden = NO;
    }
    else{
        self.l11.hidden = YES;
    }
}

- (void)tfBasalDone:(UITextView *)textView
{
    if (![self.tfBasalGlucose.text isEqualToString:@""]) {
        self.tfOxygen.enabled = YES;
        self.tfOxygen.backgroundColor = [UIColor clearColor];
        self.l13.hidden = NO;
    }
    else{
        self.l13.hidden = YES;
    }
}

- (void)tfOxygenDone:(UITextView *)textView
{
    if (![self.tfOxygen.text isEqualToString:@""]) {
        self.tfFetalHeartBeat.enabled = YES;
        self.tfFetalHeartBeat.backgroundColor = [UIColor clearColor];
        self.l15.hidden = NO;
    }
    else{
        self.l15.hidden = YES;
    }
}

- (void)tfFHeartDone:(UITextView *)textView
{
    if (![self.tfFetalHeartBeat.text isEqualToString:@""]) {
        self.tfFetalRegion.enabled = YES;
        self.tfFetalRegion.backgroundColor = [UIColor clearColor];
        self.l17.hidden = NO;
    }
    else{
        self.l17.hidden = YES;
    }
}

- (void)tfFRegionDone:(UITextView *)textView
{
    if (![self.tfFetalRegion.text isEqualToString:@""]) {
        self.labelContraction.hidden = YES;
        self.swtcontractionsExist.enabled = YES;
        self.tfContractionsTime.enabled = YES;
        self.l19.hidden = NO;
    }
    else{
        self.l19.hidden = YES;
    }
}

- (void)tfContractionDone
{
    if (self.swtcontractionsExist.on) {
        //Finished form
        if(![self.tfContractionsTime.text isEqualToString:@""]){
            self.labelContractions.text = @"Tiempo entre Contracciones";
            self.tvObservations.editable = YES;
            self.tvObservations.backgroundColor = [UIColor whiteColor];
            self.btnSave.enabled = YES;
        }
        else{
            self.btnSave.enabled = NO;
            self.labelContractions.text = @"¿Existen Contracciones?";
            self.tvObservations.editable = NO;
            self.tvObservations.backgroundColor = [UIColor colorWithRed:130.0/255.0 green:130.0/255.0 blue:130.0/255.0 alpha:.7];
        }
    }
    //Finished form
    else{
        self.labelContractions.text = @"No existen Contracciones";
        self.tvObservations.editable = YES;
        self.tvObservations.backgroundColor = [UIColor whiteColor];
        self.btnSave.enabled = YES;
    }
}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self popView];
}

- (void) popView {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
