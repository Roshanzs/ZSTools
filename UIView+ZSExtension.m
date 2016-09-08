//
//  UIView+ZSExtension.m
//  CycleScrollView
//
//  Created by Tony on 15/9/8.
//  Copyright © 2015年 Tony. All rights reserved.
//

#import "UIView+ZSExtension.h"

@implementation UIView (ZSExtension)
- (CGFloat)zs_height
{
    return self.frame.size.height;
}

- (void)setZs_height:(CGFloat)zs_height
{
    CGRect temp = self.frame;
    temp.size.height = zs_height;
    self.frame = temp;
}

- (CGFloat)zs_width
{
    return self.frame.size.width;
}

- (void)setZs_width:(CGFloat)zs_width
{
    CGRect temp = self.frame;
    temp.size.width = zs_width;
    self.frame = temp;
}


- (CGFloat)zs_y
{
    return self.frame.origin.y;
}

- (void)setZs_y:(CGFloat)zs_y
{
    CGRect temp = self.frame;
    temp.origin.y = zs_y;
    self.frame = temp;
}

- (CGFloat)zs_x
{
    return self.frame.origin.x;
}

- (void)setZs_x:(CGFloat)zs_x
{
    CGRect temp = self.frame;
    temp.origin.x = zs_x;
    self.frame = temp;
}

- (CGPoint) zs_origin
{
    return self.frame.origin;
}

-(void)setZs_origin:(CGPoint)zs_origin{
    CGRect newframe = self.frame;
    newframe.origin = zs_origin;
    self.frame = newframe;
}

// Retrieve and set the size

-(CGSize)zs_size{
    return self.frame.size;
}

-(void)setZs_size:(CGSize)zs_size{
    CGRect newframe = self.frame;
    newframe.size = zs_size;
    self.frame = newframe;
}

- (CGFloat)zs_top
{
    return self.frame.origin.y;
}


-(void)setZs_top:(CGFloat)zs_top{
    CGRect newframe = self.frame;
    newframe.origin.y = zs_top;
    self.frame = newframe;
}

- (CGFloat)zs_left
{
    return self.frame.origin.x;
}


-(void)setZs_left:(CGFloat)zs_left{
    CGRect newframe = self.frame;
    newframe.origin.x = zs_left;
    self.frame = newframe;
}

- (CGFloat) zs_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}


-(void)setZs_bottom:(CGFloat)zs_bottom{
    CGRect newframe = self.frame;
    newframe.origin.y = zs_bottom - self.frame.size.height;
    self.frame = newframe;
}
- (CGFloat) zs_right
{
    return self.frame.origin.x + self.frame.size.width;
}


-(void)setZs_right:(CGFloat)zs_right{
    CGFloat delta = zs_right - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

// Query other frame locations
- (CGPoint) zs_bottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint) zs_bottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint) zs_topRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}

@end
