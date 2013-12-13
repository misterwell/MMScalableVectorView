//
//  VectorTestClasses.h
//  VectorPlayground
//
//  Created by Michael Maxwell on 12/6/13.
//  Copyright (c) 2013 Michael Maxwell. All rights reserved.
//

#import "MMScalableVectorView.h"

/**
 *  Example of a traditional UIView subclass that draws the vector image in its drawRect implementation.
 */
@interface TestVector : UIView
@end

/**
 *  Example showing that subclassing the VectorGraphic class will cause the vector graphic to scale according to the contentMode property of the UIView.
 */
@interface ScalableTestVector : MMScalableVectorView
@end