//
//  HMImageModel.m
//  模拟SDWebImage
//
//  Created by deepindo on 16/8/24.
//  Copyright © 2016年 deepindo. All rights reserved.
//

#import "HMImageModel.h"

@implementation HMImageModel

/**
 *  快速构造方法--对象方法
 *
 *  @param dict 传入的字典数据
 *
 *  @return 返回的当前对象
 */
-(instancetype)initWithDict:(NSDictionary *)dict
{
    //实例化对象
    self = [super init];
    
    //判断对象
    if (self)
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    //返回数据
    return self;
}


/**
 *  快速创建对象的类方法
 *
 *  @param dict 传入的字典数据
 *
 *  @return 返回类
 */
+(instancetype)imageWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

/**
 *  将plist文件转成模型数组
 *
 *  @param plistName 传入的plist文件名
 *
 *  @return 返回的是模型数组
 */
+(NSArray *)imageWithPlistName:(NSString *)plistName
{
    //将plist文件转换成字典数组
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:plistName ofType:@"plist"]];
    
    //声明可变数组
    NSMutableArray *nmArray = [NSMutableArray array];
    
    //遍历数组
    for (NSDictionary *dict in array)
    {
        //将字典全部添加到可变数组
        [nmArray addObject:[[self alloc]initWithDict:dict]];
    }
    
    //返回可变数组
    return nmArray;
}

@end
