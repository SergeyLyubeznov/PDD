//
//  PDDTicketsViewController.m
//  PDD
//
//  Created by Sergey Lyubeznov on 30/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "PDDTicketsViewController.h"
#import "PDDTicketCell.h"
#import "PDDUtils.h"
#import "PDDTicketDetailViewController.h"

static NSString *const kPDDTicketDetailViewController = @"PDDTicketDetailViewController";

@interface PDDTicketsViewController ()

@property (strong, nonatomic) NSArray *tickets;

@end

@implementation PDDTicketsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Билеты";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 40;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PDDTicketCell";
    
    PDDTicketCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //cell.numberLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PDDTicketCell *pCell = (PDDTicketCell *)cell;
    
    pCell.numberLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    
    pCell.mainView.layer.cornerRadius = 25.f;
    
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *main = mainStoryboard();
    
  
    PDDTicketDetailViewController *vc = [main instantiateViewControllerWithIdentifier:kPDDTicketDetailViewController];
    
    vc.ticketNumber = indexPath.row + 1;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.backBarButtonItem = backButton;
    
    [self.navigationController pushViewController:vc animated:YES];
    
    

    
}


@end
