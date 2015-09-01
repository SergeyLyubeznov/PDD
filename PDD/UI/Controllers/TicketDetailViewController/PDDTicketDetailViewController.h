//
//  PDDTicketDetailViewController.h
//  PDD
//
//  Created by Sergey Lyubeznov on 30/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDDTicketDetailViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,UITabBarControllerDelegate,UITableViewDataSource>

@property (assign, nonatomic) NSUInteger ticketNumber;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end
