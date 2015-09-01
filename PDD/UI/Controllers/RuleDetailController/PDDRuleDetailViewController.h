//
//  PDDRuleDetailViewController.h
//  PDD
//
//  Created by Sergey Lyubeznov on 28/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PDDRule;

@interface PDDRuleDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) PDDRule *rule;

@end
