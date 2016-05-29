//
//  EncryptionChinese.h
//  EncryptionChinese
//
//  Created by 蒋永昌 on 16/5/28.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryptionChinese : NSObject

// 加密汉字字符串
-(NSMutableString *)wendToEncryPtionWithString:(NSString *)str;

// 解密字符串
-(NSMutableString *)getStrFromEncryPtion;



@end
