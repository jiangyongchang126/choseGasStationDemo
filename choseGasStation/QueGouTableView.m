//
//  QueGouTableView.m
//  choseGasStation
//
//  Created by 蒋永昌 on 16/5/22.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import "QueGouTableView.h"
#import "TableViewCell.h"

@implementation QueGouTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        
        self.delegate = self;
        self.dataSource = self;
//        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor cyanColor];
        
        
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if (indexPath.row == 0) {
        
        [cell.btn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [cell.btn addTarget:self action:@selector(addAction:) forControlEvents:UIControlEventTouchUpInside];

    }else{
    
        [cell.btn setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
        [cell.btn addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];
    }

    cell.model = self.dataArr[indexPath.row];
    
//    __unsafe_unretained TableViewCell *this = cell;

//    cell.BlockAction = ^{
//        
//        if ([self.myDelegate respondsToSelector:@selector(shouldPushToSelectViewController)]) {
//            
//            [self.myDelegate shouldPushToSelectViewController];
//        }
//    
//    };
    
    return cell;
}

- (void)addAction:(UIButton *)sender{
    
    if ([self.myDelegate respondsToSelector:@selector(shouldPushToSelectViewController)]) {
        
        [self.myDelegate shouldPushToSelectViewController];
    }

}

- (void)deleteAction:(UIButton *)sender{
    

    
    TableViewCell *cell = (TableViewCell *)[[[sender superview] superview] superview];
    
    NSIndexPath *indexPath = [self indexPathForCell:cell];
    
    NSLog(@"%ld",indexPath.row);
    
    [self.dataArr removeObjectAtIndex:indexPath.row];
    
    [self deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
