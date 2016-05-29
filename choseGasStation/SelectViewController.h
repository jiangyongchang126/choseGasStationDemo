//
//  SelectViewController.h
//  choseGasStation
//
//  Created by 蒋永昌 on 16/5/22.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectTableView.h"

@interface SelectViewController : UIViewController<SelectDelegate,UIAlertViewDelegate>

@property(nonatomic,copy)void (^BlockPassArray)(NSMutableArray *array);


@end
