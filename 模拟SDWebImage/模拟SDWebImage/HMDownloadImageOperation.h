//
//  HMDownloadImageOperation.h
//  模拟SDWebImage
//
//  Created by deepindo on 16/8/24.
//  Copyright © 2016年 deepindo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HMDownloadImageOperation : NSOperation

@property(nonatomic,copy)NSString *imageUrlStr;

@property(nonatomic,copy)void(^returnImageBlock)(UIImage *);


+(instancetype)operationWithImageUrlString:(NSString *)imageUrlStr andBlock:(void(^)(UIImage *))returnImageBlock;

@end
