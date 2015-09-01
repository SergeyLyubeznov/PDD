//
//  PDDSignDetailViewController.m
//  PDD
//
//  Created by Sergey Lyubeznov on 29/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "PDDSignsViewController.h"
#import "PDDSignType.h"
#import "PDDSign.h"
#import "PDDSignCell.h"
@interface PDDSignsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PDDSignsViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.signType.name;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100.0f;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.signType.signs count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PDDSignCell";
    
    PDDSignCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    PDDSign *sign = [self.signType.signs objectAtIndex:indexPath.row];
    
    cell.signNameLabel.text = sign.signDescription;
    UIImage *image = [UIImage imageNamed:sign.imageName];
    cell.signImageView.image = image;
    
    return cell;
    
}


@end
