//
//  BlueViewController.m
//  SideMenuExample
//
//  Created by developers@buyoo.com on 3/8/15.
//  Copyright (c) 2015 xurxo. All rights reserved.
//

#import "BlueViewController.h"
#import "SWRevealViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Blue View";
    
    [self configureSideMenuButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureSideMenuButton
{
    SWRevealViewController *revealController = [self revealViewController];
    
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Menu-icon.png"]
                                                                         style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
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
