//
//  VectorTestClasses.m
//  VectorPlayground
//
//  Created by Michael Maxwell on 12/6/13.
//  Copyright (c) 2013 Michael Maxwell. All rights reserved.
//

#import "VectorTestClasses.h"

/**
 *  This block of code holds the vector drawing code for the two classes in this file, but it could also be put directly into the drawInCurrentContext method without using blocks.
 */
void (^drawTestVector)(void) = ^{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* circleFillColor = [UIColor colorWithRed: 0.247 green: 0.431 blue: 0.71 alpha: 1];
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* yellow = [UIColor colorWithRed: 1 green: 0.737 blue: 0.282 alpha: 1];
    UIColor* orange = [UIColor colorWithRed: 1 green: 0.855 blue: 0.608 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)yellow.CGColor,
                               (id)orange.CGColor, nil];
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// User circle
    {
        //// User Portrait
        {
            CGContextSaveGState(context);
            
            //// Clip Bezier 2
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(336.11, 62.88)];
            [bezier2Path addCurveToPoint: CGPointMake(336.11, 336.12) controlPoint1: CGPointMake(411.56, 138.33) controlPoint2: CGPointMake(411.56, 260.67)];
            [bezier2Path addCurveToPoint: CGPointMake(62.89, 336.12) controlPoint1: CGPointMake(260.66, 411.57) controlPoint2: CGPointMake(138.34, 411.57)];
            [bezier2Path addCurveToPoint: CGPointMake(62.89, 62.88) controlPoint1: CGPointMake(-12.56, 260.67) controlPoint2: CGPointMake(-12.56, 138.33)];
            [bezier2Path addCurveToPoint: CGPointMake(336.11, 62.88) controlPoint1: CGPointMake(138.34, -12.57) controlPoint2: CGPointMake(260.66, -12.57)];
            [bezier2Path closePath];
            [bezier2Path addClip];
            
            
            //// Circle fill Drawing
            UIBezierPath* circleFillPath = [UIBezierPath bezierPath];
            [circleFillPath moveToPoint: CGPointMake(336.11, 62.26)];
            [circleFillPath addCurveToPoint: CGPointMake(336.11, 335.5) controlPoint1: CGPointMake(411.56, 137.72) controlPoint2: CGPointMake(411.56, 260.05)];
            [circleFillPath addCurveToPoint: CGPointMake(62.89, 335.5) controlPoint1: CGPointMake(260.66, 410.96) controlPoint2: CGPointMake(138.34, 410.96)];
            [circleFillPath addCurveToPoint: CGPointMake(62.89, 62.26) controlPoint1: CGPointMake(-12.56, 260.05) controlPoint2: CGPointMake(-12.56, 137.72)];
            [circleFillPath addCurveToPoint: CGPointMake(336.11, 62.26) controlPoint1: CGPointMake(138.34, -13.19) controlPoint2: CGPointMake(260.66, -13.19)];
            [circleFillPath closePath];
            circleFillPath.miterLimit = 4;
            
            [circleFillColor setFill];
            [circleFillPath fill];
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(293.36, 315.67)];
            [bezier3Path addCurveToPoint: CGPointMake(235.97, 257.83) controlPoint1: CGPointMake(249.87, 299.82) controlPoint2: CGPointMake(235.97, 286.46)];
            [bezier3Path addCurveToPoint: CGPointMake(255.07, 214.79) controlPoint1: CGPointMake(235.97, 240.64) controlPoint2: CGPointMake(249.25, 246.25)];
            [bezier3Path addCurveToPoint: CGPointMake(271.47, 184.77) controlPoint1: CGPointMake(257.49, 201.73) controlPoint2: CGPointMake(269.22, 214.58)];
            [bezier3Path addCurveToPoint: CGPointMake(265.06, 169.94) controlPoint1: CGPointMake(271.47, 172.89) controlPoint2: CGPointMake(265.06, 169.94)];
            [bezier3Path addCurveToPoint: CGPointMake(269.59, 138.83) controlPoint1: CGPointMake(265.06, 169.94) controlPoint2: CGPointMake(268.31, 152.36)];
            [bezier3Path addCurveToPoint: CGPointMake(234.97, 74.51) controlPoint1: CGPointMake(270.79, 125.97) controlPoint2: CGPointMake(275.63, 79.36)];
            [bezier3Path addCurveToPoint: CGPointMake(199.5, 61.96) controlPoint1: CGPointMake(232.65, 64.21) controlPoint2: CGPointMake(213.8, 61.96)];
            [bezier3Path addCurveToPoint: CGPointMake(140.56, 84.88) controlPoint1: CGPointMake(170.77, 61.96) controlPoint2: CGPointMake(150.96, 72.72)];
            [bezier3Path addCurveToPoint: CGPointMake(129.4, 138.83) controlPoint1: CGPointMake(129.1, 98.26) controlPoint2: CGPointMake(128.57, 130)];
            [bezier3Path addCurveToPoint: CGPointMake(133.92, 169.94) controlPoint1: CGPointMake(130.67, 152.36) controlPoint2: CGPointMake(133.92, 169.94)];
            [bezier3Path addCurveToPoint: CGPointMake(127.52, 184.77) controlPoint1: CGPointMake(133.92, 169.94) controlPoint2: CGPointMake(127.52, 172.89)];
            [bezier3Path addCurveToPoint: CGPointMake(143.91, 214.79) controlPoint1: CGPointMake(129.76, 214.58) controlPoint2: CGPointMake(141.49, 201.73)];
            [bezier3Path addCurveToPoint: CGPointMake(163.01, 257.83) controlPoint1: CGPointMake(149.75, 246.26) controlPoint2: CGPointMake(163.01, 240.64)];
            [bezier3Path addCurveToPoint: CGPointMake(105.62, 315.67) controlPoint1: CGPointMake(163.01, 286.46) controlPoint2: CGPointMake(149.12, 299.82)];
            [bezier3Path addCurveToPoint: CGPointMake(33.65, 358.84) controlPoint1: CGPointMake(62, 331.58) controlPoint2: CGPointMake(33.65, 347.79)];
            [bezier3Path addCurveToPoint: CGPointMake(33.65, 395.98) controlPoint1: CGPointMake(33.65, 369.89) controlPoint2: CGPointMake(33.65, 395.98)];
            [bezier3Path addLineToPoint: CGPointMake(199.5, 395.98)];
            [bezier3Path addLineToPoint: CGPointMake(365.33, 395.98)];
            [bezier3Path addCurveToPoint: CGPointMake(365.33, 358.84) controlPoint1: CGPointMake(365.33, 395.98) controlPoint2: CGPointMake(365.33, 369.89)];
            [bezier3Path addCurveToPoint: CGPointMake(293.36, 315.67) controlPoint1: CGPointMake(365.33, 347.79) controlPoint2: CGPointMake(336.99, 331.58)];
            [bezier3Path closePath];
            bezier3Path.miterLimit = 4;
            
            CGContextSaveGState(context);
            [bezier3Path addClip];
            CGContextDrawLinearGradient(context, gradient,
                                        CGPointMake(197.25, 340.51),
                                        CGPointMake(199.5, 151.86),
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            CGContextRestoreGState(context);
        }
        
        
        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(336.11, 62.88)];
        [bezier4Path addCurveToPoint: CGPointMake(336.11, 336.12) controlPoint1: CGPointMake(411.56, 138.33) controlPoint2: CGPointMake(411.56, 260.67)];
        [bezier4Path addCurveToPoint: CGPointMake(62.89, 336.12) controlPoint1: CGPointMake(260.66, 411.57) controlPoint2: CGPointMake(138.34, 411.57)];
        [bezier4Path addCurveToPoint: CGPointMake(62.89, 62.88) controlPoint1: CGPointMake(-12.56, 260.67) controlPoint2: CGPointMake(-12.56, 138.33)];
        [bezier4Path addCurveToPoint: CGPointMake(336.11, 62.88) controlPoint1: CGPointMake(138.34, -12.57) controlPoint2: CGPointMake(260.66, -12.57)];
        [bezier4Path closePath];
        [white setStroke];
        bezier4Path.lineWidth = 1;
        [bezier4Path stroke];
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
};



@implementation TestVector

- (void)drawRect:(CGRect)rect
{
    drawTestVector();
}

@end



@implementation ScalableTestVector

- (void)drawInCurrentContext
{
    drawTestVector();
}

- (CGSize)originalSize
{
    return (CGSize){ 400.0f, 400.0f };
}

@end