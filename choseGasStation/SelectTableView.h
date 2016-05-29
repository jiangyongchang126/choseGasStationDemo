//
//  SelectTableView.h
//  choseGasStation
//
//  Created by 蒋永昌 on 16/5/22.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@protocol SelectDelegate <NSObject>

- (void)addModel:(Model *)model isSure:(BOOL)sure;

@end

@interface SelectTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)NSMutableArray *dataTitle;

@property(nonatomic,assign)id<SelectDelegate> Mdelegate;

@end
