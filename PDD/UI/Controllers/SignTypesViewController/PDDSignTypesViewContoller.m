//
//  PDDSignsViewContoller.m
//  PDD
//
//  Created by Sergey Lyubeznov on 28/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "PDDSignTypesViewContoller.h"
#import "PDDSignTypeCell.h"
#import "PDDSignTypes.h"
#import "PDDSignType.h"
#import "PDDUtils.h"
#import "PDDSignsViewController.h"

static NSString *const kPDDSignsViewController  = @"PDDSignsViewController";

@interface PDDSignTypesViewContoller ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) PDDSignTypes *signTypes;
@property (strong, nonatomic) NSArray *markings;

@end

@implementation PDDSignTypesViewContoller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Знаки и разметка";
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0f;
    
    self.signTypes = [[PDDSignTypes alloc] init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
   
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   return section ? 2 : 8;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return section ? @"Разметка": @"Знаки";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PDDSignTypeCell";
    
    PDDSignTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    PDDSignType *signType;
    
    if (indexPath.section) {
        
        signType = [self.signTypes.signTypes objectAtIndex:[self.signTypes.signTypes count] - 2 + indexPath.row];
        
    } else {
        
        signType = [self.signTypes.signTypes objectAtIndex:indexPath.row];
    }
    
    cell.signNameLabel.text = signType.name;
    
    UIImage *image = [UIImage imageNamed:signType.imageName];
    cell.signImageView.image = image;
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *main = mainStoryboard();
    
    PDDSignsViewController *vc = [main instantiateViewControllerWithIdentifier:kPDDSignsViewController];
    
    if (indexPath.section) {
        
        vc.signType = [self.signTypes.signTypes objectAtIndex:[self.signTypes.signTypes count] - 2 + indexPath.row];
        
    } else {
        
        vc.signType = [self.signTypes.signTypes objectAtIndex:indexPath.row];
    }

    
    
    
    [self.navigationController pushViewController:vc animated:YES];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.backBarButtonItem = backButton;
}




@end
