//
//  EmailedListController.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "EmailedListController.h"
#import "EmailedCell.h"
#import "EmailedModel.h"
#import "EmailedDetailedController.h"
#import "MBProgressHUD.h"
#import <SVPullToRefresh.h>

@interface EmailedListController () <UITableViewDataSource, UITableViewDelegate> {
    NSURLSessionDataTask *currentDataTask;
    NSArray *dataSource;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation EmailedListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"EmailedCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"EmailedCellID"];
    
//  [self fetchData];
    
    __weak typeof(self) weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf fetchData];
    }];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
   
    [self fetchData];
    
//    __weak typeof(self) weakSelf = self;
//    [self.tableView addPullToRefreshWithActionHandler:^{
//        [weakSelf fetchData];
//    }];
    
    return self;
}

#pragma mark - Fetch data

- (void)fetchData {
    
    if (!currentDataTask) {
        __weak typeof(self) weakSelf = self;
        
        currentDataTask = [EmailedModel loadDataWithComplitionBlock:^(id data, NSString *errorMessage) {
            
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
    
    EmailedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmailedCellID"];
    cell.model = dataSource[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    EmailedDetailedController *emailedDetailedController = [[EmailedDetailedController alloc] initWithNibName:@"EmailedDetailedController" bundle:nil];
    emailedDetailedController.model = dataSource[indexPath.row];
    [self.navigationController pushViewController:emailedDetailedController animated:YES];
}

@end
