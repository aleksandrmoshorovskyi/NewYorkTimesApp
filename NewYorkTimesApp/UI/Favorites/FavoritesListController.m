//
//  FavoritesListController.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "FavoritesListController.h"
#import "DataManager.h"
#import "FavoritesCell.h"
#import "FavoritesDetailedController.h"

@interface FavoritesListController () <UITableViewDataSource, UITableViewDelegate> {
    NSArray *dataSource;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation FavoritesListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"FavoritesCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"FavoritesCellID"];
}

- (void)viewWillAppear:(BOOL)animated {
    [self fetchData];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    [self fetchData];
    
    return self;
}

- (void)fetchData {
    dataSource = [[DataManager sharedInstance] fetchAllNotes];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FavoritesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavoritesCellID"];
    cell.model = dataSource[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FavoritesDetailedController *favoritesDetailedController = [[FavoritesDetailedController alloc] initWithNibName:@"FavoritesDetailedController" bundle:nil];
    favoritesDetailedController.model = dataSource[indexPath.row];
    [self.navigationController pushViewController:favoritesDetailedController animated:YES];
}

@end
