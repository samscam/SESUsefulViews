//
//  SESViewController.h
//  SESUsefulViews
//
//  Created by Sam Easterby-Smith on 07/24/2014.
//  Copyright (c) 2014 Sam Easterby-Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SESUsefulViews/SESUsefulViews.h>

@interface SESViewController : UIViewController

@property (nonatomic,weak) IBOutlet SESGradientView *gradientView;
@property (nonatomic,weak) IBOutlet SESCircularImageView *circularImage;

- (IBAction)upperSliderValueChanged:(id)sender;
- (IBAction)lowerSliderValueChanged:(id)sender;

@end
