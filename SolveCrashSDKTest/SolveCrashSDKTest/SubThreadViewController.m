//
//  SubThreadViewController.m
//  SolveCrashSDKTest
//
//  Created by sky on 2018/1/25.
//  Copyright © 2018年 Appfactory. All rights reserved.
//

#import "SubThreadViewController.h"

@interface SubThreadViewController ()

@end

@implementation SubThreadViewController

- (void)viewDidAppear:(BOOL)animated
{
    [NSThread detachNewThreadSelector:@selector(setup) toTarget:self withObject:nil];
}


- (void)setup
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 100, 50)];
    [self.view addSubview:label];
    label.text = @"Test";
    label.textColor = [UIColor whiteColor];
    
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
