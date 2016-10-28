//
//  HMDownloadImageManager.m
//  模拟SDWebImage
//
//  Created by deepindo on 16/8/24.
//  Copyright © 2016年 deepindo. All rights reserved.
//

#import "HMDownloadImageManager.h"
#import "HMDownloadImageOperation.h"
#import "NSString+Path.h"


@interface HMDownloadImageManager ()


@property(nonatomic,strong)NSOperationQueue *queue;

@property(nonatomic,strong)NSMutableDictionary *operationCache;

@property(nonatomic,strong)NSMutableDictionary *imageCache;


@end

@implementation HMDownloadImageManager



-(NSOperationQueue *)queue
{
    if (!_queue)
    {
        _queue = [[NSOperationQueue alloc]init];
    }
    return _queue;

}

-(NSMutableDictionary *)operationCache
{
    if (!_operationCache)
    {
        _operationCache = [NSMutableDictionary dictionary];
    }
    return _operationCache;
    
}

-(NSMutableDictionary *)imageCache
{
    if (!_imageCache)
    {
        _imageCache = [NSMutableDictionary dictionary];
    }
    return _imageCache;

}

+(instancetype)sharedManager{
    
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });

    
    return instance;
}




-(void)downloadWithImageUrlString:(NSString *)imageUrlStr andBlock:(void(^)(UIImage *))returnImageBlock
{
    UIImage *cacheImage = self.imageCache[imageUrlStr];
    if (cacheImage)
    {
        NSLog(@"内存缓存");
        returnImageBlock(cacheImage);
        return;
    }
    else
    {
        UIImage *sanBoxImage = [UIImage imageWithContentsOfFile:[imageUrlStr appendCachePath]];
        
        if (sanBoxImage)
        {
            NSLog(@"沙盒缓存");
            
            returnImageBlock(sanBoxImage);
            
            [self.imageCache setObject:sanBoxImage forKey:imageUrlStr];
            
            return;

        }
        
    }
    /************************************下载******************************************************/
    //实例化HMDownloadImageOperation
    HMDownloadImageOperation *downloadOperation = [HMDownloadImageOperation operationWithImageUrlString:imageUrlStr andBlock:^(UIImage *image) {
        
        //显示图片
//        self.imageView.image = image;
        returnImageBlock(image);
        
        [self.imageCache setObject:image forKey:imageUrlStr];
        
#warning 上面显示完,就可以删除操作缓存????????
        [self.operationCache removeObjectForKey:imageUrlStr];
        
    }];
    
    //将操作添加到队列
    [self.queue addOperation:downloadOperation];
    
    //将下载操作加入操作缓存
    [self.operationCache setObject:downloadOperation forKey:imageUrlStr];



}


-(void)cancelDownloadingWithImageUrlString:(NSString *)imageUrlStr
{

    //获取之前的下载操作
    HMDownloadImageOperation *previourOP = self.operationCache[imageUrlStr];
    
    //这里不能让操作停止,只是改变操作的状态
    [previourOP cancel];

}
@end
