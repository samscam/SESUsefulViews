//
//  SESGradientView.m
//  advice
//
//  Created by Sam Easterby-Smith on 28/05/2014.
//  Copyright (c) 2014 Play. All rights reserved.
//

#import "SESGradientView.h"

@interface SESGradientView (){
    CAGradientLayer *gradientLayer;
}

@end

@implementation SESGradientView

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

-(void) setup{
    self.backgroundColor=[UIColor clearColor];
    NSMutableDictionary *nullActions = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[NSNull null], @"onOrderIn",
                                       [NSNull null], @"onOrderOut",
                                       [NSNull null], @"sublayers",
                                       [NSNull null], @"contents",
                                       [NSNull null], @"bounds",
                                       [NSNull null], @"position",
                                       [NSNull null], @"path",
                                       nil];
    
    gradientLayer=(CAGradientLayer*)self.layer;
    gradientLayer.actions=nullActions;

    gradientLayer.startPoint=CGPointMake(0.5,0);
    gradientLayer.endPoint=CGPointMake(0.5,1);
    [self fixColors];
}

+(Class)layerClass{
    return [CAGradientLayer class];
}

-(void) setStartColor:(UIColor *)startColor{
    [self willChangeValueForKey:@"startColor"];
    _startColor=startColor;
    [self didChangeValueForKey:@"endColor"];
    [self fixColors];
}

-(void) setEndColor:(UIColor *)endColor{
    [self willChangeValueForKey:@"endColor"];
    _endColor=endColor;
    [self didChangeValueForKey:@"endColor"];
    [self fixColors];
}
-(void) fixColors{
    if (self.startColor && self.endColor){
    gradientLayer.colors=@[(id)self.startColor.CGColor,(id)self.endColor.CGColor];
    }
}


@end
