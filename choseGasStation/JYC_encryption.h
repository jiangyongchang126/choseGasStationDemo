//
//  JYC_encryption.h
//  choseGasStation
//
//  Created by 蒋永昌 on 16/5/27.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYC_encryption : NSObject

// 加密字符串
-(NSMutableString *)wendToEncryPtionWithString:(NSString *)str;

// 解密字符串
-(NSMutableString *)getStrFromEncryPtionWithKey;



@end
