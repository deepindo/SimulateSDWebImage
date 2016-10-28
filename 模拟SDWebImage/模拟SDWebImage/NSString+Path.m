//
//  NSString+Path.m
//  沙盒目录
//
//  Created by deepindo on 16/8/24.
//  Copyright © 2015年 deepindo. All rights reserved.//

#import "NSString+Path.h"

@implementation NSString (Path)

- (NSString *)appendDocumentPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:self.lastPathComponent];
}

- (NSString *)appendCachePath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:self.lastPathComponent];
}

- (NSString *)appendTempPath {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:self.lastPathComponent];
}

@end
