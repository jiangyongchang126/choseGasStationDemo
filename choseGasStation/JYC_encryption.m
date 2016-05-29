//
//  JYC_encryption.m
//  choseGasStation
//
//  Created by 蒋永昌 on 16/5/27.
//  Copyright © 2016年 蒋永昌. All rights reserved.
//

#import "JYC_encryption.h"

@interface JYC_encryption ()

// 全局的字典
@property(nonatomic,copy)NSMutableDictionary *dict;

@property(nonatomic,copy)NSMutableString *chineseStr;

@end


@implementation JYC_encryption


-(NSMutableString *)wendToEncryPtionWithString:(NSString *)str{
    
    //
//    self.dictArray = [NSMutableArray array];
    
    // 初始化字典
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    // 获取str.length个随机数数组（0到10000）
    NSMutableArray *numberArray = [self getHowManyNumberCount:str.length fromZeroToNumber:10000];
    
    // 获取由10000个汉子随机组合的字符串
    NSMutableString *mutableStr = [self appendStringWithCHINESEwithNumber:10000];

    NSLog(@"mutableStr:%@",mutableStr);
    NSLog(@"length:%ld",mutableStr.length);
    
    // 给字典赋值
    for (NSInteger i = 0; i < str.length; i++) {
        
        NSString *string = [NSString stringWithFormat:@"%ld",i];
        
        [dict setValue:numberArray[i] forKey:string];
        
        [mutableStr replaceCharactersInRange:NSMakeRange([numberArray[i] integerValue], 1) withString:[str substringWithRange:NSMakeRange(i, 1)]];

    }
    
//    self.dict = dict;
    
    
    
    [dict writeToFile:@"/Users/jiangyongchang/Desktop/key.plist" atomically:YES];
    
//    self.chineseStr = mutableStr;
    
    [mutableStr writeToFile:@"/Users/jiangyongchang/Desktop/string.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    return mutableStr;
    
    
}

-(NSMutableString *)getStrFromEncryPtionWithKey{
    
    if (![self.dict valueForKey:@"0"]) {
        
        NSLog(@"未获得密匙");
        
        return nil;
    }else{
    
    NSMutableString *mutableStr = [NSMutableString string];
    
    for (NSInteger i = 0; i < self.dict.count; i++) {
        
        NSString *str = [NSString stringWithFormat:@"%ld",i];
        
        NSInteger index = [[self.dict valueForKey:str] integerValue];
        
        [mutableStr appendString:[self.chineseStr substringWithRange:NSMakeRange(index, 1)]];
        
    }
    
    
    return mutableStr;
    }
}

// 得到从0到number之间不重复的随机数 count个

-(NSMutableArray *)getHowManyNumberCount:(NSInteger)count fromZeroToNumber:(NSInteger)number{
    
    
    
    NSMutableArray *numberArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < number; i++) {
        NSString *str = [NSString stringWithFormat:@"%ld",i];
        [numberArray addObject:str];
        
    }
    
    
    NSMutableArray *countArray = [NSMutableArray array];
    
    for (NSInteger j = 0; j < count; j++) {
        
        NSInteger index = arc4random()%(number+1);
        
        [countArray addObject:numberArray[index]];
        
        [numberArray removeObjectAtIndex:index];
        
        number--;
        
    }
    
    
    return countArray;
    
}

// 拼接一个number个随机汉子的字符串
- (NSMutableString *)appendStringWithCHINESEwithNumber:(NSInteger)num{
    
    NSMutableString *mutableString = [NSMutableString string];
    
    for (NSInteger i = 0; i < num;i++){
        
        NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSInteger randomH = 0xA1+arc4random()%(0xFE - 0xA1+1);
        NSInteger randomL = 0xB0+arc4random()%(0xF7 - 0xB0+1);
        NSInteger number = (randomH<<8)+randomL;
        NSData *data = [NSData dataWithBytes:&number length:2];
        NSString *string = [[NSString alloc] initWithData:data encoding:gbkEncoding];
//        NSLog(@"%@",string);
        
        [mutableString appendString:string];
    }
    
    return mutableString;
}


-(NSMutableDictionary *)dict{
    
    if (!_dict) {
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"key" ofType:@"plist"];
                
        // JSON 解析
        
        NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:filePath];
        
        NSLog(@"dic:%@",dic);
        
        _dict = [[NSMutableDictionary alloc]initWithDictionary:dic];
    }
    
    return _dict;
}

-(NSMutableString *)chineseStr{
    
    if (!_chineseStr) {
        
        NSString *fileP = [[NSBundle mainBundle] pathForResource:@"string" ofType:@"txt"];
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"string" ofType:@"txt"];

        NSData *data = [NSData dataWithContentsOfFile:fileP];
        
//        NSString *str = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        _chineseStr = [[NSMutableString alloc]initWithString:str];
        
    }
    
    return _chineseStr;
}


@end
