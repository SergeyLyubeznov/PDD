//
//  PDDLearnViewController.m
//  PDD
//
//  Created by Sergey Lyubeznov on 30/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "PDDLearnViewController.h"
#import "PDDLearnCell.h"
#import "PDDUtils.h"
#import "PDDTicketsViewController.h"

static NSString *const kPDDTicketsViewController = @"PDDTicketsViewController";

@interface PDDLearnViewController ()

@property (strong, nonatomic) NSArray *names;
@property (strong, nonatomic) NSArray *images;

@end

@implementation PDDLearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.names = @[@"Билеты",@"Случайный",@"Экзамен"];
    self.images = @[@"tickets_logo.png",@"rand_logo.png",@"pdd_logo.png"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.names count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PDDLearnCell";
    
    
    PDDLearnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.nameLabel.text = [self.names objectAtIndex:indexPath.row];
    
    cell.logoImageView.image = [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *main = mainStoryboard();
    
    UIViewController *vc = nil;
    
    switch (indexPath.row) {
        case 0:
            vc = (PDDLearnViewController *)[main instantiateViewControllerWithIdentifier:kPDDTicketsViewController];
            break;
            
        default:
            break;
    }
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.backBarButtonItem = backButton;

    
    if (vc) {
         [self.navigationController pushViewController:vc animated:YES];
    }
   
    
}

@end
