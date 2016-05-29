//
//  SelectTableViewCell.h
//  choseGasStation
//
//  Created by 蒋永昌 on 16/5/22.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "Model.h"


@interface SelectTableViewCell : UITableViewCell
{
    UIView *_bgView;
    UILabel *_gasLB;
    UIButton *_btn;
}

@property(nonatomic,strong)Model *model;

@property(nonatomic,copy) void (^BlockClick)(Model *,BOOL );


@end
