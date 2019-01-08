//
//  MostEmailedListController.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "EmailedListController.h"
#import "MostEmailedCell.h"
#import "EmailedModel.h"
#import "MostEmailedDetailedController.h"
#import "MBProgressHUD.h"
#import <SVPullToRefresh.h>

@interface EmailedListController () <UITableViewDataSource, UITableViewDelegate> {
    NSURLSessionDataTask *currentDataTask;
    NSArray *dataSource;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation EmailedListController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
    }
   
    [self fetchData];
    
    __weak typeof(self) weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        //NSLog(@"PullToRefresh");
        [weakSelf fetchData];
    }];
    
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
    //MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    if (errorMessage) {
        //MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = errorMessage;
        [hud hideAnimated:YES afterDelay:3];
    } else {
        //        [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        dataSource = data;
        //        [self.tableView reloadData];
        if (dataSource.count) {
            //[SVProgressHUD dismiss];
            [hud hideAnimated:YES];
            [self.tableView reloadData];
        } else {
            //[SVProgressHUD showWithStatus:@"Ничего не найдено!"];
            //[SVProgressHUD dismissWithDelay:2];
            hud.label.text = @"Ничего не найдено!";
            [hud hideAnimated:YES afterDelay:3];
        }
    }
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [UITableViewCell new];
    EmailedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmailedCell"];
    cell.model = dataSource[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 150;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}


#pragma mark - Navigation
 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // если переход был инициирован нажатием по ячейке, то мы будем открывать экран просмотра записи, следовательно нужно передать запись в экран просмотра записи
    if ([sender isKindOfClass:[UITableViewCell class]] && [segue.destinationViewController isKindOfClass:[DetailedViewController class]]) {
        //
        NSIndexPath *path = [self.tableView indexPathForCell:sender];
        
        EmailedModel *model = dataSource[path.row];
        
        DetailedViewController *controller = segue.destinationViewController;
        
        controller.model = model;
    }
}

@end


///////////////////////////////////////////////////////////////////
/
#import "ViewController.h"
#import "EmailedModel.h"
//#import "PostamatsServiceController.h"
//#import "PostamatsServiceModel.h"
#import "MBProgressHUD.h"
#import "EmailedCell.h"
//#import "PostamatsListController.h"
#import <SVPullToRefresh.h>
#import "DetailedViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSURLSessionDataTask *currentDataTask;
    NSArray *dataSource;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation ViewController

//- (void)setup {
//    self.title = @"Service List";
//    self.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Postamats" image:nil tag:0];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    currentDataTask = [PostamatsServiceModel loadDataWithComplitionBlock:^(id data, NSString *errorMessage) {
    //        NSLog(@"data %@", data);
    //        NSLog(@"errorMessage %@", errorMessage);
    //    }];
    
    [self fetchData];
    
    __weak typeof(self) weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        //NSLog(@"PullToRefresh");
        [weakSelf fetchData];
    }];
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
    //MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    if (errorMessage) {
        //MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = errorMessage;
        [hud hideAnimated:YES afterDelay:3];
    } else {
        //        [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        dataSource = data;
        //        [self.tableView reloadData];
        if (dataSource.count) {
            //[SVProgressHUD dismiss];
            [hud hideAnimated:YES];
            [self.tableView reloadData];
        } else {
            //[SVProgressHUD showWithStatus:@"Ничего не найдено!"];
            //[SVProgressHUD dismissWithDelay:2];
            hud.label.text = @"Ничего не найдено!";
            [hud hideAnimated:YES afterDelay:3];
        }
    }
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [UITableViewCell new];
    EmailedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmailedCell"];
    cell.model = dataSource[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 150;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // если переход был инициирован нажатием по ячейке, то мы будем открывать экран просмотра записи, следовательно нужно передать запись в экран просмотра записи
    if ([sender isKindOfClass:[UITableViewCell class]] && [segue.destinationViewController isKindOfClass:[DetailedViewController class]]) {
        //
        NSIndexPath *path = [self.tableView indexPathForCell:sender];
        
        EmailedModel *model = dataSource[path.row];
        
        DetailedViewController *controller = segue.destinationViewController;
        
        controller.model = model;
    }
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(ServiceCell *)sender {
//
//    if ([segue.destinationViewController isKindOfClass:[PostamatsListController class]] && [sender isKindOfClass:[ServiceCell class]]) {
//
//        ((PostamatsListController *)segue.destinationViewController).service = sender.model;
//
//    }
//
//}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.destinationViewController isKindOfClass:[DetailedViewController class]]) {
//        DetailedViewController *controller = segue.destinationViewController;
//        controller.model = self.model;
//    }
//}

@end
*/
