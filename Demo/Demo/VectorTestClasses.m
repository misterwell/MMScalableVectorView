//
//  VectorTestClasses.m
//  VectorPlayground
//
//  Created by Michael Maxwell on 12/6/13.
//  Copyright (c) 2013 Michael Maxwell. All rights reserved.
//

#import "VectorTestClasses.h"

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