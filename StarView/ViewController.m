//
//  ViewController.m
//  StarView
//
//  Created by FlyKite on 16/10/31.
//  Copyright © 2016年 FlyKite. All rights reserved.
//

#import "ViewController.h"
#import "StarView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    StarView *view = [[StarView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
