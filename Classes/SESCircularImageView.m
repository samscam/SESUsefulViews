//
//  SESCircularImageView.h
//  By Sam Easterby-Smith
//  Based on NSCircularImageView by Bruno Furtado on 10/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.

#import "SESCircularImageView.h"

@interface SESCircularImageView (){
    CAShapeLayer *maskLayer;
    CAShapeLayer *borderLayer;
}

- (void)addMaskToBounds:(CGRect)bounds;
- (void)setup;

@end

@implementation SESCircularImageView

- (id) init{
    if ((self=[super init])){
        [self setup];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    if ((self=[super initWithCoder:aDecoder])){
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])){
        [self setup];
    }
    return self;
}
- (id)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void) awakeFromNib{
    
}

- (void)setBorderWidth:(NSNumber *)borderWidth
{
    [self willChangeValueForKey:@"borderWidth"];
    _borderWidth    = borderWidth;
    [self didChangeValueForKey:@"borderWidth"];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setBorderColor:(UIColor *)borderColor
{
    [self willChangeValueForKey:@"borderColor"];
    _borderColor    = borderColor;
    [self didChangeValueForKey:@"borderColor"];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self addMaskToBounds:self.frame];
}

- (void)addMaskToBounds:(CGRect)maskBounds
{
    
    NSMutableDictionary *newActions = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[NSNull null], @"onOrderIn",
                                       [NSNull null], @"onOrderOut",
                                       [NSNull null], @"sublayers",
                                       [NSNull null], @"contents",
                                       [NSNull null], @"bounds",
                                       [NSNull null], @"position",
                                       [NSNull null], @"path",
                                       nil];
    
    if (!maskLayer){
        maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.actions=newActions;
        if (self.maskEnabled){
            [self.layer setMask:maskLayer];
        }
    }
    
    CGPathRef maskPath = CGPathCreateWithEllipseInRect(maskBounds, NULL);
    maskLayer.bounds = maskBounds;
	maskLayer.path = maskPath;
    maskLayer.fillColor = [UIColor blackColor].CGColor;
    
    CGPoint point = CGPointMake(maskBounds.size.width/2, maskBounds.size.height/2);
    maskLayer.position = point;
    

    
    if ([self.borderWidth integerValue] > 0)
    {
        //
        // And then create the outline layer
        //
        if (!borderLayer){
            borderLayer   = [CAShapeLayer layer];
            borderLayer.actions=newActions;
            [self.layer addSublayer:borderLayer];
        }
        borderLayer.bounds            = maskBounds;
        borderLayer.path              = maskPath;
        borderLayer.lineWidth         = [self.borderWidth doubleValue] * 2.0f;
        borderLayer.strokeColor       = self.borderColor.CGColor;
        borderLayer.fillColor         = [UIColor clearColor].CGColor;
        borderLayer.position          = point;
        
    }
    
    CGPathRelease(maskPath);
}

- (void)setup
{
    _maskEnabled=YES;
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
    if (!self.borderWidth){
        self.borderWidth    = @0.0f;
    }
    if (!self.borderColor){
        self.borderColor    = [UIColor whiteColor];
    }
}

-(void) setMaskEnabled:(BOOL)maskEnabled{
    if (maskEnabled){
        [self.layer setMask:maskLayer];
        borderLayer.hidden=NO;
    } else {
        [self.layer setMask:nil];
        borderLayer.hidden=YES;

    }
}
@end
