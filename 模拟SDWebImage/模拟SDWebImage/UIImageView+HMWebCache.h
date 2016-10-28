//
//  UIImageView+HMWebCache.h
//  模拟SDWebImage
//
//  Created by deepindo on 16/8/24.
//  Copyright © 2016年 deepindo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (HMWebCache)

//分类中的声明的属性,不会生成getter.setter方法,也不会生成带_的成员变量;
@property(nonatomic,copy)NSString *currentUrlStr;



-(void)downloadImageWithImageUrlStr:(NSString *)imageUrlStr;

@end
