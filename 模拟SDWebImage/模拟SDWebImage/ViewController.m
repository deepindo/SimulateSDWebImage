//
//  ViewController.m
//  模拟SDWebImage
//
//  Created by deepindo on 16/8/24.
//  Copyright © 2016年 deepindo. All rights reserved.
//

#import "ViewController.h"
#import "HMImageModel.h"
#import "UIImageView+HMWebCache.h"

@interface ViewController ()

@property(nonatomic,strong)NSArray *imageArray;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;




@end

@implementation ViewController

#pragma mark -懒加载-第一行的数组名,是重写getter方法,千万不要加_
-(NSArray *)imageArray
{
    if (_imageArray == nil)
    {
        _imageArray = [HMImageModel imageWithPlistName:@"image"];
    }
    return _imageArray;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self showImage];

}

-(void)showImage
{
    //随机选择图片urlStr
    int randomNum = arc4random_uniform((int)self.imageArray.count);
    HMImageModel *model = self.imageArray[randomNum];
    
    [self.imageView downloadImageWithImageUrlStr:model.icon];
    
        
}




@end
