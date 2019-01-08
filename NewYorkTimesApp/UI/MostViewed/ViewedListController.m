//
//  ViewedListController.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/7/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "ViewedListController.h"
#import "ViewedCell.h"
#import "ViewedModel.h"
#import "ViewedDetailedController.h"
#import "MBProgressHUD.h"
#import <SVPullToRefresh.h>
#import "EmailedModel.h"

@interface ViewedListController () <UITableViewDataSource, UITableViewDelegate> {
    NSURLSessionDataTask *currentDataTask;
    NSArray *dataSource;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation ViewedListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"ViewedCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"ViewedCellID"];
    
    __weak typeof(self) weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf fetchData];
    }];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    [self fetchData];
    
    return self;
}

#pragma mark - Fetch data

- (void)fetchData {
    
    if (!currentDataTask) {
        __weak typeof(self) weakSelf = self;
        
        currentDataTask = [ViewedModel loadDataWithComplitionBlock:^(id data, NSString *errorMessage) {
            
            [weakSelf fetchDataComplitedWithData:data errorMessage:errorMessage];
            
        }];
    }
    
}

- (void)fetchDataComplitedWithData:(id)data
                      errorMessage:(NSString *)errorMessage {
    
    currentDataTask = nil;
    [self.tableView.pullToRefreshView stopAnimating];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    if (errorMessage) {
        hud.mode = MBProgressHUDModeText;
        hud.label.text = errorMessage;
        NSLog(@"%@", errorMessage);
        [hud hideAnimated:YES afterDelay:3];
    } else {
        dataSource = data;
        if (dataSource.count) {
            [hud hideAnimated:YES];
            [self.tableView reloadData];
        } else {
            hud.label.text = @"No data!";
            [hud hideAnimated:YES afterDelay:3];
        }
    }
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ViewedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ViewedCellID"];
    cell.model = dataSource[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ViewedDetailedController *viewedDetailedController = [[ViewedDetailedController alloc] initWithNibName:@"ViewedDetailedController" bundle:nil];
    viewedDetailedController.model = dataSource[indexPath.row];
    [self.navigationController pushViewController:viewedDetailedController animated:YES];
}

@end
