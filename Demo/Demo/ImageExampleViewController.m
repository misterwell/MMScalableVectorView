//
//  ImageExampleViewController.m
//  Demo
//
//  Created by Michael Maxwell on 12/9/13.
//  Copyright (c) 2013 Michael Maxwell. All rights reserved.
//

#import "ImageExampleViewController.h"

#import "VectorTestClasses.h"

@interface ImageExampleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *smallerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *mediumImageView;
@property (weak, nonatomic) IBOutlet UIImageView *largeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *xtraLargeImageView;
@end

@implementation ImageExampleViewController

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

    ScalableTestVector *testVector = [[ScalableTestVector alloc] init];
    testVector.contentMode = UIViewContentModeScaleAspectFit;
    self.smallerImageView.image = [testVector getImageWithSize:self.smallerImageView.bounds.size];
    self.mediumImageView.image = [testVector getImageWithSize:self.mediumImageView.bounds.size];
    self.largeImageView.image = [testVector getImageWithSize:self.largeImageView.bounds.size];
    self.xtraLargeImageView.image = [testVector getImageWithSize:self.xtraLargeImageView.bounds.size];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
