//
//  PDDRulesViewController.m
//  PDD
//
//  Created by Sergey Lyubeznov on 28/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "PDDRulesViewController.h"
#import "PDDRuleCell.h"
#import "PDDRuleDetailViewController.h"
#import "PDDUtils.h"
#import "PDDRules.h"
#import "PDDRule.h"

static NSString *const kPDDRuleDetailController  = @"PDDRuleDetailViewController";



@interface PDDRulesViewController ()

@property (strong, nonatomic) PDDRules *rules;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PDDRulesViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.rules = [[PDDRules alloc] init];
    
    self.navigationItem.title = @"Правила";
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0f;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.rules.rules count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    PDDRule *rule = [self.rules.rules objectAtIndex:indexPath.row];
    
    cell.textLabel.text = rule.name;
    
    return cell;

}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *main = mainStoryboard();
    
    PDDRuleDetailViewController *vc = [main instantiateViewControllerWithIdentifier:kPDDRuleDetailController];
    
    vc.rule = [self.rules.rules objectAtIndex:indexPath.row];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.backBarButtonItem = backButton;
    
    [self.navigationController pushViewController:vc animated:YES];
}



@end
