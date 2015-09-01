//
//  PDDTabBarViewController.m
//  PDD
//
//  Created by Sergey Lyubeznov on 28/08/15.
//  Copyright © 2015 Sergey Lyubeznov. All rights reserved.
//

#import "PDDTabBarViewController.h"

@interface PDDTabBarViewController () <UITabBarControllerDelegate>

@end

@implementation PDDTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.delegate = self;
    
    //self.tabBar.tintColor  = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
//    //self.tabBarItem
//    switch (self.selectedIndex) {
//        case 0:
//            self.tabBar.tintColor  = [UIColor yellowColor];
//            break;
//        case 1:
//            self.tabBar.tintColor  = [UIColor redColor];
//            break;
//        case 2:
//            self.tabBar.tintColor  = [UIColor greenColor];
//            break;
//        case 3:
//            self.tabBar.tintColor  = [UIColor blackColor];
//            break;
//            
//        default:
//            break;
//    }
}



@end
