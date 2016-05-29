//
//  SelectViewController.m
//  choseGasStation
//
//  Created by 蒋永昌 on 16/5/22.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import "SelectViewController.h"
#import "Model.h"
#import "Masonry.h"

@interface SelectViewController ()
{
    SelectTableView *_selectTV;
    UIButton *_OKBtn;
}
@property(nonatomic,strong)NSMutableArray *passArray;

@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationItem.title = @"卸气点选择";
    
    
    NSMutableArray *array = @[@"廊坊",@"北京",@"天津"].mutableCopy;
    NSMutableArray *array1 = @[@"新奥站",@"清源站",@"奥卡站"].mutableCopy;
    NSMutableArray *array2 = @[@"哈哈站",@"呵呵站",@"嘿嘿站"].mutableCopy;
    NSMutableArray *array3 = @[@"天津站",@"炉头站",@"手势站"].mutableCopy;
    NSMutableArray *dataArr = [NSMutableArray arrayWithObjects:array1,array2,array3, nil];
    
    NSMutableArray *ModelArray = [NSMutableArray array];
    
    for (int i = 0; i < dataArr.count; i++) {
        
        NSMutableArray *Marray = [NSMutableArray array];
        for (NSString *string in dataArr[i]) {
            
            Model *model = [[Model alloc]init];
            model.stationName = string;
            [Marray addObject:model];
        }
        
        [ModelArray addObject:Marray];
    }

    
    _selectTV = [[SelectTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _selectTV.Mdelegate = self;
    _selectTV.dataTitle = array;
    _selectTV.dataArr = ModelArray;
    
    [self.view addSubview:_selectTV];
    
    [_selectTV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.top.bottom.equalTo(self.view);
        
    }];
    
    
    _OKBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_OKBtn setTitle:@"确定" forState:UIControlStateNormal];
    _OKBtn.backgroundColor = [UIColor redColor];
    [_OKBtn addTarget:self action:@selector(OKAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_OKBtn];
    
    [_OKBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.bottom.equalTo(self.view).offset(-8);
        make.centerX.equalTo(self.view);
        
    }];
    
    self.passArray = [NSMutableArray array];
    
    // Do any additional setup after loading the view.
}

- (void)addModel:(Model *)model isSure:(BOOL)sure{
    
    if (sure) {
        
        [self.passArray addObject:model];
        
    }else{
        
        [self.passArray removeObject:model];
    }

}

- (void)OKAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    self.BlockPassArray(self.passArray);
    NSLog(@"%@",self.passArray);
    
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
