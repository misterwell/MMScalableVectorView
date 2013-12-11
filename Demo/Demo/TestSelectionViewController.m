//
//  TestSelectionViewController.m
//  VectorPlayground
//
//  Created by Michael Maxwell on 12/7/13.
//  Copyright (c) 2013 Michael Maxwell. All rights reserved.
//

#import "TestSelectionViewController.h"

NSString *const CellInfoTitle               = @"title";
NSString *const CellInfoSubtitle            = @"subtitle";
NSString *const CellInfoSegueIdentifier     = @"segue";

@interface TestSelectionViewController ()
{
    NSArray *dataSource;
}
@end

@implementation TestSelectionViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    dataSource = @[
                   @{CellInfoTitle:@"Normal UIView",
                     CellInfoSubtitle:@"How vectors look using simple copy/paste",
                     CellInfoSegueIdentifier:@"ShowNormalVectors"},
                   @{CellInfoTitle:@"Using MMScalableVectorView",
                     CellInfoSubtitle:@"Observe vectors scaling properly!",
                     CellInfoSegueIdentifier:@"ShowImprovedVectors"},
                   @{CellInfoTitle:@"Animations",
                     CellInfoSubtitle:@"Show differences in how animations are handled",
                     CellInfoSegueIdentifier:@"ShowNormalVectorAnimations"},
                   @{CellInfoTitle:@"Convert to UIImage",
                     CellInfoSubtitle:@"Easily convert MMScalableVectorView to UIImage",
                     CellInfoSegueIdentifier:@"ShowImageExamples"}
                   ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *cellInfo = [dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = [cellInfo valueForKey:CellInfoTitle];
    cell.detailTextLabel.text = [cellInfo valueForKey:CellInfoSubtitle];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:[[dataSource objectAtIndex:indexPath.row] valueForKey:CellInfoSegueIdentifier]
                              sender:[self.tableView cellForRowAtIndexPath:indexPath]];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}

@end
