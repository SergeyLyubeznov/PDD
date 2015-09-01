//
//  PDDTicketDetailViewController.m
//  PDD
//
//  Created by Sergey Lyubeznov on 30/08/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "PDDTicketDetailViewController.h"
#import "PDDTicketDetailCollectionCell.h"

@interface PDDTicketDetailViewController ()

@property (strong, nonatomic) NSArray *text;
@property (assign, nonatomic) BOOL showTrip;
@property (assign, nonatomic) NSUInteger trueAnswerIndex;
@property (assign, nonatomic) NSUInteger userAnswerIndex;
@property (assign, nonatomic) BOOL trueAnswer;
@property (assign, nonatomic) BOOL userAnswered;
@property (assign, nonatomic) NSUInteger answerNumber;


@property (weak, nonatomic) UITableViewCell *prevCell;
@property (weak, nonatomic) UICollectionViewCell *collectionCell;

@end

@implementation PDDTicketDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [NSString stringWithFormat:@"Билет № %ld",self.ticketNumber];
    
    self.text = @[@"В каких направлениях Вам разрешено продолжить движение?",
                  @"Только Б.",
                  @"Только А или Б.",
                  @"В любых.",
                  @"Знак 4.1.4 разрешает движение только в направлениях, указанных стрелками:\n4.1.4 \"Движение прямо или направо\". Разрешается движение только в направлениях, указанных на знаках стрелками."];
    
    self.showTrip = NO;
    self.trueAnswerIndex = 2;
    self.trueAnswer = NO;
    self.userAnswered = NO;
    self.answerNumber = 1;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 30.0f;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PDDTicketDetailCollectionCell";
    
    PDDTicketDetailCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if (indexPath.row == self.answerNumber - 1) {
        cell.layer.borderWidth = 1.f;
        cell.layer.borderColor = (__bridge CGColorRef)([UIColor whiteColor]);
        cell.backgroundColor = [UIColor whiteColor];
        self.collectionCell = cell;
    }
    
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    return cell;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.userAnswered && self.trueAnswer == NO) {
        return 4;
    } else {
        return 1;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.userAnswered && self.trueAnswer == NO) {
        return 1;
    } else {
        return (self.showTrip)? [self.text count]:[self.text count] - 1;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (self.userAnswered && self.trueAnswer == NO) {
        if (section == 0) {return @"";}
        if (section == 1) {return @"Ваш ответ:";}
        if (section == 2) {return @"Правильный ответ:";}
        if (section == 3) {return @"Комментарий:";}
    }
    
    return @"";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (self.userAnswered && self.trueAnswer == NO) {
        
        if (indexPath.section == 0) {
            cell.textLabel.text = [self.text objectAtIndex:0];
            //cell.backgroundColor = [UIColor redColor];
        }
        if (indexPath.section == 1) {
            cell.textLabel.text = [self.text objectAtIndex:self.userAnswerIndex];
            cell.backgroundColor = [UIColor redColor];
        }
        if (indexPath.section == 2) {
            cell.textLabel.text = [self.text objectAtIndex:self.trueAnswerIndex];
            cell.backgroundColor = [UIColor greenColor];
        }
        if (indexPath.section == 3) {cell.textLabel.text = [self.text objectAtIndex:[self.text count] - 1];}
    } else {
        cell.textLabel.text =   [self.text objectAtIndex:indexPath.row];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return ((indexPath.row == 0 || indexPath.row == [self.text count]-1) || self.userAnswered) ? NO : YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (self.userAnswered) {
        return;
    } else {
        self.userAnswered = YES;
        self.userAnswerIndex = indexPath.row;
    }
    
    self.trueAnswer = indexPath.row == self.trueAnswerIndex;
    
    if (self.prevCell) {
        self.prevCell.backgroundColor = self.prevCell.contentView.backgroundColor = [UIColor clearColor];
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    cell.backgroundColor = cell.contentView.backgroundColor = self.collectionCell.backgroundColor = (self.trueAnswer)? [UIColor greenColor]:[UIColor redColor];
     self.prevCell = cell;
    
    if (!self.trueAnswer) {
        self.showTrip = YES;
        [tableView reloadData];
        self.prevCell.backgroundColor = [UIColor clearColor];
    }
    
}



@end
