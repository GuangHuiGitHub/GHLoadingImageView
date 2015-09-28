//
//  ViewController.m
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
#import "ViewController.h"
#import "GHLoadingImageView.h"
@interface ViewController ()
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // 基层
    [self creatBaseScrollView];
}
#pragma mark - creatBaseScrollView
- (void)creatBaseScrollView
{
    GHLoadingImageView *ghScrollView = [[GHLoadingImageView alloc] initWithFrame:CGRectMake(14, 64, self.view.frame.size.width - 14*2, self.view.frame.size.height - 64)];
    NSArray *pictArray = @[ @"http://c.hiphotos.baidu.com/image/w%3D2048/sign=396e9d640b23dd542173a068e531b2de/cc11728b4710b9123a8117fec1fdfc039245226a.jpg",
                            @"http://img3.3lian.com/2014/s4/45/d/56.jpg",
                            @"http://d.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=c609f1383801213fcf6646da64d71ae9/4e4a20a4462309f7db4b68f3730e0cf3d7cad62f.jpg",
                            @"http://img4.duitang.com/uploads/item/201403/23/20140323171323_aNfWX.jpeg",
                            @"http://img5.duitang.com/uploads/item/201412/03/20141203193753_ZYHt3.jpeg",
                            @"http://img5.duitang.com/uploads/item/201508/03/20150803143035_Xu8Rk.jpeg",
                            @"http://cdn.duitang.com/uploads/blog/201411/19/20141119215253_LsZaX.thumb.224_0.jpeg",
                            @"http://e.hiphotos.baidu.com/image/w%3D2048/sign=ac1303f0a5efce1bea2bcfca9b69f2de/838ba61ea8d3fd1f7dc8e23c324e251f94ca5ff6.jpg",];
    [ghScrollView setPictArrayTemp:pictArray];
    ghScrollView.showsVerticalScrollIndicator = NO;
    ghScrollView.showsHorizontalScrollIndicator = NO;
    ghScrollView.backgroundColor = [UIColor whiteColor];
    ghScrollView.bounces = YES;
    ghScrollView.pagingEnabled = NO;
    [self.view addSubview:ghScrollView];
}


@end
