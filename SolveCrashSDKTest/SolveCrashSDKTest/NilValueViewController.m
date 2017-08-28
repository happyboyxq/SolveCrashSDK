//
//  NilValueViewController.m
//  SolveCrashSDKTest
//
//  Created by sky on 2017/8/28.
//  Copyright © 2017年 Appfactory. All rights reserved.
//

#import "NilValueViewController.h"

@interface NilValueViewController ()

@end

@implementation NilValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString * test = nil;
    
    
    NSArray * array1 = @[@"1",@"2",test];
    
    NSLog(@"array1:%@",array1);
    
    NSLog(@"array1---index:%@",[array1 objectAtIndex:3]);
    
    NSDictionary * dic1 = @{@"key1":@"value1",@"key2":test};
    
    NSLog(@"dic1:%@",dic1);
    
    NSMutableArray  * array2 = [NSMutableArray new];
    
    [array2 addObject:@"m1"];
    
    [array2 addObject:test];
    
    
    NSLog(@"array2:%@",array2);
    
    
    NSString * str1 = @"1234567890";
    
    NSLog(@"str1:%@----%@",[str1 substringToIndex:20],[str1 substringFromIndex:30]);
    
    
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
