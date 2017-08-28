//
//  KVOViewController.m
//  SolveCrashSDKTest
//
//  Created by sky on 2017/8/28.
//  Copyright © 2017年 Appfactory. All rights reserved.
//

#import "KVOViewController.h"

@interface KVOViewController ()

@property (nonatomic,assign)NSInteger testcount;

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ADDKVO:(id)sender {
    
    
    [self addObserver:self forKeyPath:@"testcount" options:NSKeyValueObservingOptionNew context:nil];
    
}
- (IBAction)DELKVO:(id)sender {

    [self removeObserver:self forKeyPath:@"testcount"];
}
- (IBAction)ChangeValue:(id)sender {
    
    self.testcount += 1;
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    NSLog(@"%ld",(long)self.testcount);
    
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
