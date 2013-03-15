//
//  DetailsViewController.m
//  S5RPT
//
//  Created by Deni Bacic on 8. 02. 13.
//  Copyright (c) 2013 Deni Bacic. All rights reserved.
//

#import "DetailsViewController.h"


@interface DetailsViewController ()

@end

@implementation DetailsViewController
@synthesize rpt;
@synthesize labelAsl, labelId, labelInput, labelLoc, labelNote, labelOutput, labelOwner, labelRpt, labelStatus, labelSysop, labelTone;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationItem.title = rpt.Name;
    
    labelId.text = rpt.ID;
    labelInput.text = [NSString stringWithFormat:@"%@ MHz", rpt.Input];
    labelOutput.text = [NSString stringWithFormat:@"%@ MHz", rpt.Output];
    labelRpt.text = rpt.Rpt;
    labelLoc.text = rpt.Loc;
    labelAsl.text = [NSString stringWithFormat:@"%@ m", rpt.Asl];
    labelNote.text = rpt.Note;
    labelOwner.text = rpt.Owner;
    labelSysop.text = rpt.Sysop;
    labelTone.text = [NSString stringWithFormat:@"%@ MHz", rpt.Tone];
    labelStatus.text = [rpt.Status isEqualToString:@"1"] ? @"ON AIR" : @"OFF AIR";
    labelStatus.textColor = [rpt.Status isEqualToString:@"1"] ? [UIColor greenColor] : [UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
