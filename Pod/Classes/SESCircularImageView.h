//
//  SESCircularImageView.h
//  By Sam Easterby-Smith
//  Based on NSCircularImageView by Bruno Furtado on 10/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.


#import <UIKit/UIKit.h>

@interface SESCircularImageView : UIImageView

@property (nonatomic) BOOL maskEnabled;
@property (nonatomic, copy) UIColor*    borderColor;
@property (nonatomic) CGFloat   borderWidth;

@end
