//
//  PDDRuleDetailViewController.m
//  PDD
//
//  Created by Sergey Lyubeznov on 28/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "PDDRuleDetailViewController.h"
#import "PDDRule.h"

@interface PDDRuleDetailViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PDDRuleDetailViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = self.rule.name;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    
//    NSMutableArray *array = [NSMutableArray array];
//    
//    for (NSDictionary *dict in self.rule.items) {
//        
//        NSArray *allKeys = [dict allKeys];
//        
//        [array addObject:[allKeys firstObject]];
//    }
//    
//    return array;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.rule.items.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSDictionary *dict = [self.rule.items objectAtIndex:section];
    
    NSArray *allKeys = [dict allKeys];
    
    return [allKeys firstObject];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    NSDictionary *dict = [self.rule.items objectAtIndex:indexPath.section];
    NSArray *allKeys = [dict allKeys];
    NSString *key = [allKeys firstObject];
    NSString *text = [dict objectForKey:key];
    
    cell.textLabel.text = text;
    
    return cell;
    
}

@end
