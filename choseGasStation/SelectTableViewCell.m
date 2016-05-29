//
//  SelectTableViewCell.m
//  choseGasStation
//
//  Created by 蒋永昌 on 16/5/22.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import "SelectTableViewCell.h"

@implementation SelectTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 4;
        _bgView.layer.masksToBounds = YES;
        [self.contentView addSubview:_bgView];
        
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 4, 5, 4));
        }];
        
        
        _gasLB = [UILabel new];
        _gasLB.backgroundColor = [UIColor clearColor];
        _gasLB.font = [UIFont boldSystemFontOfSize:15];
        [_bgView addSubview:_gasLB];
        
        [_gasLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(_bgView).offset(8);
            make.left.equalTo(_bgView).offset(8);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(200);
        }];
        
        
        
        
//        
//        //
//                switch (self.cellType) {
//                    case chouseType:
//
        
            _btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_bgView addSubview:_btn];


            [_btn setImage:[UIImage imageNamed:@"icon_btn_nogou"] forState:UIControlStateNormal];
            [_btn setImage:[UIImage imageNamed:@"icon_btn_gou"] forState:UIControlStateSelected];
            [_btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
//                        break;
//                    case addType:
//        
//        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_bgView addSubview:_btn];
//        
//        [_btn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
//        [_btn addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
//        
//                        break;
//        
//                    default:
//                        break;
//                }
//        
    
        
    }
    return  self;
}

-(void)layoutSubviews{
    
    _gasLB.text = self.model.stationName;
    
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.right.equalTo(_bgView).offset(-8);
        make.centerY.equalTo(_gasLB);
        
    }];
    
}

- (void)btnAction:(UIButton *)sender{
    
    _btn.selected = !_btn.selected;
    
    
    if (self.BlockClick) {
        
        self.BlockClick(self.model,_btn.selected);
    }
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
