//
//  VectorGraphic.m
//
//  Created by Michael Maxwell on 12/6/13.
//  Copyright (c) 2013 Michael Maxwell. All rights reserved.
//

#import "MMVectorGraphic.h"

@interface MMScalableVector ()
@end

@implementation MMScalableVector

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    [self applyCTMTransformsForContext:context forSize:rect.size];
    [self drawInCurrentContext];
    CGContextRestoreGState(context);
}

- (UIImage *)getImageWithSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [self applyCTMTransformsForContext:UIGraphicsGetCurrentContext() forSize:size];
    [self drawInCurrentContext];
    UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return returnImage;
}

- (void)applyCTMTransformsForContext:(CGContextRef)context forSize:(CGSize)viewSize
{
    CGSize graphicSize = [self originalSize];

    switch(self.contentMode)
    {
        case UIViewContentModeScaleToFill:
            // Simple scale
            CGContextScaleCTM(context, viewSize.width/graphicSize.width, viewSize.height/graphicSize.height);
            break;
        case UIViewContentModeScaleAspectFit:
        {
            CGFloat scale = MIN(viewSize.width/graphicSize.width, viewSize.height/graphicSize.height);
            CGContextTranslateCTM(context, (viewSize.width-(graphicSize.width*scale))/2.0f, (viewSize.height-(graphicSize.height*scale))/2.0f);
            CGContextScaleCTM(context, scale, scale);
            break;
        }
        case UIViewContentModeScaleAspectFill:     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
        {
            CGFloat scale = MAX(viewSize.width/graphicSize.width, viewSize.height/graphicSize.height);
            CGContextTranslateCTM(context, (viewSize.width-(graphicSize.width*scale))/2.0f, (viewSize.height-(graphicSize.height*scale))/2.0f);
            CGContextScaleCTM(context, scale, scale);
            break;
        }
        case UIViewContentModeRedraw:              // redraw on bounds change (calls -setNeedsDisplay)
            break;
        case UIViewContentModeCenter:              // contents remain same size. positioned adjusted.
            CGContextTranslateCTM(context, (viewSize.width-graphicSize.width)/2.0f, (viewSize.height-graphicSize.height)/2.0f);
            break;
        case UIViewContentModeTop:
            break;
        case UIViewContentModeBottom:
            CGContextTranslateCTM(context, 0.0f, viewSize.height-graphicSize.height);
            break;
        case UIViewContentModeLeft:
            break;
        case UIViewContentModeRight:
            CGContextTranslateCTM(context, viewSize.width-graphicSize.width, 0.0f);
            break;
        case UIViewContentModeTopLeft:
            break;
        case UIViewContentModeTopRight:
            CGContextTranslateCTM(context, viewSize.width-graphicSize.width, 0.0f);
            break;
        case UIViewContentModeBottomLeft:
            CGContextTranslateCTM(context, 0.0f, viewSize.height-graphicSize.height);
            break;
        case UIViewContentModeBottomRight:
            CGContextTranslateCTM(context, viewSize.width-graphicSize.width, viewSize.height-graphicSize.height);
            break;
    }
}

- (void)drawInCurrentContext
{
    return;
}

- (CGSize)originalSize
{
    return CGSizeZero;
}

@end