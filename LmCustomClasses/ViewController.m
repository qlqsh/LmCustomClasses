//
//  ViewController.m
//  LmCustomClasses
//
//  Created by 刘明 on 16/8/27.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "HSTableView.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    HSTableView *tableView = [[HSTableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
