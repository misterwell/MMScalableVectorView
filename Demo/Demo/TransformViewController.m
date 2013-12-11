//
//  NormalVectorDrawingViewController.m
//  Demo
//
//  Created by Michael Maxwell on 12/9/13.
//  Copyright (c) 2013 Michael Maxwell. All rights reserved.
//

#import "TransformViewController.h"

#import "VectorTestClasses.h"

@interface TransformViewController () {
    int animationPhase;
}
@property (weak, nonatomic) TestVector *topView;
@property (weak, nonatomic) ScalableTestVector *bottomView;
@end

@implementation TransformViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGSize viewSize = CGSizeMake(self.view.bounds.size.width/2.0f, self.view.bounds.size.height/4.0f);
    
    
    TestVector *normalVector = [[TestVector alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-viewSize.width)/2.0f,
                                                                            (self.view.bounds.size.height-(2*viewSize.height))/4.0f,
                                                                            viewSize.width, viewSize.height)];
    normalVector.translatesAutoresizingMaskIntoConstraints = YES;
    normalVector.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:normalVector];
    self.topView = normalVector;
    
    ScalableTestVector *scaledVector = [[ScalableTestVector alloc] initWithFrame:CGRectMake(normalVector.frame.origin.x,
                                                                                            CGRectGetMaxY(normalVector.frame)+60.0f,
                                                                                            viewSize.width, viewSize.height)];
    scaledVector.contentMode = UIViewContentModeScaleAspectFit;
    scaledVector.backgroundColor = self.view.backgroundColor;
    scaledVector.translatesAutoresizingMaskIntoConstraints = YES;
    scaledVector.layer.masksToBounds = YES;
    [self.view addSubview:scaledVector];
    self.bottomView = scaledVector;
    
//    CGAffineTransform scale = CGAffineTransformScale(self.topView.transform, 4.0f, 4.0f);
//    self.topView.transform = scale;
//    [self.topView setNeedsDisplay];
//    scale = CGAffineTransformScale(self.bottomView.transform, 4.0f, 4.0f);
//    self.bottomView.transform = scale;
//    [self.bottomView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self applyAnimations];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.topView removeFromSuperview];
    [self.bottomView removeFromSuperview];
}

- (void)applyAnimations
{
    CGFloat animationDuration = 4.0f;
    [UIView animateWithDuration:animationDuration
                          delay:0.0f
                        options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         self.topView.transform = CGAffineTransformMakeScale(4.0f, 4.0f);
                     } completion:nil];
    
    [UIView animateWithDuration:animationDuration
                          delay:animationDuration
                        options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         self.bottomView.transform = CGAffineTransformMakeScale(4.0f, 4.0f);
                     } completion:nil];
}

@end
