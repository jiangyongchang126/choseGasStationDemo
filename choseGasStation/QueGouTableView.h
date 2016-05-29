//
//  QueGouTableView.h
//  choseGasStation
//
//  Created by 蒋永昌 on 16/5/22.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QueGouDelegate <NSObject>

- (void)shouldPushToSelectViewController;
- (void)refushData;

@end

@interface QueGouTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,assign)id<QueGouDelegate> myDelegate;


@end
