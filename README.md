## MMScalableVectorView
Turns static PaintCode or Qwarkee code into a UIView that honors its contentMode property.
<table>
<tr>
<td><div align="center"><b>Before</b></div></td>
<td><div align="center"><b>After</b></div></td>
</tr>
<tr>
<td><img src="http://michaelmaxwell.info/wordpress/wp-content/uploads/2013/12/normalVector.png" width="270px"></td>
<td><img src="http://michaelmaxwell.info/wordpress/wp-content/uploads/2013/12/scaledVector.png" width="270px"></td>
</tr>
</table>


## Installation
#### CocoaPods (coming soon)
	pod "MMScalableVectorView"
#### Manually
Just import MMScalableVectorView.m & .h into your project directly.
#### Requirements
* iOS 4.x or higher
* CoreGraphics framework
* ARC

## Usage
### Using MMScalableVectorView Directly
1. Use `- (id)initWithFrame:(CGRect)frame drawingBlock:(void (^)(void))drawingBlock originalSize:(CGSize)originalSize` to create a new instance of MMScalableVectorView, providing the vector drawing block and original size.
2. Set the object's `contentMode` as desired.
3. Add the view to a view hierarchy or draw it manually using `- (void)drawInFrame:(CGRect)frame`.

### Subclassing
1. Create a new class to represent the graphic, and make sure it inherits from MMScalableVectorView.
2. Implement the following methods:
	1. Paste the Qwarkee/PaintCode drawing code into `drawInCurrentContext`
	2. Implement `originalSize` to return a `CGSize` structure for the native size of the vector graphic.
3. Use the newly created class as a normal UIView, setting the `contentMode` property as desired before the view is drawn. This can be done in Interface Builder or programatically.

## Demo
Run `pod install` inside the Demo folder, then load the Demo workspace & run!

## Future Improvements
1. ~~UIView category with a block-based initializer for one-step creation of vector-backed UIViews.~~
2. Improving drawing when UIView’s transform property is used (?)
3. Unit tests!