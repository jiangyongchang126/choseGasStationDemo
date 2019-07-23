//
//  DevelopTwoController.m
//  choseGasStation
//
//  Created by 蒋永昌 on 2019/7/22.
//  Copyright © 2019 蒋永昌. All rights reserved.
//

#import "DevelopTwoController.h"
#import "DevelopThreeController.h"

@interface DevelopTwoController ()

@end

@implementation DevelopTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"two";

    self.view.backgroundColor = [UIColor cyanColor];

    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    DevelopThreeController *de = [[DevelopThreeController alloc]init];
    [self.navigationController pushViewController:de animated:YES];
    
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
