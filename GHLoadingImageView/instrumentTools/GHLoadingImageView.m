//
//  GHLoadingImageView.m
//  GHLoadingImageView
//
//  Created by 王光辉 on 15/9/29.
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
#import "GHLoadingImageView.h"
#import "ViewController.h"
#import "GHLoadingImageViewSize.h"
#import "UIImageView+WebCache.h"
@interface GHLoadingImageView ()
@property (nonatomic, strong)NSArray *pictArray;
@property (nonatomic, strong)NSMutableArray *pictFrameArrayM;
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIImageView *imageViewTemp;
@end
@implementation GHLoadingImageView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}
- (void)setPictArrayTemp:(NSArray *)pictArrayTemp
{
    self.pictArray = pictArrayTemp;
    // 加载图片
    [self loadAllPicts];
    // 遍历图片
    [self creatImageView];
}
#pragma mark - 遍历图片
- (void)creatImageView
{
    [self.pictFrameArrayM enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSValue *value = (NSValue*)obj;
        CGSize imageSize = value.CGSizeValue;
        UIImage *imageTemp = [GHLoadingImageViewSize getPlaceholdImage:imageSize];
        if (imageSize.width > self.frame.size.width) {
            imageSize.height = (self.frame.size.width/imageSize.width)*imageSize.height;
            imageSize.width = self.frame.size.width;
        }
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageViewTemp.frame), imageSize.width, imageSize.height)];
        [imageView sd_setImageWithURL:[self.pictArray objectAtIndex:idx] placeholderImage:imageTemp];
        self.imageViewTemp = imageView;
        imageView.backgroundColor = [UIColor clearColor];
        [self addSubview:imageView];
    }];
    self.contentSize = CGSizeMake(self.frame.size.width, CGRectGetMaxY(self.imageViewTemp.frame));
}
#pragma mark - 加载图片
- (void)loadAllPicts
{
    [self.pictArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGSize size = [GHLoadingImageViewSize downloadImageSizeWithURL:[NSURL URLWithString:obj]];
        NSValue *value = [NSValue valueWithCGSize:size];
        [self.pictFrameArrayM addObject:value];
    }];
}

- (NSMutableArray *)pictFrameArrayM
{
    if (_pictFrameArrayM == nil) {
        _pictFrameArrayM = [NSMutableArray arrayWithCapacity:2];
    }
    return _pictFrameArrayM;
}

@end
