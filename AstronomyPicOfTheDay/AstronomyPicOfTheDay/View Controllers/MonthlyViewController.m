//
//  MonthlyViewController.m
//  AstronomyPicOfTheDay
//
//  Created by Chad Parker on 8/13/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

#import "MonthlyViewController.h"
#import "APIController.h"
#import "PicOfTheDay.h"

@interface MonthlyViewController ()

@property (nonatomic) APIController *apiController;

@end

@implementation MonthlyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.apiController = [[APIController alloc] init];

    [self.apiController fetchPicOfTheDay:NSDate.now completion:^(PicOfTheDay * _Nullable picOfTheDay, NSError * _Nullable error) {
        NSLog(@"%@", picOfTheDay.title);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
