//
//  HMWebImageView.m
//  模拟SDWebImage
//
//  Created by deepindo on 16/8/24.
//  Copyright © 2016年 deepindo. All rights reserved.
//

#import "HMWebImageView.h"
#import "HMDownloadImageManager.h"

@interface HMWebImageView ()

@property(nonatomic,copy)NSString *currentUrlStr;

@end

@implementation HMWebImageView

-(void)downloadImageWithImageUrlStr:(NSString *)imageUrlStr
{
    //判断如果新生成的图片urlStr与当前用的是不是一样
    if (![imageUrlStr isEqualToString:self.currentUrlStr])
    {
        //取消下载
        [[HMDownloadImageManager sharedManager] cancelDownloadingWithImageUrlString:imageUrlStr];
        
    }
    
    //赋值
    self.currentUrlStr = imageUrlStr;
    
    
    
    
    //下载图片
    [[HMDownloadImageManager sharedManager] downloadWithImageUrlString:imageUrlStr andBlock:^(UIImage *image) {
        
        self.image = image;
        
    }];


}

@end
