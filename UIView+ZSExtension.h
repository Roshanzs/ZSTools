//
//  UIView+ZSExtension.h
//  CycleScrollView
//
//  Created by Tony on 15/9/8.
//  Copyright © 2015年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZSExtension)
@property (nonatomic, assign) CGFloat zs_height;
@property (nonatomic, assign) CGFloat zs_width;
@property (nonatomic, assign) CGFloat zs_y;
@property (nonatomic, assign) CGFloat zs_x;
@property (nonatomic, assign) CGPoint zs_origin;
@property (nonatomic, assign) CGSize zs_size;
@property (nonatomic, assign) CGFloat zs_top;
@property (nonatomic, assign) CGFloat zs_left;
@property (nonatomic, assign) CGFloat zs_bottom;
@property (nonatomic, assign) CGFloat zs_right;
@property (nonatomic, assign, readonly) CGPoint zs_bottomLeft;
@property (nonatomic, assign, readonly) CGPoint zs_bottomRight;
@property (nonatomic, assign, readonly) CGPoint zs_topRight;

@end
