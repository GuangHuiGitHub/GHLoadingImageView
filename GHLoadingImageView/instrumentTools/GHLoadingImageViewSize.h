//
//  GHLoadingImageViewSize.h
//  GHLoadingImageView
//
//  Created by 王光辉 on 15/9/28.
//  Copyright © 2015年 WGH. All rights reserved.
//
/*
 网络加载图片，不用提前设置网络图片的frame，全部是网络图片等比例尺寸
 大于ScrollView宽度的安装等比例缩放，否则等比例显示
 依托SDWebImage框架。
 支持Xcode7.0
 ios7以上版本
 来自：GH 王光辉
 email：ghhoping@163.com
 QQ:595000358
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GHLoadingImageViewSize : NSObject
// 计算网络图片尺寸大小
+(CGSize)downloadImageSizeWithURL:(id)imageURL;
// 给个size返回一个一样大小的图片
+ (UIImage *)getPlaceholdImage:(CGSize)tempSize;
@end
