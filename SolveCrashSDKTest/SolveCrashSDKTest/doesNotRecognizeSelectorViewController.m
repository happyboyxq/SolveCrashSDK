//
//  doesNotRecognizeSelectorViewController.m
//  SolveCrashSDKTest
//
//  Created by sky on 2017/8/29.
//  Copyright © 2017年 Appfactory. All rights reserved.
//

#import "doesNotRecognizeSelectorViewController.h"

@interface doesNotRecognizeSelectorViewController ()

@end

@implementation doesNotRecognizeSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString * array = [NSString new];
    
    [(NSMutableArray *)array addObject:@"fda"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
