//
//  HMDownloadImageOperation.m
//  模拟SDWebImage
//
//  Created by deepindo on 16/8/24.
//  Copyright © 2016年 deepindo. All rights reserved.
//

#import "HMDownloadImageOperation.h"
#import "NSString+Path.h"

@implementation HMDownloadImageOperation


-(void)start
{
    [super start];
}


-(void)main
{
    //断言
    NSAssert(self.returnImageBlock != nil, @"block没有实现,去看看");
    
    //拿到URL字符串, 下载图片
    NSURL *url = [NSURL URLWithString:self.imageUrlStr];
    //模拟网络慢
    [NSThread sleepForTimeInterval:4];
    NSLog(@"下载中...");
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    //存入沙盒
    [data writeToFile:[self.imageUrlStr appendCachePath] atomically:YES];
    
#warning 在耗时任务后面拦截---为何这里是self.外面不是新实例化了一个取消操作么
    if ([self isCancelled]) {
        NSLog(@"拦截");
        return;
    }
    
    UIImage *image = [UIImage imageWithData:data];
    
    //添加到主队列
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        //判断block
        if (self.returnImageBlock)
        {
            self.returnImageBlock(image);
        }
    }];
}

+(instancetype)operationWithImageUrlString:(NSString *)imageUrlStr andBlock:(void(^)(UIImage *))returnImageBlock
{
    
    HMDownloadImageOperation *op = [[HMDownloadImageOperation alloc]init];
    
    op.imageUrlStr = imageUrlStr;
    
    op.returnImageBlock = returnImageBlock;
    
    
    return op;


}

@end
