//
//  UsingBlocksViewController.m
//  Demo
//
//  Created by Michael Maxwell on 12/17/13.
//  Copyright (c) 2013 Michael Maxwell. All rights reserved.
//

#import <MMScalableVectorView.h>

#import "UsingBlocksViewController.h"
#import "VectorTestClasses.h"

@interface UsingBlocksViewController ()

@end

@implementation UsingBlocksViewController

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
    
    MMScalableVectorView *view1 = [[MMScalableVectorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 300.0f)
                                                                 drawingBlock:drawTestVector
                                                                 originalSize:CGSizeMake(400.0f, 400.0f)];
    view1.backgroundColor = UIColor.whiteColor;
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    
    view1.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:view1];
    
    NSDictionary *views =  NSDictionaryOfVariableBindings(view1);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[view1]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[view1]-|" options:0 metrics:nil views:views]];
    [self.view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
