//
//  ViewController.h
//  choseGasStation
//
//  Created by 蒋永昌 on 16/5/22.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QueGouTableView.h"


@interface ViewController : UIViewController<QueGouDelegate>

@property(nonatomic,strong)NSMutableArray *dataArray;

@end

