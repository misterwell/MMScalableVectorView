//
//  VectorGraphic.h
//
//  Created by Michael Maxwell on 12/6/13.
//  Copyright (c) 2013 Michael Maxwell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  This protocol defines the information needed to make a static vector image scalable.
 */
@protocol VectorGraphicDrawer
@required
/**
 *  Method that draws the vector graphic in the current graphics context. It is assumed that this method will use UIGraphicsGetCurrentContext to get the graphics context to draw the vector to.
 */
- (void)drawInCurrentContext;

/**
 *  Conforming vector drawing classes should define the original vector image size for scaling purposes. This should not include control points for Bézier cubic and quadratic curves
 *
 *  @return Original size of the vector graphic.
 */
- (CGSize)originalSize;
@end

/**
 *  Vector drawing classes should subclass the VectorGraphic class to make their vector images scale based on the UIView.contentMode property.
 */
@interface MMScalableVectorView : UIView <VectorGraphicDrawer>

/**
 *  Designated initializer when using this class directly, rather than subclassing.
 *
 *  @param frame        View's frame
 *  @param drawingBlock Block of code responsible for drawing the vector
 *  @param originalSize The size of vector.
 *
 *  @return An initialized object that can be used as a subview or drawn manually in some other drawRect method.
 */
- (id)initWithFrame:(CGRect)frame drawingBlock:(void (^)(void))drawingBlock originalSize:(CGSize)originalSize;

/**
 *  Performs the drawing block, scaled to the specified frame and according to the receiver's contentMode property.
 *
 *  @param frame Frame to draw the vector in.
 */
- (void)drawInFrame:(CGRect)frame;

/**
 *  Returns a UIImage representation of the receiver. This is useful if you can't pass a UIView to another component, i.e. a UIButton background image.
 *
 *  @param size Desired size of the returned UIImage
 *
 *  @return A UIImage of the vector graphic, scaled according to the contentMode property of the receiver.
 */
- (UIImage *)getImageWithSize:(CGSize)size;
@end
