//
//  SESViewController.m
//  SESUsefulViews
//
//  Created by Sam Easterby-Smith on 07/24/2014.
//  Copyright (c) 2014 Sam Easterby-Smith. All rights reserved.
//

#import "SESViewController.h"

@interface SESViewController ()

@end

@implementation SESViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)upperSliderValueChanged:(id)sender {
    UISlider *upperSlider=sender;
    self.gradientView.startColor=[UIColor colorWithHue:0 saturation:1.0 brightness:1.0 alpha:upperSlider.value];
    
}

- (IBAction)lowerSliderValueChanged:(id)sender {
    UISlider *slider=sender;
    self.circularImage.borderWidth=slider.value;
}
@end
