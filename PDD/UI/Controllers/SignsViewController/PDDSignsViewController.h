//
//  PDDSignDetailViewController.h
//  PDD
//
//  Created by Sergey Lyubeznov on 29/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PDDSignType;
@interface PDDSignsViewController : UIViewController <UITabBarDelegate, UITableViewDataSource>

@property (strong, nonatomic) PDDSignType *signType;

@end
