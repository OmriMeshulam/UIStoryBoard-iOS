//
//  OGMPalleteViewController.m
//  Colorboard
//
//  Created by Omri Meshulam on 3/25/15.
//  Copyright (c) 2015 Omri Meshulam. All rights reserved.
//

#import "OGMPalleteViewController.h"
#import "OGMColorViewController.h"
#import "OGMColorDescription.h"

@interface OGMPalleteViewController ()

@property (nonatomic) NSMutableArray *colors;

@end

@implementation OGMPalleteViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    OGMColorDescription *color = self.colors[indexPath.row];
    cell.textLabel.text = color.name;
    
    return cell;
}

- (NSMutableArray *)colors
{
    if (!_colors){
        _colors = [NSMutableArray array];
        
        OGMColorDescription *cd = [[OGMColorDescription alloc]init];
        [_colors addObject:cd];
    }
    return _colors;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"NewColor"]){
        // If we are adding a new color, create an instance
        // and add it to the colors array
        OGMColorDescription *color = [[OGMColorDescription alloc]init];
        [self.colors addObject:color];
        
        // Then use the segue to set the color on the view controller
        UINavigationController *nc = (UINavigationController *)segue.destinationViewController;
        OGMColorViewController *mvc = (OGMColorViewController *)[nc topViewController];
        mvc.colorDescription = color;
    }
    else if ([segue.identifier isEqualToString:@"ExistingColor"]){
        // For the push seque, the sender is the UITableViewCell
        NSIndexPath *ip = [self.tableView indexPathForCell:sender];
        OGMColorDescription *color = self.colors[ip.row];
        
        // Set the color, and also tell the view controller that this is an existing color
        OGMColorViewController *cvc = (OGMColorViewController *)segue.destinationViewController;
        cvc.colorDescription = color;
        cvc.existingColor = YES;
    
    }
}

@end
