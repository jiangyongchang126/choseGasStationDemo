//
//  ViewController.m
//  choseGasStation
//
//  Created by 蒋永昌 on 16/5/22.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "Model.h"
#import "SelectViewController.h"
#import "JYC_encryption.h"
#import "libEncryptionChinese/EncryptionChinese.h"

@interface ViewController ()

{
    QueGouTableView *_quoTableView;
    
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray array];
    Model *model = [[Model alloc]init];
    model.stationName = @"卸气点";
    [self.dataArray addObject:model];
    
    
    _quoTableView = [[QueGouTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _quoTableView.myDelegate = self;
    [self.view addSubview:_quoTableView];
    
    
//    JYC_encryption *encryption = [[JYC_encryption alloc]init];
//    
//    NSString *str = @"北国风光，千里冰封，万里雪飘。望长城内外，惟余莽莽；大河上下，顿失滔滔";
//    
//    NSLog(@"原文:%@",str);
    
//    NSLog(@"加密后:%@",[encryption wendToEncryPtionWithString:str]);
    
    
//    NSLog(@"解密后:%@",[encryption getStrFromEncryPtionWithKey]);
    
    
    EncryptionChinese *encryChinese = [[EncryptionChinese alloc]init];
    
    NSString *str = @"北国风光，千里冰封，万里雪飘。望长城内外，惟余莽莽；大河上下，顿失滔滔";
    
    NSLog(@"%@",str);

    NSLog(@"加密后:%@",[encryChinese wendToEncryPtionWithString:str]);
    
    NSLog(@"解密后:%@",[encryChinese getStrFromEncryPtion]);
//
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    
    _quoTableView.dataArr = self.dataArray;
    
    [_quoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view);
        make.left.right.bottom.equalTo(self.view);
        
    }];
    
    [self refushData];

}

-(void)shouldPushToSelectViewController{
    
    SelectViewController *selectVC = [[SelectViewController alloc]init];
    
    selectVC.BlockPassArray = ^(NSMutableArray *array){
        
        for (Model *model in array) {
            
            [self.dataArray addObject:model];
        }
    };
    
    [self.navigationController pushViewController:selectVC animated:YES];
    
}

- (void)refushData{
    
    [_quoTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
