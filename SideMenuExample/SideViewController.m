//
//  TableViewController.m
//  SideMenuExample
//
//  Created by developers@buyoo.com on 3/10/15.
//  Copyright (c) 2015 xurxo. All rights reserved.
//

#import "SideViewController.h"
#import "SWRevealViewController.h"
#import "BlueViewController.h"
#import "RedViewController.h"
#import "YellowViewController.h"

@interface SideViewController ()
{
    NSInteger _presentedRow;
}
@end

@implementation SideViewController

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSInteger row = indexPath.row;
    
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *text = nil;
    if (row == 0)
    {
        text = @"Blue View Controller";
    }
    else if (row == 1)
    {
        text = @"Red View Controller";
    }
    else if (row == 2)
    {
        text = @"Yellow View Controller";
    }
    
    cell.textLabel.text = text;
    
    return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Recuperamos el view controller contenedor reveal
    SWRevealViewController *revealController = self.revealViewController;
    
    // selecting row
    NSInteger row = indexPath.row;
    
    if ( row == _presentedRow )
    {
        [revealController setFrontViewPosition:FrontViewPositionLeft animated:YES];
    }
    else
    {
    UIViewController *newFrontController = nil;
    
    if (row == 0){
        BlueViewController *blue = [[BlueViewController alloc] init];
        newFrontController = [[UINavigationController alloc] initWithRootViewController:blue];
    }
    
    else if (row == 1){
        RedViewController *red = [[RedViewController alloc] init];
        newFrontController = [[UINavigationController alloc] initWithRootViewController:red];
    }
    else if ( row == 2 )
    {
        YellowViewController *yellow = [[YellowViewController alloc] init];
        newFrontController = [[UINavigationController alloc] initWithRootViewController:yellow];
    }
    
    [revealController pushFrontViewController:newFrontController animated:YES];
    
    _presentedRow = row;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
