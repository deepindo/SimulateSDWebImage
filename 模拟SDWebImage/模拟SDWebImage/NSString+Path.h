//
//  NSString+Path.h
//  沙盒目录
//
//  Created by deepindo on 16/8/24.
//  Copyright © 2015年 deepindo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Path)

///  追加文档目录
- (NSString *)appendDocumentPath;
///  追加缓存目录
- (NSString *)appendCachePath;
///  追加临时目录
- (NSString *)appendTempPath;

@end
