//
//  HMImageModel.h
//  模拟SDWebImage
//
//  Created by deepindo on 16/8/24.
//  Copyright © 2016年 deepindo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMImageModel : NSObject

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *icon;

@property(nonatomic,copy)NSString *download;

/**
 *  快速构造方法--对象方法
 *
 *  @param dict 传入的字典数据
 *
 *  @return 返回的当前对象
 */
-(instancetype)initWithDict:(NSDictionary *)dict;


/**
 *  快速创建对象的类方法
 *
 *  @param dict 传入的字典数据
 *
 *  @return 返回类
 */
+(instancetype)imageWithDict:(NSDictionary *)dict;

/**
 *  将plist文件转换成模型数组
 *
 *  @param plistName plist文件名字
 *
 *  @return 返回的是由模型组成的数组
 */
+(NSArray *)imageWithPlistName:(NSString *)plistName;



@end
