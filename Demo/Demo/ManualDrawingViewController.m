//
//  ManualDrawingViewController.m
//  Demo
//
//  Created by Michael Maxwell on 12/17/13.
//  Copyright (c) 2013 Michael Maxwell. All rights reserved.
//

#import <MMScalableVectorView.h>

#import "ManualDrawingViewController.h"
#import "VectorTestClasses.h"


@interface ManualDrawingViewController ()

@end

@implementation ManualDrawingViewController

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
    ManualDrawingView *mainView = [[ManualDrawingView alloc] initWithFrame:CGRectZero];
    mainView.backgroundColor = UIColor.lightGrayColor;
    mainView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:mainView];
    NSDictionary *views = NSDictionaryOfVariableBindings(mainView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[mainView]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[mainView]-|" options:0 metrics:nil views:views]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



@implementation ManualDrawingView

- (void)drawRect:(CGRect)rect
{
    CGRect drawingBounds = self.bounds;
    CGRect currentFrame = CGRectMake(drawingBounds.origin.x, drawingBounds.origin.y, 50.0f, 50.0f);
    MMScalableVectorView *view = [[MMScalableVectorView alloc] initWithFrame:currentFrame drawingBlock:drawTestVector originalSize:TestVectorSize];
    view.contentMode = UIViewContentModeScaleAspectFit;
    do {
        [view drawInFrame:currentFrame];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:currentFrame];
        path.lineWidth = 1.0f;
        [[UIColor whiteColor] setStroke];
        [path stroke];
        
        currentFrame.origin.x += 10.0f;
        currentFrame.origin.y += 30.0f;
        currentFrame.size.width *= 1.25;
        currentFrame.size.height *= 1.25;
        
        NSLog(@"currentFrame = %@, drawingBounds = %@", NSStringFromCGRect(currentFrame), NSStringFromCGRect(drawingBounds));
    } while (CGRectGetMaxX(currentFrame) < CGRectGetMaxX(drawingBounds) && CGRectGetMaxY(currentFrame) < CGRectGetMaxY(drawingBounds));
}

@end
