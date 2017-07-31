//
//  ZSShowViewTools.h
//  Enjoy-Booking
//
//  Created by 紫贝壳 on 2017/1/6.
//  Copyright © 2017年 tony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface ZSShowViewTools : NSObject

+(instancetype)share;

//MBProgerssHUD(在MBProgressHUD基础上封装的,用之前需要导入MBProgressHUD)
//只显示文字1秒后消失
+(void)showMessage:(NSString *)msg;
//只显示文字,delay秒后消失
+(void)showMessage:(NSString *)msg WithAfterDelay:(NSTimeInterval)delay;
//带网络加载指示图片的
+(void)showProgress:(NSString *)msg;
//带网络加载指示图片的可以取消的
+(void)showProgress:(NSString *)msg withView:(UIView *)Cview;
//带成功的图片 1秒后消失
+(void)showSuccess:(NSString *)msg;
//圆环进度显示
+(MBProgressHUD *)showProgressCircle:(NSString *)msg;
//消失
+(void)hide;


//UIAlretController
//中间一个按钮
+(void)ZSAlartWithOneBtnTitle:(NSString *)title Message:(NSString *)message BtnStr:(NSString *)Btnstr WithCancelBtn:(BOOL)cancelbtn ClickBlock:(void(^)())btnClickBlock;
+(UIAlertController *)ZSAlartDelayWithOneBtnTitle:(NSString *)title Message:(NSString *)message BtnStr:(NSString *)Btnstr WithCancelBtn:(BOOL)cancelbtn ClickBlock:(void(^)())btnClickBlock;
//中间只有一个取消按钮的提示信息
+(void)ZSAlartWithOneBtnTitle:(NSString *)title Message:(NSString *)message;
//底部一个按钮
+(void)ZSAlartWithOneSheetBtnTitle:(NSString *)title Message:(NSString *)message BtnStr:(NSString *)Btnstr WithCancelBtn:(BOOL)cancelbtn ClickBlock:(void(^)())btnClickBlock;
//中间带一个修改框
+(void)ZSAlartWithBoxBtnTitle:(NSString *)title Message:(NSString *)message BtnStr:(NSString *)Btnstr WithCancelBtn:(BOOL)cancelbtn ClickBlock:(void(^)(NSString * str))btnClickBlock;
@end
