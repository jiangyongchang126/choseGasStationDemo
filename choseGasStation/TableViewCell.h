//
//  TableViewCell.h
//  choseGasStation
//
//  Created by 蒋永昌 on 16/5/22.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "Model.h"

typedef NS_ENUM(NSUInteger, CellType) {
    chouseType,
    addType,
};

@interface TableViewCell : UITableViewCell

{
    UIView *_bgView;
    UILabel *_gasLB;
}

@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,assign)CellType cellType;
@property(nonatomic,strong)Model *model;

@property(nonatomic,copy) void (^BlockClick)(Model *,BOOL );

@property(nonatomic,copy) void (^BlockAction)(void);

@end
