//
//  HMDownloadImageManager.h
//  模拟SDWebImage
//
//  Created by deepindo on 16/8/24.
//  Copyright © 2016年 deepindo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HMDownloadImageManager : NSObject

-(void)downloadWithImageUrlString:(NSString *)imageUrlStr andBlock:(void(^)(UIImage *))returnImageBlock;
-(void)cancelDownloadingWithImageUrlString:(NSString *)imageUrlStr;
+(instancetype)sharedManager;

@end
