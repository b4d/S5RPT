//
//  MKCircleViewGradient.m
//  S5RPT
//
//  Created by Deni Bacic on 16. 03. 13.
//  Copyright (c) 2013 Deni Bacic. All rights reserved.
//

#import "MKCircleViewGradient.h"

@implementation MKCircleViewGradient

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)fillPath:(CGPathRef)path inContext:(CGContextRef)context
{
    CGRect rect = CGPathGetBoundingBox(path);
    
    CGContextAddPath(context, path);
    CGContextClip(context);
    
    CGFloat gradientLocations[2] = {0.6f, 1.0f};
    // Start color white with 0.25 alpha,
    // End color green with 0.25 alpha
    CGFloat gradientColors[8] = {0.0f, 1.0f, 0.0f, 0.25f, 1.0f, 1.0f, 1.0f, 0.0f};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, gradientColors, gradientLocations, 2);
    CGColorSpaceRelease(colorSpace);
    
    CGPoint gradientCenter = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGFloat gradientRadius = MIN(rect.size.width, rect.size.height) / 2;
    
    CGContextDrawRadialGradient(context, gradient, gradientCenter, 0, gradientCenter, gradientRadius, kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradient);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
