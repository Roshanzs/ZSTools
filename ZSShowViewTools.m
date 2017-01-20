//
//  ZSMBProgressHUD.m
//  Enjoy-Booking
//
//  Created by 紫贝壳 on 2017/1/6.
//  Copyright © 2017年 tony. All rights reserved.
//

#import "ZSShowViewTools.h"

typedef enum{
    ZSMBProgressHUDOnlyText = 0,
    ZSMBProgressHUDOnlyLoading ,
    ZSMBProgressHUDOnlyCircleLoading,
    ZSMBProgressHUDOnlySuccess ,
}StatusMode;

@interface ZSShowViewTools ()
@property(nonatomic,strong)MBProgressHUD *mbp;
@end

@implementation ZSShowViewTools

+(instancetype)share{
    static ZSShowViewTools *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZSShowViewTools alloc] init];
    });
    return instance;
    
}

+(void)showMessage:(NSString *)msg WithMode:(StatusMode)mode{
    UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
    if ([ZSShowViewTools share].mbp != nil) {
        [[ZSShowViewTools share].mbp hideAnimated:YES];
        [ZSShowViewTools share].mbp = nil;
    }
    [ZSShowViewTools share].mbp = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [ZSShowViewTools share].mbp.bezelView.color = [UIColor whiteColor];
    [ZSShowViewTools share].mbp.bezelView.alpha = 0.6;
    [ZSShowViewTools share].mbp.contentColor = [UIColor blackColor];
    [[ZSShowViewTools share].mbp setMargin:30];
    [ZSShowViewTools share].mbp.label.numberOfLines = 0;
    [[ZSShowViewTools share].mbp setRemoveFromSuperViewOnHide:YES];
    [ZSShowViewTools share].mbp.detailsLabel.text = msg;
    [ZSShowViewTools share].mbp.detailsLabel.font = [UIFont systemFontOfSize:14];
    
    switch ((NSInteger)mode) {
        case ZSMBProgressHUDOnlyText:
            [ZSShowViewTools share].mbp.mode = MBProgressHUDModeText;
            break;
            
        case ZSMBProgressHUDOnlyLoading:
            [ZSShowViewTools share].mbp.mode = MBProgressHUDModeIndeterminate;
            break;
            
        case ZSMBProgressHUDOnlyCircleLoading:{
            [ZSShowViewTools share].mbp.mode = MBProgressHUDModeDeterminate;
            break;
        }
        case ZSMBProgressHUDOnlySuccess:
            [ZSShowViewTools share].mbp.mode = MBProgressHUDModeCustomView;
            [ZSShowViewTools share].mbp.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
            break;
            
        default:
            break;
    }
    
}


+(void)showMessage:(NSString *)msg{
    [self showMessage:msg WithMode:ZSMBProgressHUDOnlyText];
    [[ZSShowViewTools share].mbp hideAnimated:YES afterDelay:1.0];
}

+(void)showMessage:(NSString *)msg WithAfterDelay:(NSTimeInterval)delay{
    [self showMessage:msg WithMode:ZSMBProgressHUDOnlyText];
    [[ZSShowViewTools share].mbp hideAnimated:YES afterDelay:delay];
}

+(void)showProgress:(NSString *)msg{
    [self showMessage:msg WithMode:ZSMBProgressHUDOnlyLoading];
}

+(void)showSuccess:(NSString *)msg{
    [self showMessage:msg WithMode:ZSMBProgressHUDOnlySuccess];
    [[ZSShowViewTools share].mbp hideAnimated:YES afterDelay:1.0];
}


+(MBProgressHUD *)showProgressCircle:(NSString *)msg{
    UIView *view = (UIView*)[UIApplication sharedApplication].delegate.window;
    MBProgressHUD *mbp = [MBProgressHUD showHUDAddedTo:view animated:YES];
    mbp.mode = MBProgressHUDModeAnnularDeterminate;
    mbp.label.text = msg;
    return mbp;
}

+(void)hide{
    if ([ZSShowViewTools share].mbp != nil) {
        [[ZSShowViewTools share].mbp hideAnimated:YES];
    }
}


//中间一个按钮
+(void)ZSAlartWithOneBtnTitle:(NSString *)title Message:(NSString *)message BtnStr:(NSString *)Btnstr WithCancelBtn:(BOOL)cancelbtn ClickBlock:(void(^)())btnClickBlock{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:Btnstr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        btnClickBlock();
    }];
    [alert addAction:action];
    
    if (cancelbtn) {
        UIAlertAction *Cancelaction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:Cancelaction];
    }
    //获取到窗口最上层的viewcontroller
    UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
    [view.rootViewController presentViewController:alert animated:YES completion:^{
    }];
}

//底部一个按钮
+(void)ZSAlartWithOneSheetBtnTitle:(NSString *)title Message:(NSString *)message BtnStr:(NSString *)Btnstr WithCancelBtn:(BOOL)cancelbtn ClickBlock:(void(^)())btnClickBlock{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:Btnstr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        btnClickBlock();
    }];
    [alert addAction:action];
    
    if (cancelbtn) {
        UIAlertAction *Cancelaction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:Cancelaction];
    }
    
    //获取到窗口最上层的viewcontroller
    UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
    [view.rootViewController presentViewController:alert animated:YES completion:^{
    }];

}
@end
